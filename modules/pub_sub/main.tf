## Creating Pubsub topics
resource "google_pubsub_topic" "example" {
 project = var.project_id
 for_each = toset(var.topics)
 name = "${each.key}_${var.env}"
}