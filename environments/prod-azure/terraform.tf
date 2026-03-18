# environments/prod-azure/terraform.tf

terraform {
  cloud {
    organization = "acme-corp-demo"

    workspaces {
      name = "acme-prod-azure"
    }
  }

  required_version = ">= 1.6.0"
}
