variable "project_id" {
  description = "The GCP project you want to enable APIs on"
}

variable "name" {
  type    = string
  default = "test-notebook-name"
}

variable "location" {
  type    = string
  default = "us-east1-b"
}

variable "machine_type" {
  type    = string
  default = "n1-standard-4"
}

variable "images" {
  type = map(object({ name = string, tag = string }))
  default = {}
}

variable "network" {
  type    = string
  default = "my-network"
}

variable "subnet" {
  type    = string
  default = "my-subnet"
}

variable "region" {
  type    = string
  default = "us-east1"
}