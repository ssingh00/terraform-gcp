output "project_id" {
  value = "${var.project_id}"
}


output "bigquery_datasets" {
  value = "${google_bigquery_dataset.dataset-create.dataset_id}"
}