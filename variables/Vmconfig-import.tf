resource "azurerm_resource_group" "vm2_group" {
  location = "eastus"
  name     = "vm2_group"
}

resource "azurerm_virtual_network" "vm2_group-vnet" {
  name                = "vm2_group-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.vm2_group.location
  resource_group_name = azurerm_resource_group.vm2_group.name
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.vm2_group.name
  virtual_network_name = azurerm_virtual_network.vm2_group-vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_network_interface" "vm2859" {
  name                = "vm2859"
  location            = azurerm_resource_group.vm2_group.location
  resource_group_name = azurerm_resource_group.vm2_group.name
  
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_machine" "vm2" {
  name                  = "vm2"
  location              = azurerm_resource_group.vm2_group.location
  resource_group_name   = azurerm_resource_group.vm2_group.name
  network_interface_ids = [azurerm_network_interface.vm2_group-vnet.id]
  vm_size               = "Standard_DS1_v2"

  
}

#/subscriptions/24a2fb12-1251-4c2f-affe-c3d223e56b0e/resourceGroups/vm2_group