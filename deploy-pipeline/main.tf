terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws   = ">= 3.59.0"
    local = ">= 1.4"
  }
}

module "template_data" {
  source   = "../template-versioning"
  template = var.template_data
}
