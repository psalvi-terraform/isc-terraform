# Create a resource group
resource "azurerm_resource_group" "Azure_rg1" {
  name     = "Azure_rg1"
  location = "West Europe"
}
# Create a resource group
resource "azurerm_resource_group" "Azure_rg2" {
  name     = "Azure_rg2"
  location = "West Europe"
}
# Create a resource group
resource "azurerm_resource_group" "Azure_rg3" {
  name     = "Azure_rg3"
  location = "West Europe"
}

# Create a resource group
resource "azurerm_resource_group" "terrform-test-rg" {

  location = "eastus"
  name     = "terrform-test-rg"
}


# Create a resource group
resource "azurerm_resource_group" "terraform-rg" {

  
  
}


#/subscriptions/24a2fb12-1251-4c2f-affe-c3d223e56b0e/resourceGroups/terrform-test-rg