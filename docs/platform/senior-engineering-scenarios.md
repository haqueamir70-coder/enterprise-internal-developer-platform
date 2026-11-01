# Senior Platform Engineering — architecture scenarios

Use these to explain trade-offs, not memorize definitions.

## 1. Team asks for unrestricted production deployment
Offer self-service through protected GitOps repositories, ownership, namespace-scoped RBAC and admission policies. Provide a time-bound, audited break-glass route instead of permanent cluster-admin.

## 2. Two Terraform pipelines execute concurrently
Use remote state locking, serialize per environment, avoid local state, inspect lock owner/logs before force-unlocking. Force-unlock only after confirming no active operation and validating backup.

## 3. Plan replaces a critical database
Stop before apply. Inspect resource address, lifecycle and provider diff; identify immutable changes/data-loss risk. Confirm backups/PITR, migration, maintenance window, rollback, peer review and tested recovery.

## 4. Prevent malicious containers reaching production
Require reviewed source, dependency/image scans, SBOM, immutable image refs, signature/provenance verification, admission policy, restricted pod security, network segmentation and runtime telemetry.

## 5. Kubernetes is healthy but users see errors
Prioritize user-facing SLIs: success, latency, saturation. Trace ingress, routing, dependencies, DNS, TLS and application logs. Readiness is necessary but insufficient; rollback if impact grows and known-good release exists.

## 6. Measure IDP value
Track lead time, first deployment, golden-path adoption, self-service completion, deployment frequency, change failure rate, MTTR and ticket deflection. Pair productivity with reliability/security guardrails.

## 7. Support many teams without platform sprawl
Offer a small set of supported golden paths, ownership metadata, policy defaults and versioned templates with upgrade paths. Permit justified extensions, not uncontrolled snowflakes.

## 8. Handle policy exceptions
Require named owner, justification, risk, compensating control, exact scope, expiry and approval. Log centrally, notify before expiry and remove stale exceptions.

## 9. CI versus GitOps CD
CI tests/packages a candidate artifact, scans it and publishes an immutable image. GitOps CD reconciles desired state from reviewed repository into cluster, separating build identity from deployment authority.

## 10. Design for regional outage
Set business-approved RTO/RPO. Choose warm standby, pilot light or active-active based on cost and recovery needs. Replicate images/data, keep infrastructure reproducible and prove restoration with timed exercises.

**Answer structure:** impact → containment → investigation → durable design → validation evidence → trade-offs.
