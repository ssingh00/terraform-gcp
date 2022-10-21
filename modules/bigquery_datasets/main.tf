## Creating the Datasets
resource "google_bigquery_dataset" "dataset-create" {
  project    = var.project_id
  for_each = toset(var.dataset_id)
  dataset_id = "${each.key}_${var.env}"
  location   = var.region
}