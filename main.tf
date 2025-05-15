provider "azurerm" {
  features {}
  subscription_id = var.ARM_SUBSCRIPTION_ID  
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-webapp-rg-test"
  location = "Central US"
}

module "webapp" {
  source              = "./modules/webapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  current_stack       = var.current_stack
  dotnet_version      = var.dotnet_version
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  client_id           = var.client_id
  client_secret       = var.client_secret
}
