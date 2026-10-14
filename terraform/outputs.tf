
output "resource_group_name" {
  description = "Name of the demo resource group"
  value       = azurerm_resource_group.demo.name
}

output "virtual_network_id" {
  description = "Virtual Network resource ID"
  value       = azurerm_virtual_network.demo.id
}

output "subnet_id" {
  description = "Application subnet resource ID"
  value       = azurerm_subnet.demo.id
}

output "storage_account_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.demo.name
}
