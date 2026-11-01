# AWS to Azure service mapping

The primary implementation targets AWS. These are conceptual equivalents, not one-to-one substitutions.

| Capability | AWS target | Azure conceptual equivalent |
|---|---|---|
| Kubernetes | Amazon EKS | Azure Kubernetes Service (AKS) |
| Network | Amazon VPC | Azure Virtual Network |
| Container registry | Amazon ECR | Azure Container Registry |
| Identity | AWS IAM | Microsoft Entra ID + Azure RBAC |
| Key management | AWS KMS | Azure Key Vault / Managed HSM |
| Secrets | AWS Secrets Manager | Azure Key Vault |
| Object storage | Amazon S3 | Azure Blob Storage |
| Load balancing | ALB / NLB | Azure Load Balancer / Application Gateway |
| Monitoring | CloudWatch + Prometheus/Grafana | Azure Monitor + Managed Prometheus/Grafana |
| IaC | Terraform | Terraform / Bicep |

Identity federation, workload identity, network constructs, private endpoint/DNS integration and managed Kubernetes controls differ. Translate requirements and threat models, not only service names.
