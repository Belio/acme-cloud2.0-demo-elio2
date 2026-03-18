# modules/azure-network/variables.tf

variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "acme"
}

variable "environment" {
  description = "Environment name (prod, staging, dev)"
  type        = string
}

variable "location" {
  description = "Azure region (e.g. eastus, westeurope)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the parent resource group"
  type        = string
}

variable "address_space" {
  description = "VNet CIDR block"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_prefix" {
  description = "Subnet CIDR block — must be within address_space"
  type        = string
  default     = "10.1.1.0/24"
}
