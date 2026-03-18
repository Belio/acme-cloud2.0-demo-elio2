# environments/dev-gcp/terraform.tf

terraform {
  cloud {
    organization = "acme-corp-demo"

    workspaces {
      name = "acme-dev-gcp"
    }
  }

  required_version = ">= 1.6.0"
}
