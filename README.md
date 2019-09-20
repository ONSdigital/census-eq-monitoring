# census-eq-monitoring
This repository contains terraform scripts for provisioning Census EQ Stackdriver Monitoring and Alert Policies to Google Cloud Platform.

## Prerequisites
Provision an environment following the instructions found in the census-eq-terraform [README](https://github.com/ONSdigital/census-eq-terraform/edit/master/README.md), taking care to apply those that relate to Stackdriver Workspaces.

## Development
Logging metric based monitoring and alert policies must first be provisioned to your environment using the terraform scripts in [https://github.com/ONSdigital/census-eq-terraform](census-eq-terraform).
Use an ENV name which follows the naming conventions here: https://cloud.google.com/storage/docs/naming.

Rename `terraform.tfvars.example` to `terraform.tfvars` and fill in the values. (Ask a team member for help).

Create with `ENV=your-env ./create.sh`.

Destroy with `ENV=your-env ./destroy.sh`

If you are deploying to an existing environment, you can use the `EXISTING_PROJECT_ID` variable to define this:
```
EXISTING_PROJECT_ID=existing-project ENV=existing-project ./create.sh
```

Terraform state will by default be stored in the `census-eq-monitoring-tfstate` bucket, this bucket can be overridden by setting the `TERRAFORM_STATE_BUCKET` environment variable.

