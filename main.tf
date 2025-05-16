provider "azurerm" {
  features {}
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
