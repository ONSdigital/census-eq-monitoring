variable "region" {
  default = "europe-west2"
}

variable "gcp_billing_account" {
  description = "The billing account the project will use, defaults to the Census CTS account"
}

variable "gcp_folder_id" {
  description = "The numeric ID of the folder this project belongs to"
}

variable "project_id" {
  description = "Full GCP project id"
}

variable "stackdriver_workspace" {
  description = "Stackdriver Workspace Hosting Project ID"
}

variable "slack_channel_name" {
  description = "Slack channel name where alerts are sent to. Do not include '#'"
}

variable "slack_auth_token" {
  description = "Slack OAuth Token"
}

variable "project_env" {
  description = "The environment this project belongs to, for billing and reporting purposes, etc"
  default     = "sandbox-eq"
}

variable "project_team" {
  description = "The team this project belongs to, for billing and reporting purposes, etc"
  default     = "eq"
}
