# Kubernetes & EKS — Interview Q&A

## 1. A pod is stuck in Pending. How do you troubleshoot?

Start with `kubectl describe pod` and inspect Events. Check scheduler messages, CPU/memory requests, node capacity, taints/tolerations, node selectors, affinity, PVC binding and quota. Then inspect node health with `kubectl get nodes` and relevant metrics. Fix the actual scheduling constraint; do not simply remove resource requests or tolerations without understanding the impact.

## 2. A pod is in CrashLoopBackOff. What do you check?

Inspect `kubectl logs POD --previous`, current logs, `kubectl describe pod`, exit code, restart count, probes, configuration, secrets, dependencies and resource limits. Distinguish application crash from liveness-probe restart or OOM kill. Roll back a recent bad release if impact is high, then reproduce and fix the root cause.

## 3. Readiness versus liveness versus startup probes?

Readiness determines whether a pod should receive service traffic. Liveness determines whether kubelet should restart a container. Startup gives slow-starting applications time before liveness/readiness checks take effect. A failing readiness probe removes the pod from ready endpoints; a failing liveness probe can restart it. Poorly designed liveness checks can create restart storms.

## 4. A Kubernetes Service has no endpoints. Why?

Check selector labels against pod labels, pod readiness, namespace, target port and EndpointSlice objects. Use `kubectl get endpoints` or `kubectl get endpointslices`. A running pod is not necessarily Ready and therefore may not be included as a serving endpoint.

## 5. How do requests and limits work?

Requests influence scheduling and represent the resource reservation used by the scheduler. CPU limits throttle CPU; memory limits can cause OOM termination when exceeded. Set values based on measured workload behavior, observe throttling and OOM events, and tune with load testing rather than copying arbitrary values.

## 6. How do you secure a Kubernetes workload?

Use non-root execution, read-only root filesystem where possible, drop Linux capabilities, seccomp, resource requests/limits, network policies, RBAC least privilege, image scanning, signed/trusted images, secret management and admission policies. Keep nodes and control plane patched. Validate controls in runtime, not only in YAML.

## 7. What is the difference between Deployment, StatefulSet and DaemonSet?

Deployment manages interchangeable stateless replicas and rollout strategy. StatefulSet provides stable identities and ordered lifecycle for stateful workloads, commonly with persistent volume claims. DaemonSet schedules a pod on each eligible node, often for agents such as log collectors.

## 8. How does rolling deployment work?

Kubernetes gradually replaces old replicas according to rollout strategy and availability constraints. Configure readiness probes, `maxSurge`, `maxUnavailable`, resource capacity and graceful shutdown. Monitor error rate and latency during rollout. Use `kubectl rollout status` and `kubectl rollout undo` when a rollback is appropriate, noting that database schema changes may not be reversible.

## 9. How do you troubleshoot DNS inside a cluster?

Check CoreDNS pods and logs, service endpoints, network policies, node-local DNS if used, and whether the issue is cluster-wide or namespace/pod-specific. Test resolution from a diagnostic pod using `nslookup` or `dig`. Verify search domains and upstream resolver reachability.

## 10. What happens when a node becomes NotReady?

The control plane marks the node unhealthy and workloads may be rescheduled subject to tolerations, eviction timing, capacity and storage constraints. Inspect node conditions, kubelet/container runtime, networking, disk pressure and cloud instance health. Confirm sufficient spare capacity and disruption budgets.

## 11. What is a PodDisruptionBudget?

A PDB limits voluntary disruptions by specifying minimum available or maximum unavailable pods. It does not prevent involuntary failures and does not guarantee availability if replicas are unhealthy or spread poorly. Ensure replicas are distributed across failure domains.

## 12. How do you design high availability on EKS?

Use multiple availability zones, managed node groups or suitable compute capacity across zones, pod topology spread/anti-affinity, multiple replicas, PDBs, autoscaling, resilient storage and tested backups. Include control-plane dependencies, ingress, DNS, secrets, image registry and regional recovery in the design.

## 13. HPA is not scaling pods. What do you inspect?

Check HPA status and events, metrics API/metrics server, resource requests, target metrics and current utilization. For custom metrics, validate adapter and metric availability. Check max replicas, quota, scheduling capacity and whether the workload can actually scale horizontally.

## 14. What is the difference between HPA and Cluster Autoscaler?

HPA changes the desired number of pod replicas based on metrics. Cluster Autoscaler adjusts node group size when pods cannot be scheduled or nodes are underutilized, subject to its configuration and cloud provider integration. One scales workloads; the other scales compute capacity.

## 15. How do you debug ImagePullBackOff?

Inspect pod events and image reference. Check registry reachability, image/tag existence, pull secret or workload identity configuration, permissions, rate limits, certificate trust and network egress. Avoid embedding registry credentials in manifests.

## 16. What is GitOps?

Git is the declared source of truth for desired cluster state. A controller such as Argo CD continuously compares desired and live state and reconciles differences. Protect repositories, review changes, control sync permissions and define how emergency changes are reconciled back to Git.

## 17. How do you handle persistent volume failures?

Inspect PVC/PV status, storage class, CSI driver, events, zone topology, access mode, capacity and cloud disk health. Confirm backup and restore capability before destructive actions. Stateful workload recovery must account for data integrity, not just pod readiness.

## 18. How do you investigate OOMKilled?

Check container last state, memory usage metrics, working set, limits, application heap behavior and node pressure. Determine whether the limit is undersized or the application leaks memory. Increase limits only after capacity and scheduling impact are assessed.
