# modules/gcp-network/variables.tf

variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "acme"
}

variable "environment" {
  description = "Environment name (prod, staging, dev)"
  type        = string
}

variable "region" {
  description = "GCP region (e.g. us-central1, europe-west1)"
  type        = string
  default     = "us-central1"
}

variable "subnet_cidr" {
  description = "Subnet CIDR range"
  type        = string
  default     = "10.2.0.0/24"
}
