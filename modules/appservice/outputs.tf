output "app_service_id" {
  value = azurerm_app_service.app.id
}

output "app_service_default_hostname" {
  value = azurerm_app_service.app.default_site_hostname
}
