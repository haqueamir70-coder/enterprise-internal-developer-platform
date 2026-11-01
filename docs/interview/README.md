# Senior DevOps & Internal Developer Platform Interview Handbook

This handbook is designed for senior DevOps, DevSecOps, SRE and Platform Engineering interviews. Answers use a practical production-engineering structure: clarify impact, protect production, investigate evidence, remediate safely, validate, and prevent recurrence.

## Contents

1. [Terraform and Infrastructure as Code](terraform.md)
2. [Kubernetes and EKS](kubernetes.md)
3. [CI/CD, GitOps and Platform Engineering](platform-engineering.md)
4. [Security, SRE and Production Scenarios](security-sre.md)

## How to answer scenario questions

Use this sequence:

1. **Impact:** What is broken, who is affected, and what is the blast radius?
2. **Containment:** Stop further damage without making risky changes.
3. **Evidence:** Check logs, metrics, events, state, recent changes and audit trails.
4. **Root cause:** State the evidence that confirms or rejects each hypothesis.
5. **Recovery:** Apply the smallest safe, reversible change.
6. **Validation:** Prove service health from both infrastructure and user perspectives.
7. **Prevention:** Add automation, policy, tests, alerts or runbook updates.

Do not claim that a command, tool or architecture guarantees safety. Explain prerequisites and trade-offs. Commands are examples; adapt account IDs, regions, cluster names and resource names before execution.

## Interview answer quality bar

A senior answer should explain *why*, identify failure modes, include rollback and verification, and distinguish an immediate mitigation from a permanent corrective action.
