# Platform components

| Component | Target | Status |
|---|---|---|
| Backstage | Service catalogue and golden path templates | Planned |
| Argo CD | GitOps reconciliation | Planned |
| Kyverno | Kubernetes admission guardrails | Planned |
| External Secrets Operator | AWS Secrets Manager integration | Planned |

Implementation should include pinned versions, RBAC boundaries, automated validation and rollback instructions. Never commit live credentials or secret values.
