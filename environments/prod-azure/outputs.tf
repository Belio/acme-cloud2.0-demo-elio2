# environments/prod-azure/outputs.tf

output "resource_group_name" {
  description = "Name of the Azure resource group"
  value       = azurerm_resource_group.acme.name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.azure_network.vnet_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.azure_network.subnet_id
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = module.azure_network.nsg_id
}

output "storage_account_name" {
  description = "Name of the orders storage account"
  value       = azurerm_storage_account.orders.name
}
