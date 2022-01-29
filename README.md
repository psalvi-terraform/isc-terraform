# isc-terraform
terraform init
terraform plan
terraform apply
# to unlock the state file in terraform 
terraform init force-unlock
# update and download the module in the root directory 
terraform get -update
#  terraform fmt -check check the formating 
terraform fmt -check -diff
terraform fmt -check -diff (-diff only workes in linux)
#  terraform fmt --write=true is for auto correct 
terraform fmt --write=true
# terraform validate to validate the syntax of configuration
terraform validate
# terraform Show to get the details about resources (it gives the information from state file)
terraform Show
# terraform state Show is use for refering other state file (just specify the locastion state file)
terraform state Show
# terraform import to import the resources which are manually created 
terraform import azurerm_resource_group.terrform-test-rg  "/subscriptions/24a2fb12-1251-4c2f-affe-c3d223e56b0e/resourceGroups/terrform-test-rg"
# terraform apply --auto-approve it just proceed
terraform apply --auto-approve
## how to difine values in variables 
#/
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
#/