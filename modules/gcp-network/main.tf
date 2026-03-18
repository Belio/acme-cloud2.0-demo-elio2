# modules/gcp-network/main.tf
# Reusable GCP VPC network module
# Published to TFC private registry as: acme-corp-demo/gcp-network/google

resource "google_compute_network" "main" {
  name                    = "${var.name_prefix}-network-${var.environment}"
  auto_create_subnetworks = false
  description             = "ACME ${var.environment} VPC — managed by Terraform"
}

resource "google_compute_subnetwork" "main" {
  name                     = "${var.name_prefix}-subnet-${var.environment}"
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_firewall" "deny_all_ingress" {
  name     = "${var.name_prefix}-deny-all-ingress-${var.environment}"
  network  = google_compute_network.main.name
  priority = 65534

  deny {
    protocol = "all"
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  description = "Default deny-all ingress — allow rules should be added explicitly"
}
