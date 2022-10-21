locals {
  # A list of objects with one object per instance.
  instances = flatten([
    for image_key, specs in var.images : [{
      image_key  = image_key
      image_name = specs.name
      image_tag  = specs.tag
      }


    ]
  ])
}

provider "google" {
  region = var.region
  zone   = var.location
}

data "google_compute_network" "my_network" {
  project = var.project_id
  name    = var.network
}

data "google_compute_subnetwork" "my_subnetwork" {
  project = var.project_id
  name    = var.subnet
  region  = var.region
}

resource "google_notebooks_instance" "user_managed_notebook" {
  for_each     = { for inst in local.instances : "${inst.image_key}" => inst }
  project      = var.project_id
  name         = "terraform-${each.key}"
  location     = var.location
  machine_type = var.machine_type
  metadata = {
    proxy-mode = "service_account"
    terraform  = "true"
  }
  container_image {
    repository = each.value.image_name
    tag        = each.value.image_tag
  }


  network = data.google_compute_network.my_network.id
  subnet  = data.google_compute_subnetwork.my_subnetwork.id


  no_public_ip    = true
  no_proxy_access = false

}
