#!/usr/bin/env bash

set -ex

if [[ -z "$ENV" ]]; then
  echo "Missing ENV variable"
  exit 1
fi

ENV=$1
TERRAFORM_STATE_BUCKET="${TERRAFORM_STATE_BUCKET:-census-eq-monitoring-tfstate}"

terraform init --upgrade --backend-config prefix=${ENV} --backend-config bucket=${TERRAFORM_STATE_BUCKET}

# Roll out infrastructure
terraform apply -auto-approve

echo
echo "Successfully provisioned monitoring and alert policies"
