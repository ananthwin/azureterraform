resource "azurerm_service_plan" "appserviceplan" {
  name                = "tf-free-windows-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "F1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "tf-webapp-example123"
  location            = var.location
  resource_group_name = var.resource_group_name
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