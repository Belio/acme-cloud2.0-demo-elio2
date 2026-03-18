# modules/azure-network/outputs.tf

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.main.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.main.id
}
