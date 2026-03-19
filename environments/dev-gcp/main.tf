# environments/dev-gcp/main.tf

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  # Credentials injected via TFC Variable Set:
  # GOOGLE_CREDENTIALS (service account JSON), gcp_project_id
}

# ── Network (private registry module) ────────────────────────────────────────

module "gcp_network" {
  source  = "app.terraform.io/Elio/gcp-network/google"
  version = "1.0.0"

  environment = var.environment
  region      = var.gcp_region
  subnet_cidr = "10.2.0.0/24"
}

# ── GCS Bucket ────────────────────────────────────────────────────────────────

resource "google_storage_bucket" "orders" {
  name          = "acme-orders-${var.environment}-${var.gcp_project_id}"
  location      = upper(var.gcp_region)
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
    managed_by  = "terraform"
    initiative  = "cloud2"
  }
}

resource "google_storage_bucket" "sales" {
  name          = "acme-sales-${var.environment}-${var.gcp_project_id}"
  location      = upper(var.gcp_region)
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
    managed_by  = "terraform"
    initiative  = "cloud2"
  }
}
