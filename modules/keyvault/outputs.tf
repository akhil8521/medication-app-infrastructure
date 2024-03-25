output "key_vault_id" {
  value = azurerm_key_vault.keyvault.id
}

output "postgresql_admin_password_secret_id" {
  value = azurerm_key_vault_secret.postgresql_admin_password.id
}

output "key_vault_name" {
  value = azurerm_key_vault.keyvault.name
}