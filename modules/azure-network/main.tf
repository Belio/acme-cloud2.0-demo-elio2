# modules/azure-network/main.tf
# Reusable Azure Virtual Network module
# Published to TFC private registry as: acme-corp-demo/azure-network/azurerm

resource "azurerm_virtual_network" "main" {
  name                = "${var.name_prefix}-vnet-${var.environment}"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Module      = "azure-network"
  }
}

resource "azurerm_subnet" "main" {
  name                 = "${var.name_prefix}-subnet-${var.environment}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_prefix]
}

resource "azurerm_network_security_group" "main" {
  name                = "${var.name_prefix}-nsg-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "deny-all-inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "azurerm_subnet_network_security_group_association" "main" {
  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}
