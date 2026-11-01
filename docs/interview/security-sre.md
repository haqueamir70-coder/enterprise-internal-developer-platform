# Security, DevSecOps, SRE & Production Scenarios — Interview Q&A

## 1. Production latency suddenly increases. What is your response?

Confirm the user impact and scope using service-level indicators: latency percentiles, traffic, errors and saturation. Check recent deployments/configuration changes, dependency health, database and queue latency, infrastructure saturation and regional signals. Mitigate first—rollback, reduce load or fail over if safe—then establish root cause. Validate recovery against user-facing metrics and write a blameless post-incident review.

## 2. Explain SLI, SLO and SLA.

An SLI is a measured indicator of service behavior, such as successful request ratio or p95 latency. An SLO is the target for that indicator over a defined window. An SLA is an external commitment, often with consequences if missed. Define the eligible event population and measurement window precisely.

## 3. What is an error budget?

The error budget is the tolerated unreliability implied by an SLO. If the service consumes it too quickly, teams may slow risky releases and prioritize reliability work. It is a decision mechanism, not a target to intentionally spend.

## 4. A critical secret is exposed in a repository. What do you do?

Treat it as compromised. Revoke or rotate it immediately, identify where it was used, inspect audit logs for misuse, replace dependent credentials, and validate services. Remove it from repository history where appropriate, but understand that history rewriting does not invalidate the secret. Notify the security/incident process and document the exposure.

## 5. How do you implement shift-left security without blocking delivery?

Automate fast, high-signal checks early: secret scanning, dependency scanning, IaC scanning, SAST and policy checks. Use severity thresholds, ownership and remediation SLAs. Provide actionable feedback and exception workflows with expiry and risk acceptance. Reserve deeper runtime and penetration testing for appropriate stages.

## 6. What is least privilege?

Grant only the permissions, resources and duration required for a workload or person to perform its task. Prefer scoped roles, workload identities, short-lived credentials and periodic access review. Avoid broad administrator permissions in pipelines.

## 7. How do you secure cloud workload identity?

Use managed identity or federation (such as OIDC) where supported, scope trust to the exact repository/workflow/environment, grant minimum roles, avoid long-lived keys and audit token use. Validate issuer, subject and audience conditions. A broadly trusted OIDC subject can be as dangerous as a leaked static credential.

## 8. How do you respond to a Kubernetes security finding?

Confirm exploitability and runtime exposure, identify affected images/workloads/nodes, prioritize by severity and context, patch or mitigate, redeploy immutable images and verify running versions. Add admission/runtime controls and prevent recurrence in the build pipeline. Do not assume a scanner finding automatically proves exploitation.

## 9. What is a threat model?

A structured analysis of assets, trust boundaries, entry points, threat actors, abuse cases, impact and mitigations. Revisit it when architecture or data flows change. In this IDP, consider repository compromise, poisoned build actions, stolen deployment identity, malicious templates, cluster privilege escalation and secrets exposure.

## 10. How do you design disaster recovery?

Define business impact, RTO and RPO with stakeholders. Identify dependencies and recovery order, backups and replication, identity/DNS/network prerequisites, infrastructure-as-code, runbooks and communication. Test restoration and failover regularly; an untested backup is not a proven recovery capability.

## 11. Explain RTO and RPO.

RTO is the target maximum time to restore a service after disruption. RPO is the target maximum data loss measured in time. They are business requirements that influence architecture, replication, backup frequency and cost.

## 12. A deployment passes CI but fails in production. Why?

CI validates only the conditions it tests. Production may differ in configuration, secrets, data volume, permissions, network paths, dependencies, traffic patterns or runtime limits. Improve parity, contract/integration testing, progressive delivery, observability and release health gates.

## 13. How do you conduct a blameless postmortem?

Document timeline, impact, detection, response, contributing conditions and what made the incident possible. Focus on system improvements rather than individual blame. Assign owners and due dates to corrective actions and track whether they reduce recurrence or improve detection.

## 14. How do you prioritize vulnerabilities?

Consider exploitability, exposure, asset criticality, privilege required, known exploitation, compensating controls and business impact—not CVSS alone. Set remediation deadlines by risk, verify fixes and document exceptions with expiry.

## 15. What is a zero-trust approach?

Do not assume trust based only on network location. Authenticate and authorize each access, use least privilege, verify device/workload posture where applicable, segment networks, encrypt traffic and continuously evaluate signals. Zero trust is an operating model, not a single product.

## 16. A cloud bill suddenly doubles. How do you investigate?

Compare cost by service, account, region, tag, usage type and time. Correlate the change with deployments, autoscaling, data transfer, idle resources, storage growth and logging volume. Validate whether usage is legitimate before stopping resources. Apply budgets, anomaly alerts, ownership tags, rightsizing and architectural fixes.

## 17. How do you handle a failed database migration?

Stop further rollout and assess whether the migration partially committed. Preserve logs and backups, check schema/data state, and coordinate application compatibility. Prefer forward-fix or a tested rollback plan; never blindly rerun a non-idempotent migration. Validate data integrity before reopening traffic.

## 18. How do you prove a service is healthy?

Combine synthetic/user journey checks, request success and latency, saturation, dependency health, queue age, error logs and business-level signals. A green pod or load balancer health check alone does not prove the user journey works.

## 19. What should an incident runbook contain?

Service owner, impact criteria, dashboards, alerts, dependency map, diagnostic commands, safe mitigation steps, rollback/failover instructions, escalation contacts, communication templates and post-recovery checks. Include warnings for destructive commands and keep the runbook tested.

## 20. Describe a good senior engineer response to an outage.

Take ownership of coordination, communicate facts and uncertainty, protect users, delegate parallel investigations, keep a timeline, make reversible decisions and verify recovery. Afterward, improve the system so the same failure is less likely or detected sooner.
