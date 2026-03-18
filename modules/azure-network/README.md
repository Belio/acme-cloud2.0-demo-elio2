# azure-network module

Reusable Azure networking module for ACME Corp.
Published to TFC private registry as `acme-corp-demo/azure-network/azurerm`.

## Resources created

- `azurerm_virtual_network` — VNet with configurable CIDR
- `azurerm_subnet` — single subnet within the VNet
- `azurerm_network_security_group` — NSG with deny-all-inbound default rule
- `azurerm_subnet_network_security_group_association` — NSG attached to subnet

## Usage

```hcl
module "azure_network" {
  source  = "app.terraform.io/acme-corp-demo/azure-network/azurerm"
  version = "1.0.0"

  environment         = "prod"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.acme.name
  address_space       = "10.1.0.0/16"
  subnet_prefix       = "10.1.1.0/24"
}
```

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name_prefix` | Prefix for all resource names | string | `"acme"` |
| `environment` | Environment name | string | required |
| `location` | Azure region | string | required |
| `resource_group_name` | Parent resource group name | string | required |
| `address_space` | VNet CIDR block | string | `"10.1.0.0/16"` |
| `subnet_prefix` | Subnet CIDR block | string | `"10.1.1.0/24"` |

## Outputs

| Name | Description |
|---|---|
| `vnet_id` | The ID of the virtual network |
| `subnet_id` | The ID of the subnet |
| `nsg_id` | The ID of the network security group |
