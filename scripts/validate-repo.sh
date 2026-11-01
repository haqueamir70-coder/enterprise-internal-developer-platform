#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CONTRIBUTING.md"
  "docs/DELIVERY-STATUS.md"
  "docs/security/threat-model.md"
  "docs/security/controls.md"
  "docs/architecture/enterprise-idp-architecture.svg"
  "docs/architecture/developer-golden-path.svg"
)

for file in "${required_files[@]}"; do
  if [[ ! -s "$file" ]]; then
    echo "ERROR: required file is missing or empty: $file" >&2
    exit 1
  fi
  echo "OK: $file"
done

if find . -type f \( -name '*.tfstate' -o -name '*.tfstate.*' -o -name '*.tfplan' \) -not -path './.git/*' | grep -q .; then
  echo "ERROR: Terraform state/plan artifact found in repository." >&2
  exit 1
fi

echo "Repository structure validation passed."
