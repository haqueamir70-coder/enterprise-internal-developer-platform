# Senior DevOps & Internal Developer Platform Interview Handbook

A practical interview preparation library for Senior DevOps, DevSecOps, SRE, AWS Cloud and Platform Engineering roles (targeting approximately 7–10 years of experience).

## Topic-wise question banks

1. [Terraform and Infrastructure as Code](terraform.md)
2. [Kubernetes and EKS](kubernetes.md)
3. [CI/CD, GitOps and Platform Engineering](platform-engineering.md)
4. [Security, SRE and Production Scenarios](security-sre.md)
5. [AWS Cloud & DevOps — 25 Senior Q&A](aws-cloud-platform.md)
6. [System Design — 6 Production Architecture Exercises](system-design-scenarios.md)
7. [Senior DevOps Scenario Bank — 25 Questions](senior-devops-scenarios.md)

## How to answer scenario questions

1. **Impact:** What is broken, who is affected, and what is the blast radius?
2. **Containment:** Stop further damage without making risky changes.
3. **Evidence:** Check logs, metrics, events, state, recent changes and audit trails.
4. **Root cause:** State the evidence that confirms or rejects each hypothesis.
5. **Recovery:** Apply the smallest safe, reversible change.
6. **Validation:** Prove service health from infrastructure and user perspectives.
7. **Prevention:** Add automation, policy, tests, alerts or runbook updates.

## Senior answer quality bar

A senior answer explains why a design was chosen, its trade-offs, failure modes, security boundaries, operational ownership, rollback and validation. Avoid memorized tool definitions without a production example.

**Important:** These are reference answers and design exercises, not evidence that the repository owner has implemented or operated every described technology. Adapt answers to your real experience and clearly distinguish hands-on work from conceptual knowledge.
