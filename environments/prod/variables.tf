variable "topics" {
  description = "pubsub topics"
  type        = list(string)
}
variable "gcs-buckets" {
  description = "GCS Bucket"
  type        = list(string)
}
variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "region" {
  type        = string
  description = "Region for dataset"
}


variable "location" {
  type        = string
  description = "location for buckets "
}

variable "dataset_id" {
  default     = []
  type        = list(string)
  description = "Creating the datasets"
}
variable "service_account" {
  type        = string
  description = "Creating the service account"
}
