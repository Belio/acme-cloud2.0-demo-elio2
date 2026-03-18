# environments/dev-gcp/variables.tf

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region for all resources"
  type        = string
  default     = "us-central1"
}
