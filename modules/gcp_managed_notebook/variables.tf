variable "project_id" {
  description = "The GCP project you want to enable google managed notebooks"
}

variable "name" {
  type    = string
  default = "managed-notebook"
}

variable "location" {
  type    = string
  default = "us-central1"
}

variable "machine_type" {
  type    = string
  default = "n1-standard-4"
}

variable "images" {
  type = map(object({ name = string, tag = string, access_type = string, runtime_owner = string, idle_shutdown = bool, idle_shutdown_timeout = number }))
  default = {}
}

/*
[Optional] code below is in case of networking specific configuration
 is required for google managed instances
*/

# variable "network" {
#   type    = string
#   default = "my-network"
# }

# variable "subnet" {
#   type    = string
#   default = "my-subnet"
# }

# variable "region" {
#   type    = string
#   default = "us-east1"
# }