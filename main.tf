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
# Create a resource group
resource "azurerm_resource_group" "demo1rg" {
  name     = "demo1rg"
  location = "West Europe"
}

resource "azurerm_network_security_group" "vnet1-sub-nsg" {
  name                = "vnet1-sub-nsg"
  location            = azurerm_resource_group.demorg.location
  resource_group_name = azurerm_resource_group.demorg.name
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = azurerm_resource_group.demorg.name
  location            = azurerm_resource_group.demorg.location
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "sub1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "sub2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.vnet1-sub-nsg.id
  }

  tags = {
    environment = "Production"
  }
}