# Platform threat model

## Scope and assets
Covers developer portal, source-control automation, Terraform, container supply chain, EKS runtime, secrets and observability. Assets include IAM trust, Terraform state, source/artifacts/images/SBOMs, Kubernetes API/secrets, GitOps configuration and telemetry/audit records.

## Trust boundaries
1. Developer workstation to source control.
2. GitHub Actions runner to AWS via OIDC.
3. Build pipeline to ECR.
4. Argo CD to Kubernetes API.
5. Workload identity to AWS APIs and Secrets Manager.
6. Workload telemetry to observability backend.

## Threats and mitigations

| Threat | Mitigation |
|---|---|
| CI credential theft | OIDC federation; no static AWS keys |
| Over-privileged automation | Scoped trust and least-privilege IAM |
| Malicious dependency/image | Pinned dependencies, scans, SBOM, signature verification |
| Unreviewed production change | Protected branches, CODEOWNERS, GitOps |
| Privileged pod/container escape | Admission policy, non-root, seccomp, restricted capabilities |
| Secret exposure | Secrets Manager, scanning, redaction and rotation |
| Network lateral movement | Segmentation, NetworkPolicy and restricted egress |
| Terraform state disclosure | Encryption, versioning, narrow bucket policy, audit logs |
| Unauthorized Kubernetes API use | IAM authentication, RBAC and audit logs |

## Abuse cases to test
- Fork pull request cannot obtain cloud deployment credentials.
- Unapproved branch fails AWS role trust condition.
- Privileged pod is rejected.
- Unapproved image registry is rejected.
- Missing resource requests/limits are rejected.
- Team A cannot read Team B namespace secrets.
- Destructive Terraform plan requires review.

Residual risks include runner/dependency compromise, account misconfiguration, cluster vulnerabilities and privileged administrator misuse. Apply layered controls and independent review.
