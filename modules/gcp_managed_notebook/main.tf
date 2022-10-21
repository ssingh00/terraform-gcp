locals {
  # A list of objects with one object per instance.
  instances = flatten([
    for image_key, specs in var.images : [{
      image_key             = image_key
      image_name            = specs.name
      image_tag             = specs.tag
      access_type           = specs.access_type
      runtime_owner         = specs.runtime_owner
      idle_shutdown         = specs.idle_shutdown
      idle_shutdown_timeout = specs.idle_shutdown_timeout
      }


    ]
  ])
}

/*
[Optional] code below is in case of networking specific configuration
 is required for google managed instances
*/

# provider "google" {
#   region = var.region
#   zone   = var.location
# }

# data "google_compute_network" "my_network" {
#   project = var.project_id
#   name    = var.network
# }

# data "google_compute_subnetwork" "my_subnetwork" {
#   project = var.project_id
#   name    = var.subnet
#   region  = var.region
# }

/*
[Optional] End of networking specific configuration
*/

resource "google_notebooks_runtime" "gcp_managed_notebook" {
  for_each = { for inst in local.instances : "${inst.image_key}" => inst }
  project  = var.project_id
  name     = "terraform-${each.key}"
  location = var.location

  access_config {
    access_type   = each.value.access_type
    runtime_owner = each.value.runtime_owner
  }


  software_config {
    idle_shutdown         = each.value.idle_shutdown
    idle_shutdown_timeout = each.value.idle_shutdown_timeout
  }


  virtual_machine {
    virtual_machine_config {
      machine_type = var.machine_type
      # network = data.google_compute_network.my_network.id
      # subnet  = data.google_compute_subnetwork.my_subnetwork.id
      # internal_ip_only = true
      data_disk {
        initialize_params {
          disk_size_gb = "100"
          disk_type    = "PD_STANDARD"
        }
      }
      container_images {
        repository = each.value.image_name
        tag        = each.value.image_tag
      }
    }
  }


}
