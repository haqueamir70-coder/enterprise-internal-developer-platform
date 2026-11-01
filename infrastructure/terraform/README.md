# Terraform AWS foundation

This directory is reserved for the AWS network and EKS foundation. Planned reusable modules: VPC, subnet routing, security groups, endpoints, IAM and EKS.

```text
terraform/
├── modules/
│   ├── network/
│   ├── eks/
│   ├── iam/
│   └── kms/
└── environments/
    ├── dev/
    └── prod/
```

## Design requirements
- Pin Terraform and provider versions.
- Remote state: encryption, versioning, restricted access and documented lock strategy.
- Bootstrap remote state separately; never commit state.
- Separate environment state and account boundaries.
- Private worker subnets and intentional API endpoint access.
- Encrypt supported control-plane/data-plane resources; enable appropriate EKS control-plane logs.
- Tag owner, environment, application and cost centre.
- CI: fmt, validate, static security scan and reviewed plan.
- Protect destructive changes with review and recovery evidence.

Do not apply generic examples to production. Confirm account, region, quotas, CIDR overlap, NAT/endpoints costs, EKS support, IAM boundaries and budget first.

**Status:** deployment code is planned, not deployed. See [Delivery Status](../../docs/DELIVERY-STATUS.md).
