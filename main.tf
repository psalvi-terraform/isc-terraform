provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

# Create a resource group
resource "azurerm_resource_group" "demorg" {
  name     = "demorg"
  location = "West Europe"
}