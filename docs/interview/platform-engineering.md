# CI/CD, GitOps & Platform Engineering — Interview Q&A

## 1. What is an Internal Developer Platform (IDP)?

An IDP provides paved roads for developers to provision infrastructure, create services, deploy safely and observe workloads through consistent self-service workflows. It combines portal/catalogue, templates, CI/CD, GitOps, policy, secrets and observability. The goal is lower cognitive load and safer delivery—not merely building a portal UI.

## 2. What is the difference between a developer portal and an IDP?

A portal is an interface and discovery layer. An IDP is the broader set of workflows, APIs, automation, infrastructure and guardrails behind that interface. Backstage can provide the portal/catalogue experience, but it does not automatically provision secure production infrastructure.

## 3. What is a golden path?

A supported, opinionated template for a common task, such as creating a service with repository, pipeline, deployment manifests, policy and monitoring. It should be easy to adopt but allow documented escape hatches for justified exceptions. Measure adoption, lead time, failure rate and developer feedback.

## 4. How would you design a self-service service creation workflow?

A developer selects a template, provides validated metadata, and the platform creates a repository and baseline code, CI workflow, ownership metadata, deployment configuration and documentation. Provisioning uses least-privilege identity and policy checks. Require approval for privileged or cost-impacting resources and record audit events.

## 5. How do you design a secure CI/CD pipeline?

Use short-lived identity federation, least-privilege job permissions, protected branches, isolated runners, pinned actions, dependency and secret scanning, artifact provenance, image scanning, policy gates and environment approvals. Separate build from deploy permissions and prevent untrusted pull requests from accessing deployment secrets.

## 6. What is the difference between CI and CD?

Continuous Integration frequently merges and validates changes through automated builds and tests. Continuous Delivery keeps changes deployable with a controlled release decision. Continuous Deployment automatically releases every change that passes the required controls. Teams should state which model they operate.

## 7. How does Argo CD work?

Argo CD observes Git repositories and Kubernetes clusters, compares desired manifests with live resources, and reports sync/health status. Depending on configuration, it can automatically reconcile changes or require manual sync. Secure repository credentials, project boundaries, RBAC and sync policies.

## 8. What is drift in GitOps?

Drift is a difference between the desired state in Git and the live cluster state. The controller reports and may reconcile it. Investigate whether the live change was an emergency fix, controller mutation or unauthorized change, then update Git or restore the declared state.

## 9. How do you manage secrets in GitOps?

Do not commit plaintext secrets. Use an external secret manager and an approved controller/integration, or encryption workflows with tightly controlled decryption keys. Restrict who can modify secret references and who can read resulting Kubernetes secrets. Remember that Kubernetes Secret objects are base64-encoded, not inherently encrypted by base64.

## 10. How do you prevent a bad release reaching production?

Use automated tests, static analysis, vulnerability scanning, policy checks, staged environments, canary or blue/green rollout, health gates, SLO-based rollback signals and approval for high-risk changes. Ensure rollback is compatible with database and API changes.

## 11. What deployment strategy would you choose?

Rolling updates are operationally simple but may expose mixed versions. Blue/green provides fast traffic switching but needs extra capacity and compatible data changes. Canary limits exposure and provides progressive validation but requires reliable metrics and routing. Choose based on risk, state compatibility, traffic control and cost.

## 12. What metrics measure platform success?

Track developer lead time, deployment frequency, change failure rate, time to restore, golden-path adoption, template success rate, provisioning time, platform availability, support burden and developer satisfaction. Avoid measuring portal clicks alone.

## 13. How would you onboard an existing service to the platform?

Inventory ownership, runtime, dependencies, deployment process, security posture and SLOs. Map the service to a golden path incrementally. Start with catalogue metadata and standard CI, then add policy, GitOps, secrets and observability. Do not force a risky big-bang migration.

## 14. How do you handle pipeline bottlenecks?

Measure queue time, runner utilization, dependency download time, test duration and deployment wait time. Use caching carefully, parallelize independent tests, right-size runners and split fast feedback from deeper checks. Preserve reproducibility and isolation.

## 15. How do you secure GitHub Actions?

Set minimal workflow permissions, pin third-party actions to immutable commit SHAs where practical, protect environments, restrict secrets, use OIDC for cloud access, isolate self-hosted runners and treat pull-request code as untrusted. Avoid running privileged deployment workflows on arbitrary fork code.

## 16. What is software supply-chain security?

It protects source, dependencies, build systems, artifacts and deployment provenance. Controls include dependency pinning, SBOM generation, vulnerability scanning, artifact signing/verification, trusted builders, provenance attestations and controlled promotion.
