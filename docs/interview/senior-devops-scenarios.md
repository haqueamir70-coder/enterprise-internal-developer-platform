# Senior DevOps / DevSecOps — 8-Year Experience Scenario Bank

Use these prompts to practice concise, evidence-led interview answers. The answer outlines show what a strong response should cover; adapt them to your actual production experience and never claim work you have not performed.

## 1. A production deployment caused a 40% increase in HTTP 5xx errors.

**Strong answer:** Declare incident and quantify user impact; compare error rate, latency and saturation by version/AZ; correlate with deployment; stop rollout or shift traffic back if safe; inspect logs/traces and dependency metrics; validate recovery against SLO; preserve evidence and create corrective actions.

## 2. Terraform plan wants to replace a production database.

Inspect replacement-causing attributes, provider changes, state/workspace, dependencies and data migration impact. Stop apply, confirm backup restore, assess immutable-property constraints, propose a migration or controlled maintenance plan, and require reviewed plan/approval. Lifecycle protection is a guardrail, not the migration plan.

## 3. A pipeline's cloud credentials were leaked.

Revoke/rotate immediately, identify role/session and scope, inspect audit events, invalidate downstream credentials, assess artifacts and infrastructure changes, and notify incident response. Migrate to narrowly scoped OIDC federation and protect workflow permissions.

## 4. EKS nodes are healthy but all application requests time out.

Trace the request path: ingress/load balancer, service endpoints, pod readiness, network policy/security groups, DNS, application thread/connection pools and downstream dependencies. Compare packet/network evidence with application telemetry. Avoid restarting every pod before locating the failing layer.

## 5. A deployment is healthy in staging but fails in production.

Compare configuration, identity, secrets, network policy, data shape/volume, quotas, runtime version and traffic. Use progressive rollout, production-like tests and preflight checks. Do not assume environment parity based only on matching manifests.

## 6. A critical vulnerability is found in a base image used by 70 services.

Identify affected digests and runtime exposure, prioritize internet-facing/critical services and exploitability, publish a patched base image, rebuild and test dependents, promote immutable artifacts and verify deployed digests. Track exceptions with owner and expiry.

## 7. One team deploys privileged containers to a shared cluster.

Contain the workload and assess whether privilege was exercised. Enforce admission policy to block privileged mode, host namespace access and unsafe capabilities; scope RBAC and node isolation. Add policy tests to the golden path and audit existing workloads.

## 8. Your platform team is receiving too many support tickets.

Classify ticket causes, identify repeated toil and friction, improve templates/docs/errors and self-service APIs, publish ownership and SLOs, and measure ticket reduction and developer lead time. Do not respond by adding a portal page without fixing the underlying workflow.

## 9. A regional cloud outage occurs.

Activate the documented incident/DR process, establish affected services and dependencies, communicate known facts, compare recovery options against RTO/RPO, and execute approved failover. Validate data consistency and user journeys, then plan controlled failback after the region stabilizes.

## 10. The Kubernetes cluster is running out of IP addresses.

Inspect subnet free IPs, CNI allocation, pod density, instance ENI limits and scheduling events. Add correctly sized subnet capacity or tune supported CNI features after testing. Include IP consumption in capacity planning and cluster provisioning checks.

## 11. The database is overloaded after scaling application replicas.

Check connection pool multiplication, query volume, slow queries, cache hit ratio, locks and database saturation. Apply backpressure and bounded pools, optimize queries/cache, and consider read replicas or workload separation. Scaling stateless pods can amplify database pressure.

## 12. Your SLO is breached every release.

Analyze error-budget burn and correlate incidents with release changes. Improve canary gates, test coverage, deployment safety and rollback time. If the SLO is unrealistic, renegotiate based on user needs and measured capability rather than silently lowering the target.

## 13. A developer needs production access urgently.

Use an approved break-glass process with time-bound access, strong authentication, ticket/incident reference, least privilege, session audit and post-use review. Do not share credentials or grant permanent administrator access.

## 14. A queue backlog grows continuously.

Measure arrival versus processing rate, oldest-message age, consumer errors, concurrency, downstream throttling and poison messages. Scale consumers only if downstream capacity allows; add backpressure, retry with jitter, DLQ handling and idempotent processing.

## 15. An Argo CD application is OutOfSync and keeps reverting manual changes.

Inspect diff, sync policy, resource ownership and admission mutations. Determine whether the manual change is an emergency mitigation or drift. Make the intended change in Git or restore desired state, and document the emergency reconciliation path.

## 16. A new platform feature increases cloud costs sharply.

Attribute cost to feature/team/resource and identify drivers such as idle environments, NAT, logs, data transfer or oversized compute. Set budgets and per-team visibility, optimize safely, and measure cost per service/deployment or workload unit.

## 17. A critical service has no useful runbook.

Work with the owner to map dependencies, SLOs, dashboards, alerts, common failure modes, safe mitigation, rollback, escalation and recovery validation. Test the runbook in a game day and update it from actual operator feedback.

## 18. A developer wants to bypass security gates to meet a deadline.

Assess risk and business urgency, identify the specific failing control, and use a documented exception with owner, compensating control and expiry if policy permits. Do not disable broad controls or conceal the risk. Follow up with remediation.

## 19. A multi-tenant platform has noisy-neighbor incidents.

Measure resource contention and identify tenant boundaries. Apply quotas, requests/limits, priority classes, topology isolation and workload-specific node pools where justified. Consider separate clusters/accounts for stronger isolation. Balance utilization against blast radius and operational overhead.

## 20. You are asked to migrate 100 VMs from VMware to AWS with minimal downtime.

Discover dependencies, owners, OS, data and network flows; classify by migration wave and risk; establish landing zone, connectivity, identity, security and observability; select rehost/replatform/refactor per workload; replicate and test; rehearse cutover; validate business transactions; retain rollback path until acceptance.

## 21. A certificate expires and causes a production outage.

Restore service with the approved certificate renewal/replacement path, verify full chain, SAN, trust stores and load balancer/ingress configuration. Identify why monitoring failed, automate renewal where possible and alert on expiry thresholds with ownership.

## 22. A release introduces a database schema change incompatible with the previous application version.

Use expand-and-contract migration: add backward-compatible schema, deploy compatible application versions, migrate data, then remove obsolete schema only after all consumers are upgraded. Keep rollback compatibility explicit and test with production-like data.

## 23. A security scanner reports hundreds of findings.

Normalize and deduplicate by package/image/repository, prioritize by exploitability and exposure, identify shared base-image causes, assign owners and SLAs, automate fixes where safe and track risk exceptions. Avoid treating raw finding count as the only security metric.

## 24. A senior engineer disagrees with your architecture.

Make requirements and constraints explicit, compare options using reliability, security, operability, cost and reversibility, and document the decision in an ADR. Run a small experiment for uncertain assumptions. Commit to the agreed decision and revisit when evidence changes.

## 25. How do you prove you are operating at senior level?

Show ownership across design, delivery and operations: decisions and trade-offs, incident leadership, measurable reliability/security improvements, mentoring, automation that reduces toil, and clear communication with product and business stakeholders. Support claims with concrete examples and measurable outcomes.
