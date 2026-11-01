# Terraform & Infrastructure as Code — Interview Q&A

## 1. Two engineers run terraform apply at the same time. What do you do?

**Answer:** First prevent additional applies. Confirm whether the backend supports state locking and whether both runs used the same backend key and workspace. Inspect CI logs, state history/versioning and cloud audit logs. Do not manually edit the state file or run another apply to “fix” it.

If the backend state is valid, rerun `terraform plan` after locking is restored and review drift. If state is damaged, preserve a copy and use the backend's version recovery or Terraform state recovery workflow. Reconcile real infrastructure with state using carefully reviewed `terraform import` or state commands. Run a fresh plan and require peer review before apply.

**Senior point:** Remote state locking serializes state operations for a given state. It does not replace pipeline concurrency controls or protect unrelated state keys.

## 2. How does remote backend state locking work?

The backend coordinates exclusive access while Terraform performs state-changing operations. A competing operation should wait or fail with a lock message. The exact locking mechanism depends on the backend and its configuration.

Use a supported remote backend, enable versioning/recovery where available, restrict state access, and avoid force-unlock unless you have confirmed the lock is stale and identified the owning process. Never delete a lock just because a pipeline is taking longer than expected.

## 3. Plan shows a production database will be destroyed and recreated. What next?

Do not apply. Inspect the plan and identify the exact attribute causing replacement (often marked as forces replacement). Check provider/version changes, immutable properties, variable changes, resource addressing and dependency changes. Confirm backups, restore testing, maintenance window, replication and application compatibility.

Use lifecycle protections such as `prevent_destroy` where appropriate, but do not treat them as a substitute for review. If the change is unintended, correct the configuration or migration strategy. If intentional, document approval, data migration, cutover and rollback. Re-run and review the plan.

## 4. What is Terraform state and why is it sensitive?

State maps Terraform resource addresses to real infrastructure objects and stores attributes needed for planning. It may contain secrets or sensitive outputs. Protect it with encryption at rest, strict IAM/RBAC, private network access where supported, audit logging and versioning. Marking an output sensitive only hides it in some CLI displays; it does not encrypt the value in state.

## 5. What is the difference between refresh, plan and apply?

A plan compares configuration, state and observed remote objects to propose changes. Apply executes an approved plan (or creates a new plan if one was not supplied). Refresh updates Terraform's view of remote objects; modern Terraform normally refreshes during planning unless refresh is disabled. Avoid treating refresh as a repair for incorrect configuration or state.

## 6. How do you manage secrets in Terraform?

Prefer workload identity and secret-manager references over hard-coded values. Do not commit secrets in `.tfvars`, outputs, logs or state. Restrict state access and use CI secret stores or cloud identity federation. Understand that passing a secret into a Terraform resource can still place it in state even when marked sensitive.

## 7. How do you structure reusable Terraform modules?

Separate reusable resource composition from environment-specific configuration. Define typed inputs with validation, meaningful outputs, documented defaults and pinned provider constraints. Keep modules focused, version them, test them and avoid excessive abstraction. Use root modules for environment composition and remote state for shared outputs only where necessary.

## 8. How do you handle Terraform drift?

Run a reviewed plan and determine whether drift is expected, accidental or caused by an emergency manual change. For approved changes, update code to match the intended target or restore infrastructure to code. For emergency changes, document and reconcile promptly. Do not blindly apply a plan that may overwrite a legitimate operational fix.

## 9. What is the difference between count and for_each?

`count` addresses instances by numeric index; removing an element can shift indexes and cause unwanted replacement. `for_each` addresses instances by stable keys and is often preferable for independently named resources. Choose based on identity stability, not syntax preference.

## 10. What are lifecycle meta-arguments?

Examples include `create_before_destroy`, `prevent_destroy`, `ignore_changes` and `replace_triggered_by`. They alter lifecycle behavior. Use them narrowly: `ignore_changes` can hide drift, and `create_before_destroy` may fail where names or quotas prevent parallel resources.

## 11. How do you promote infrastructure across dev, test and production?

Use the same reviewed module versions with separate environment root configurations and isolated state. Promote a tested commit or immutable module version through environments. Use approvals and policy checks for production. Avoid copying state between environments or using one state file for unrelated environments.

## 12. What is a safe Terraform CI pipeline?

A typical flow is format check, init, validate, static security scan, plan, plan artifact review and gated apply. Authenticate with short-lived workload identity/OIDC where supported. Pin tool/provider versions, restrict permissions, protect environments and serialize applies per state. Keep plan artifacts protected because they may expose sensitive values.

## 13. When would you use import?

When an existing resource must become managed by Terraform. Write the intended resource configuration first, import the correct remote ID into the correct address, then plan and reconcile. Import does not automatically create a complete correct configuration.

## 14. What is a data source versus a managed resource?

A managed resource represents an object Terraform creates or manages. A data source reads information about an existing object without managing its lifecycle. Use data sources for discovery, not as a substitute for explicit ownership boundaries.

## 15. How do you handle provider upgrades?

Review changelogs and breaking changes, pin the intended version range, test in a non-production environment and inspect the plan. Upgrade lock files deliberately and validate state compatibility. Never combine a major provider upgrade with unrelated production changes unless the risk is understood.

## 16. What is a module versioning strategy?

Publish immutable versions, use semantic versioning where practical, document breaking changes and pin consumers to tested versions. Avoid floating references to a moving branch for production infrastructure.

## 17. What if Terraform says a resource already exists?

Confirm subscription/account, region, workspace, state key and resource ID. Determine whether it is unmanaged, managed in another state, or a naming collision. Import only if this state should own it. Never delete a real resource merely to make apply pass.

## 18. How do you prevent accidental production changes?

Use protected branches, mandatory code review, plan review, environment approvals, least-privilege identity, policy-as-code, state isolation and apply concurrency controls. Add destructive-change checks, but keep a human review for high-impact resources.
