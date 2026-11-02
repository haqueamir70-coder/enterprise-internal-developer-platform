# AWS Cloud & DevOps — Senior-Level Interview Q&A

**Target:** Senior DevOps / DevSecOps / Cloud Platform Engineer (approximately 7–10 years).  
**Answer pattern:** state the design, explain the trade-off, identify failure modes, then describe validation and recovery.

## 1. Design a secure AWS multi-account landing zone.

Use AWS Organizations with separate accounts for production, non-production, security/log archive and shared services. Apply preventive guardrails through SCPs, centralized identity federation, delegated security services, centralized CloudTrail and Config, and a controlled network egress model. Use a governed account-vending process and infrastructure as code.

**Trade-off:** Strong isolation improves blast-radius control but adds operational overhead. Define ownership, account boundaries and exception handling before scaling.

## 2. Explain a production VPC design across three Availability Zones.

Create public subnets only for internet-facing load balancers or controlled egress components, and private application subnets across AZs. Put data tiers in isolated subnets where appropriate. Use route tables deliberately, security groups as stateful workload boundaries, and network ACLs only where subnet-level stateless filtering is needed. Use VPC endpoints for supported AWS services to reduce public egress dependency.

**Validate:** Route tables, effective routes, DNS, endpoint policies, security group paths, NACL return traffic and flow logs.

## 3. A private EC2 instance cannot reach S3. Troubleshoot.

Check DNS resolution, route table, S3 gateway endpoint association, endpoint policy, bucket policy, IAM identity policy, SCPs and explicit denies. If traffic is expected through NAT, verify NAT route and egress controls. Use CloudTrail data/event evidence where enabled and VPC Flow Logs for network evidence.

**Senior point:** A route to an endpoint does not grant authorization; network reachability and IAM/resource authorization are separate layers.

## 4. NAT Gateway versus VPC endpoints?

NAT Gateway provides outbound connectivity from private subnets to destinations outside the VPC, generally with per-AZ design considerations. Gateway endpoints support S3 and DynamoDB routing without NAT; interface endpoints provide private connectivity to supported services through endpoint ENIs and PrivateLink. Choose based on destination, availability, cost, DNS and security requirements.

## 5. How would you design highly available EKS?

Use a regional EKS control plane, worker capacity across multiple AZs, multiple replicas, topology spread constraints, PDBs, readiness probes, autoscaling and resilient ingress. Account for AZ-scoped storage, load balancer behavior, subnet IP capacity, cluster add-ons, DNS and image pulls. Test node/AZ disruption rather than assuming replica count alone ensures HA.

## 6. EKS pods are Pending because of IP exhaustion. What do you do?

Inspect scheduler events, node subnet free IPs, VPC CNI logs/configuration, prefix delegation support and pod density. Check subnet sizing and ENI/IP limits for the instance types. Immediate mitigation may involve adding correctly routed subnet capacity or scaling suitable nodes; permanent remediation includes capacity planning and tested CNI configuration changes.

## 7. How do you grant EKS workloads AWS permissions?

Prefer EKS Pod Identity or IAM Roles for Service Accounts (IRSA), according to cluster and workload compatibility. Scope the role to the intended service account and namespace, use least privilege, and avoid node instance roles with broad application permissions. Audit trust conditions and test that unrelated pods cannot assume the role.

## 8. Explain IAM policy evaluation.

Explicit deny overrides allow. Effective permissions are shaped by identity policies, resource policies, permissions boundaries, session policies and organization SCPs, as applicable. Cross-account access generally requires both a trusted resource-side relationship and permission on the caller side. Diagnose the exact principal, action, resource, conditions and explicit deny.

## 9. How do you secure AWS CI/CD without static access keys?

Use GitHub Actions or another trusted CI provider with OIDC federation. Configure a role trust policy constrained to the expected issuer, audience and repository/branch or environment subject. Grant only deployment permissions, protect production environments and log role sessions. Validate the actual token claims; overly broad trust conditions undermine the design.

## 10. How would you design a private EKS cluster?

Use private API endpoint access where operationally feasible, controlled admin connectivity, private worker subnets, required VPC endpoints or controlled egress, private DNS, restricted security groups and centralized audit logs. Ensure CI runners, operators, add-ons and image pulls can reach required endpoints. Private does not mean unreachable by design; document the supported access path.

## 11. ALB returns 502/503 for an EKS application. What do you inspect?

Check target health and reason codes, ingress/controller events, target type, service port/targetPort, pod readiness, security group paths, health check path/protocol and application logs. For 502, investigate connection resets, protocol mismatch and target behavior; for 503, inspect target availability and routing. Correlate with deployment and load balancer metrics.

## 12. How do you build multi-region disaster recovery?

First agree RTO/RPO and data consistency requirements. Select backup/restore, pilot light, warm standby or active/active according to business criticality and cost. Replicate data using service-specific mechanisms, deploy infrastructure from versioned IaC, and define DNS/traffic failover, secrets, identity, quotas and operational ownership. Run failover and failback exercises.

**Important:** Multi-region compute without tested data recovery and dependency readiness is not a DR strategy.

## 13. S3 bucket must be private. What controls do you apply?

Enable Block Public Access at account and bucket levels where appropriate, disable ACL-based public exposure through modern ownership controls, use restrictive bucket policies, encryption, TLS enforcement, least-privilege IAM and access logging/CloudTrail data events as required. Review access points and cross-account policies. Test intended access paths after changes.

## 14. KMS key versus application-managed encryption?

AWS KMS manages key material and cryptographic operations with access policies, auditability and integrations. Envelope encryption uses a data key for payload encryption and KMS to protect that data key. Choose based on compliance, latency, key lifecycle, rotation, data volume and application requirements. Do not confuse key rotation with re-encrypting every historical object in all services.

## 15. How do you manage secrets in AWS?

Use Secrets Manager for managed secret lifecycle/rotation use cases or Systems Manager Parameter Store for configuration and supported secure parameters. Restrict access with IAM and resource policies, use private connectivity where appropriate, rotate credentials, and avoid exposing values in logs, Terraform state or CI output. Prefer workload identity to long-lived credentials.

## 16. CloudWatch versus CloudTrail versus Config?

CloudWatch handles metrics, logs, dashboards and alarms. CloudTrail records API activity and identity actions. AWS Config records resource configuration and evaluates compliance rules. They answer different questions and are most useful when correlated with application telemetry and incident timelines.

## 17. How do you reduce AWS cost without risking reliability?

Attribute spend by account, service, region, tag and usage type. Identify idle resources, overprovisioned compute, storage lifecycle opportunities, data transfer, NAT and logging costs. Use rightsizing, Savings Plans/Reserved Instances where usage is stable, autoscaling and budgets. Model availability and recovery impact before changing multi-AZ or replication patterns.

## 18. An IAM access denied occurs only in production. Why?

Compare assumed role identity, session tags, permission boundaries, SCPs, resource policies, KMS key policies, VPC endpoint policies and environment-specific conditions. Use CloudTrail and policy simulation as supporting evidence. Avoid solving it by granting AdministratorAccess; isolate the missing action/resource and add the narrowest justified permission.

## 19. How do you secure container images in ECR?

Use immutable tags where appropriate, scan images, minimize base image packages, build as non-root, generate SBOM/provenance where supported, sign and verify artifacts, restrict push/pull permissions and promote the same immutable digest across environments. Define vulnerability exception expiry and rebuild cadence.

## 20. What is your approach to AWS operational readiness?

Define service ownership, SLOs, dashboards, alerts, runbooks, backup/restore evidence, capacity limits, security controls, cost allocation, change management and incident escalation. Conduct game days and operational acceptance before production launch.

## 21. How would you design centralized logging across accounts?

Use organization-wide audit collection and a dedicated log archive/security account with tightly controlled access and retention. Centralize application logs through an approved pipeline, encrypt storage, partition by account/region/service and apply lifecycle policies. Protect log integrity and ensure incident responders can query logs without broad production write access.

## 22. Explain blue/green deployment on AWS.

Deploy a parallel environment, validate it, then shift traffic through an ALB listener, weighted routing or another controlled mechanism. Monitor SLOs and keep the old environment available for rollback. Ensure database/schema changes are backward-compatible; traffic rollback cannot undo destructive data migrations.

## 23. What is the difference between Security Group and Network ACL?

Security Groups are stateful and attach to supported network interfaces/resources. Network ACLs are stateless subnet-level filters and require explicit return-path rules. Use security groups for most workload-level segmentation; introduce NACLs for clear subnet boundary requirements, with careful rule-order and ephemeral-port testing.

## 24. How do you investigate a sudden increase in AWS spend?

Compare Cost Explorer or CUR data by service, linked account, region, usage type and tag. Correlate with deployment, scaling, data transfer, snapshots, logs and public egress. Validate the workload before stopping resources. Set anomaly detection, budgets, ownership tags and automated cleanup with safeguards.

## 25. What makes an AWS architecture production-ready?

A clear threat model, identity boundaries, resilient network and compute design, data durability, observable SLOs, tested recovery, automated delivery, policy enforcement, cost ownership and operational runbooks. A diagram alone is not proof; validate the design through tests and failure exercises.
