#!/usr/bin/env bash

set -e

ENV=$1
TERRAFORM_STATE_BUCKET="${TERRAFORM_STATE_BUCKET:-census-eq-monitoring-tfstate}"

terraform init --upgrade --backend-config prefix=${ENV} --backend-config bucket=${TERRAFORM_STATE_BUCKET}

# Destroy infrastructure
terraform destroy -auto-approve
