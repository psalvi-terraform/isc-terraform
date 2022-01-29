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
resource "azurerm_resource_group" "finance_rg" {
  name     = var.az_rg_name
  location = var.az_rg_location
}

variable "az_rg_name" {
  description = "azure rg"
  type        = string
  default     = "finance_rg1"


}

variable "az_rg_location" {
  description = "azure location"
  type        = string
  default     = "West Europe"


}