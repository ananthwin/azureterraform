output "web_app_url" {
  value = azurerm_windows_web_app.webapp.default_hostname
  description = "The default URL of the Azure Web App"
}