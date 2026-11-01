# SLI / SLO framework

Define objectives per service from real user journeys and business impact. Values below are illustrative, not measured commitments.

| Indicator | Definition | Example objective |
|---|---|---|
| Availability | Successful valid requests / all valid requests | 99.9% over 30 days |
| Latency | Requests completed within agreed threshold | 95% under 300 ms |
| Deployment health | Production changes without rollback/incident | Baseline before target |
| Provisioning | Successful self-service requests within target time | Establish baseline |

For a 99.9% objective over 30 days, theoretical error budget is 0.1% of eligible events. Define eligible traffic, maintenance policy and measurement semantics first.

## Alert design
- Page on urgent user impact; ticket on sustained degradation/capacity.
- Avoid paging on every resource fluctuation.
- Include service, owner, severity, dashboard and runbook.
- Use multi-window burn-rate alerts where supported.

Track lead time, first deployment time, golden-path adoption, deployment frequency, change failure rate, MTTR, self-service success and ticket deflection. Pair productivity metrics with reliability/security guardrails.
