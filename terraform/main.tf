
resource "azurerm_resource_group" "demo" {
  name     = "rg-devsecops-${var.environment}"
  location = var.location

  tags = {
    Environment = var.environment
    Project     = "Terraform-DevSecOps"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_virtual_network" "demo" {
  name                = "vnet-devsecops-${var.environment}"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  address_space       = ["10.10.0.0/16"]

  tags = azurerm_resource_group.demo.tags
}

resource "azurerm_subnet" "demo" {
  name                 = "subnet-app"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_network_security_group" "demo" {
  name                = "nsg-devsecops-${var.environment}"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  tags = azurerm_resource_group.demo.tags
}

resource "azurerm_storage_account" "demo" {
  name                     = "stdevsecops${var.environment}001"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  public_network_access_enabled   = false
  allow_nested_items_to_be_public = false

  tags = azurerm_resource_group.demo.tags
}







   

   // Test only infracost setup total costing 
# resource "azurerm_virtual_machine" "main" {
#   name                  = "${var.prefix}-vm"
#   location              = azurerm_resource_group.example.location
#   resource_group_name   = azurerm_resource_group.example.name
#   network_interface_ids = [azurerm_network_interface.main.id]
#   vm_size               = "Standard_DS1_v2"

#   # Uncomment this line to delete the OS disk automatically when deleting the VM
#   # delete_os_disk_on_termination = true

#   # Uncomment this line to delete the data disks automatically when deleting the VM
#   # delete_data_disks_on_termination = true

#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
#   storage_os_disk {
#     name              = "myosdisk1"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name  = "hostname"
#     admin_username = "testadmin"
#     admin_password = "Password1234!"
#   }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#   tags = {
#     environment = "staging"
#   }
# }