# environments/prod-azure/main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Credentials injected via TFC Variable Set:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID
}

# ── Resource Group ────────────────────────────────────────────────────────────

resource "azurerm_resource_group" "acme" {
  name     = "acme-${var.environment}-rg"
  location = var.azure_region

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Initiative  = "cloud2"
    CostCenter  = "Financial Controller"
  }
}

# ── Network (private registry module) ────────────────────────────────────────

module "azure_network" {
  source  = "app.terraform.io/Elio/azure-network/azurerm"
  version = "1.0.0"

  environment         = var.environment
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.acme.name
  address_space       = "10.1.0.0/16"
  subnet_prefix       = "10.1.1.0/24"
}

# ── Storage Account ───────────────────────────────────────────────────────────

resource "azurerm_storage_account" "orders" {
  name                     = "acmeorders${var.environment}"
  resource_group_name      = azurerm_resource_group.acme.name
  location                 = azurerm_resource_group.acme.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Initiative  = "cloud2"
  }
}

