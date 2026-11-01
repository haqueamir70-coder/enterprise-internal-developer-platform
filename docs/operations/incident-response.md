# Incident response runbook

## Detect and classify
Record start time, affected service, customer impact, severity, detection source and incident commander. Use the organization's severity matrix.

## Stabilize
Stop unsafe rollouts, freeze unrelated changes, prefer known-good rollback/traffic mitigation, and preserve logs, events, deployment history and cloud audit records.

## Diagnose
Collect recent commits and image digests, Argo CD sync history, Kubernetes events, restarts, readiness failures, resource pressure, request/error/latency/saturation metrics, AWS health, and IAM/network changes.

## Recover
Execute approved rollback, failover or capacity procedure. Validate user-facing behavior and data integrity; pod readiness alone is not closure evidence.

## Learn
Maintain a timestamped decision log. Write a blameless review with impact, timeline, contributing factors, detection gaps, corrective actions, owners and due dates.

- [ ] Incident ID and accountable lead recorded
- [ ] User impact and timeline documented
- [ ] Change history and logs preserved
- [ ] Mitigation and rollback validated
- [ ] Follow-up actions assigned
