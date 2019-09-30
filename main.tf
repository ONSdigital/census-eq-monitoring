terraform {
  backend "gcs" {
    bucket = "census-eq-monitoring-tfstate"
  }
}

provider "google" {
  region  = "${var.region}"
  project = "${var.project_id}"
}

provider "google-beta" {}

output "region" {
  value = "${var.region}"
}
