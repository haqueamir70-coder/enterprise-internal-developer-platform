# Security control catalogue

| ID | Control | Expected design | Validation evidence |
|---|---|---|---|
| IAM-01 | CI federation | GitHub OIDC, exact audience/repo/branch | Trust policy and denied-branch test |
| IAM-02 | Least privilege | Separate infra, deploy and workload roles | IAM review/access simulation |
| NET-01 | Segmentation | Private worker subnets, explicit ingress/egress | Routes, SGs and NetworkPolicy |
| ENC-01 | Encryption | TLS and KMS-backed encryption where supported | Configuration inspection |
| SEC-01 | Secret hygiene | No secrets in Git; managed retrieval/rotation | Secret scan and rotation test |
| IMG-01 | Image hygiene | Approved bases, pinned digest, vulnerability scan | Trivy report and policy result |
| IMG-02 | Artifact integrity | SBOM and signed artifact verification | Signature/attestation verification |
| K8S-01 | Pod hardening | Non-root, read-only FS where possible, drop caps | Admission policy tests |
| K8S-02 | Resource governance | Requests, limits and quotas | Negative admission test |
| GIT-01 | Change governance | Protected branches and reviewed production changes | Repository settings evidence |
| OBS-01 | Auditability | Cloud, Kubernetes and deployment audit | Searchable event sample |
| RES-01 | Recovery | Tested restore/rollback | Exercise report |

## Exception process
Require named owner, business justification, exact scope, compensating control, expiry and approval. Log exceptions centrally; avoid wildcard exclusions and permanent bypasses.
