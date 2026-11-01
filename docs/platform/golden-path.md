# Golden path: create and operate a service

## Developer journey
1. Discover an existing service or template in Backstage.
2. Select the supported Python service template and provide service name, owner and description.
3. Create the repository through the configured Backstage integration (the current template is a scaffold contract; publishing must be configured).
4. Implement business logic while retaining health endpoints, ownership metadata and secure container defaults.
5. Open a pull request; CI runs repository checks, tests, dependency/image scans and SBOM generation as those stages are implemented.
6. Publish an immutable image to ECR.
7. Update the GitOps repository with the image digest; Argo CD reconciles the declared state.
8. Kyverno validates admission requirements.
9. Observe service health against its SLO and follow runbooks during incidents.

## Required service metadata
Name, owner, lifecycle, system, repository URL, support channel, data classification and operational dashboard.

## Promotion gates
Development can use automated promotion after tests. Production promotion requires reviewed change, security evidence, policy compliance, rollback readiness and an accountable owner.
