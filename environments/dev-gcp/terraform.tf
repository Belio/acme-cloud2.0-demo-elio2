# environments/dev-gcp/terraform.tf

terraform {
  cloud {
    organization = "Elio"

    workspaces {
      name = "acme-cloud20-demo-elio-dev-gcp"
    }
  }

  required_version = ">= 1.6.0"
}
