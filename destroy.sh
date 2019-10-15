#!/usr/bin/env bash

set -e

if [[ -z "$EXISTING_PROJECT_ID" ]]; then
  echo "Missing EXISTING_PROJECT_ID variable"
  exit 1
fi

TERRAFORM_STATE_BUCKET="${TERRAFORM_STATE_BUCKET:-census-eq-monitoring-tfstate}"

terraform init --upgrade --backend-config prefix=${EXISTING_PROJECT_ID} --backend-config bucket=${TERRAFORM_STATE_BUCKET}

# Destroy infrastructure
terraform destroy -auto-approve
