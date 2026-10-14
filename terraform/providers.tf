
terraform {
  required_version = ">= 1.5.0"


  backend "azurerm" {
    resource_group_name  = "B18G104pipeline"
    storage_account_name = "storagepipelines123"
    container_name       = "blobstorage123"
    key                  = "DevSecOpsSecurity.tfstate"


  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}


}
