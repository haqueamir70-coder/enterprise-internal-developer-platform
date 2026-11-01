# Contributing

1. Keep architecture, code and delivery status aligned.
2. Prefer small, reviewable pull requests.
3. Pin tool and action versions where practical.
4. Include validation commands and actual results.
5. Never commit credentials, Terraform state, kubeconfig or customer data.
6. Update threat model and runbooks when changing trust boundaries or operations.
7. Mark cloud-dependent checks clearly; local checks are not cloud validation.

## Pull request checklist
- [ ] Scope and rationale are clear.
- [ ] Documentation and diagrams updated.
- [ ] Format, lint and tests run where applicable.
- [ ] Security implications reviewed.
- [ ] Rollback or recovery considered.
- [ ] Delivery status reflects actual evidence.
