## Service Accounts
module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = var.project_id
  prefix        = "${var.env}"
  names         = ["${var.service_account}"]
  description   = "Service Account Permissions"
  project_roles = [
    "${var.project_id}=>roles/storagetransfer.admin",
    "${var.project_id}=>roles/storage.objectCreator"
  ]
}