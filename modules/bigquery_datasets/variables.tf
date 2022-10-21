variable "project_id" {
  type        = string
  description = "Project ID"
}
variable "region" {
  type        = string
  description = "Region for dataset"
}
variable "env" {
  type        = string
  description = "Environment"
}
variable "dataset_id" {
  default     = []
  type        = list(string)
  description = "Creating the datasets"
}
