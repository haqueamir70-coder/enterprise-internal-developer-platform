# Delivery status and evidence

This is the source of truth for implementation claims.

| Workstream | Status | Evidence / next step |
|---|---|---|
| README and project positioning | Created | Review project overview |
| Architecture SVGs | Planned until committed | Inspect diagrams |
| Threat model and security controls | Planned | Tailor to target workloads |
| Terraform VPC/EKS foundation | Planned | Implement modules and environment roots |
| Remote state bootstrap | Planned | Encrypted S3, versioning, lock design |
| Sample workload | Planned | Non-root service, tests, probes |
| GitHub Actions OIDC | Planned | Exact IAM trust conditions |
| Argo CD and Helm | Planned | Validate sync and rollback |
| Kyverno | Planned | Admission policy negative tests |
| Backstage | Planned | Catalogue and template validation |
| Secrets integration | Planned | External Secrets and rotation test |
| Observability | Planned | Metrics, dashboards and alert tests |
| AWS deployment | Not performed | Requires authorized account and budget |

## Status definitions
Created means artifact exists. Locally validated means named local check passed. CI validated means GitHub Actions run passed. Cloud validated means deployed and tested in an AWS account. Planned means design intent only.

## Production claim criteria
Repeatable deployment, passing automated tests, tested security controls (including negative cases), working alerts, exercised rollback/restore, documented ownership and approved cost/availability/recovery assumptions.

## Next milestone
M1: AWS network and EKS foundation, including Terraform fmt/validate, static security scan, private endpoint decisions, IAM boundaries, encryption, control-plane logs and cost tags. No AWS resources were created by the documentation foundation.
