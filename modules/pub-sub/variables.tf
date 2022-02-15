variable "project_id" {
  type        = string
  description = "Project ID"
}
variable "env" {
  type        = string
  description = "Environment"
}
variable "topics" {
  description = "pubsub topics"
  type        = list(string)
}