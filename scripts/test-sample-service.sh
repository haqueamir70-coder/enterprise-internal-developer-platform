#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="idp-sample-service:test"
CONTAINER_NAME="idp-sample-service-test"

cleanup() {
  docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
}
trap cleanup EXIT

docker build -t "$IMAGE_NAME" services/sample-service
docker run -d --name "$CONTAINER_NAME" -p 18080:8080 "$IMAGE_NAME"

for _ in $(seq 1 20); do
  if curl --fail --silent http://127.0.0.1:18080/healthz >/dev/null; then
    break
  fi
  sleep 1
done

curl --fail --silent http://127.0.0.1:18080/healthz
curl --fail --silent http://127.0.0.1:18080/readyz
curl --fail --silent http://127.0.0.1:18080/ | grep -q "idp-sample-service"
curl --fail --silent http://127.0.0.1:18080/metrics | grep -q "idp_sample_up 1"
echo "Sample service smoke tests passed."
