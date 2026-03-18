# environments/prod-azure/terraform.tf

terraform {
  cloud {
    organization = "Elio"

    workspaces {
      name = "acme-cloud20-demo-elio-prod-azure"
    }
  }

  required_version = ">= 1.6.0"
}
