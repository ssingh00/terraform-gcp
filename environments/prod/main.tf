locals {
  env = "${var.env}"
}
provider "google" {
  project_id = "${var.project_id}"
}
module "bq-datasets" {
  source  = "../../modules/bq-datasets"
  project_id = "${var.project_id}"
  env = "${local.env}"
  dataset_id = "${var.dataset_id}"
  region   = "${var.region}"
}
module "gcp-sa" {
  source  = "../../modules/gcp-sa"
  project_id = "${var.project_id}"
  env     = "${local.env}"
  service_account = "${var.service_account}"
}
module "pub-sub" {
  source  = "../../modules/pub-sub"
  project_id = "${var.project_id}"
  env     = "${local.env}"
  topics = "${var.topics}"
}
module "gcp-buckets" {
  source  = "../../modules/gcp-buckets"
  project = "${var.project_id}"
  env     = "${local.env}"
  location = "${var.location}"
  gcs-buckets = "${var.gcs-buckets}"
}