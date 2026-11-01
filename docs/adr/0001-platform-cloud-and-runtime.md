# ADR 0001: Select AWS EKS as primary platform runtime

- Status: Accepted for this portfolio reference design
- Date: 2026-11-01

## Context
The repository needs a coherent cloud target to demonstrate platform engineering without duplicating the owner's existing Azure-focused projects. It must cover self-service, container runtime, IaC, GitOps, identity, security and observability.

## Decision
Use AWS as primary cloud and Amazon EKS as Kubernetes runtime. Use Terraform for infrastructure, Backstage for developer portal, Argo CD for GitOps, Kyverno for admission policy, and Prometheus/Grafana/Loki/OpenTelemetry for observability.

## Consequences
Architecture diagrams and deployment examples use AWS consistently; Azure equivalents are documented separately. AWS deployment and cost validation are required before claiming cloud deployment. Pin versions and test compatibility before implementation claims.
