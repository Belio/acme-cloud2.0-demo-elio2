# environments/prod-azure/variables.tf

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "azure_region" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}
