terraform {
  required_version = ">= 1.3.0"

  required_providers {
    external = {
      source = "hashicorp/external"
    }
    aws   = ">= 3.59.0"
    local = ">= 1.4"
  }
}
