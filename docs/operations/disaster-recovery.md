# Disaster recovery design

RTO (Recovery Time Objective) and RPO (Recovery Point Objective) must be set by service owners and business stakeholders; this project does not assume universal targets.

## Failure domains
Availability Zone/subnet outage; EKS worker or cluster configuration failure; regional AWS disruption; Terraform state loss; registry/GitOps source unavailable; accidental deletion or compromised deployment identity.

| Component | Recovery approach | Test |
|---|---|---|
| Source/GitOps config | Protected version-controlled history | Restore known-good commit |
| Terraform state | Encrypted remote state and versioning | Recover prior version in isolated test |
| Container images | Retention/replication by recovery region | Pull approved digest |
| Kubernetes workloads | Recreate from IaC and GitOps | Recreate in non-production |
| Application data | Service-specific backup/restore | Timed restore and integrity check |
| Secrets | Managed recovery and rotation | Rotate and verify consumers |

## Exercise
Choose scenario and success criteria; obtain approval; capture baseline; test in non-production; measure recovery time/data loss; record evidence and remediate gaps.
