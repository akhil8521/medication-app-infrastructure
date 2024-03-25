output "postgresql_flexible_server_id" {
  value = azurerm_postgresql_flexible_server.flexible.id
}

output "postgresql_flexible_server_host" {
  value = azurerm_postgresql_flexible_server.flexible.fqdn
}
