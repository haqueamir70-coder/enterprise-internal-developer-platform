# Delivery status and evidence

| Workstream | Status | Evidence / next step |
|---|---|---|
| README, architecture diagrams, ADRs and engineering docs | Created | Review SVG and design decisions |
| Threat model, control catalogue, SLO/incident/DR docs | Created | Tailor to actual workload and business objectives |
| Sample Python HTTP service | Implemented in repository | Docker smoke test runs in CI |
| Hardened sample Dockerfile | Implemented in repository | Non-root user, healthcheck, slim base |
| Kubernetes deployment/service/namespace | Implemented in repository | YAML syntax checked in CI; cluster validation pending |
| Kustomize base | Implemented in repository | Apply only to test cluster initially |
| Kyverno starter policies | Implemented in repository | Admission behavior tests pending |
| Argo CD Application manifest | Implemented in repository | Requires Argo CD and cluster access |
| Backstage catalog metadata/template | Starter assets created | GitHub publishing integration must be configured |
| Terraform AWS VPC/EKS foundation | Planned | Implement modules and environment roots |
| Terraform remote state | Planned | Encrypted S3, versioning and lock strategy |
| GitHub Actions AWS OIDC role | Planned | Exact IAM trust conditions and live AWS validation |
| Secrets integration | Planned | External Secrets and rotation test |
| Observability | Design documented | Implement metrics/log/traces and alert tests |
| AWS deployment | Not performed | Requires authorized account and budget |

## Status definitions
- **Created:** Documentation or configuration artifact exists.
- **Implemented in repository:** Executable source/configuration is present, but cloud behavior may still require validation.
- **CI validated:** A GitHub Actions run completed successfully.
- **Cloud validated:** Component was deployed and tested in an AWS account.
- **Planned:** Design intent only.

## Production claim criteria
Repeatable deployment, passing automated tests, tested security controls (including negative cases), working alerts, exercised recovery, documented ownership and approved cost/availability assumptions.

## Important
No AWS resources have been created by this repository work. Kubernetes manifests, policies and GitOps definitions are starter assets; they must be tested against the target cluster and pinned tool versions before production use.
