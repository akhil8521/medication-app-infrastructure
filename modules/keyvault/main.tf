resource "azurerm_key_vault" "keyvault" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"

  purge_protection_enabled    = false
}

resource "azurerm_key_vault_secret" "postgresql_admin_password" {
  name         = "postgresqlAdminPassword"
  value        = var.postgresql_admin_password
  key_vault_id = azurerm_key_vault.keyvault.id
}
