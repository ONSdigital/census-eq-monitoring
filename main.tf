terraform {
  backend "gcs" {
    bucket = "census-eq-monitoring-tfstate"
  }
}

provider "google" {
  region = "${var.region}"
}

provider "google-beta" {}

output "region" {
  value = "${var.region}"
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = "census-eq-${var.env}-"
}

resource "google_project" "project" {
  name            = "${var.env}"
  project_id      = "${random_id.id.hex}"
  folder_id       = "${var.gcp_folder_id}"
  billing_account = "${var.gcp_billing_account}"

  labels {
    terraform = "census-eq-monitoring"
    team      = "${var.project_team}"
    env       = "${var.project_env}"
  }

  lifecycle {
    ignore_changes = ["project_id", "name"]
  }
}

output "google_project_id" {
  value = "${google_project.project.project_id}"
}
