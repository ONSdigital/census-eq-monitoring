#!/usr/bin/env bash

set -ex

if [[ -z "$ENV" ]]; then
  echo "Missing ENV variable"
  exit 1
fi

ENV=$1
TERRAFORM_STATE_BUCKET="${TERRAFORM_STATE_BUCKET:-census-eq-monitoring-tfstate}"

terraform init --upgrade --backend-config prefix=${ENV} --backend-config bucket=${TERRAFORM_STATE_BUCKET}

if [ ! -z $EXISTING_PROJECT_ID ]; then
    echo "Using existing project_id: $EXISTING_PROJECT_ID"

    if terraform state list | grep -q "google_project.project"; then
        echo "State contains a google project. Not importing"
    else
        echo "State does not contain a google project. Importing $EXISTING_PROJECT_ID"
        terraform import google_project.project $EXISTING_PROJECT_ID
    fi
fi

# Roll out infrastructure
terraform apply -auto-approve

PROJECT_ID=$(terraform output google_project_id)
REGION=$(terraform output region)

echo
echo "Successfully provisioned monitoring and alert policies"
