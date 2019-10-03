# census-eq-monitoring
This repository contains terraform scripts for provisioning Census EQ Stackdriver Monitoring and Alert Policies to Google Cloud Platform.

## Prerequisites
Provision an environment following the instructions found in the census-eq-terraform [README](https://github.com/ONSdigital/census-eq-terraform/edit/master/README.md).

Set up a Stackdriver Workspace:
1. Visit the [Stackdriver Console](https://console.cloud.google.com/monitoring).
2. When prompted, choose **Create a new workspace** and click **Continue**.
3. When prompted to **Select or Create a Google Cloud Platform project**, if it is not already selected, select your project.
4. Click the **Continue** button.
5. You can skip the **Monitor AWS accounts** by clicking  **Skip AWS Setup** button.
6. The next page shows how to **Install the Stackdriver Agents** but this can be skipped as it is already available on the Kubernetes Engine.
7. Click the **Continue** button.
9. On the **Get Reports by Email** page you can simply select any of the options depending on whether you want to receive the reports.
10. Click the **Continue** button.
11. The actual creation of the account and underlying resources takes a few minutes.  Once completed you can press the **Launch monitoring** button.

## Development
Log-based metrics must first be provisioned to your environment using the terraform scripts in [https://github.com/ONSdigital/census-eq-terraform](census-eq-terraform).
Use an ENV name which follows the naming conventions here: https://cloud.google.com/storage/docs/naming.

Rename `terraform.tfvars.example` to `terraform.tfvars` and fill in the values. (Ask a team member for help).

Create with `EXISTING_PROJECT_ID=your-existing-project-id ENV=your-env ./create.sh`.

Destroy with `ENV=your-env ./destroy.sh`

Terraform state will by default be stored in the `census-eq-monitoring-tfstate` bucket, this bucket can be overridden by setting the `TERRAFORM_STATE_BUCKET` environment variable.

