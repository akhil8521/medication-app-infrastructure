resource "azurerm_postgresql_flexible_server" "flexible" {
  name                   = var.postgresql_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "12"
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_login_password

  sku_name   = "Standard_D2s_v3"
  storage_mb = 128000

  delegated_subnet_id = var.vnet_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  backup_retention_days        = 7
  auto_grow_enabled            = false
  public_network_access_enabled = false
}