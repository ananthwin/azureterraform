terraform {
  backend "azurerm" {
    resource_group_name  = "tf-webapp-rg"
    storage_account_name = "tf1storageacc"
    container_name       = "terraform-state"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id="77845c72-6418-4086-8008-06c3bcb08b0f"
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-webapp-rg-test"
  location = "Central US"
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = "tf-free-windows-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "F1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "tf-webapp-example123" # Must be globally unique
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.appserviceplan.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id
 
  site_config {    
    always_on = false
    application_stack {
      current_stack  = var.current_stack
      dotnet_version = var.dotnet_version
    }
  }
  https_only = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akstest"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}