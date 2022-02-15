## creating the buckets 
resource "google_storage_bucket" "gcs-bucket" {
  for_each = toset(var.gcs-buckets)
  name = "${each.key}_${var.env}"
  storage_class = (each.key == "stream_success") ? "COLDLINE" : "STANDARD"
  project = var.project_id
  location = var.location
  uniform_bucket_level_access = true
}
