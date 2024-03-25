provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}


resource "azurerm_resource_group" "rg" {
  name     = "rg-medicationtracking-dev"
  location = "East US"
}

provider "random" {}

resource "random_id" "kv_suffix" {
  byte_length = 4
}

resource "random_password" "postgresql_admin_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "random_id" "acr_suffix" {
  byte_length = 4
}

resource "random_id" "aks_suffix" {
  byte_length = 4
}

data "azurerm_key_vault_secret" "postgresql_admin_password" {
  name         = "postgresqlAdminPassword"
  key_vault_id = module.keyvault.key_vault_id
}

module "azure_postgresql_flexible_server" {
  source = "./modules/azure_postgresql"

  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  postgresql_server_name       = "augmend-medication-server"
  administrator_login          = "adminuser"
  administrator_login_password = "securepassword"
  vnet_subnet_id               = "/subscriptions/f86a9db9-edab-40da-a1eb-2695f43743b7/resourceGroups/augmend-health/providers/Microsoft.Network/virtualNetworks/vnet-gbgxesto/subnets/subnet-iazfcuzqlxetk"
  private_dns_zone_id          = "/subscriptions/f86a9db9-edab-40da-a1eb-2695f43743b7/resourceGroups/augmend-health/providers/Microsoft.Network/privateDnsZones/privatelink.postgres.database.azure.com"
}

# module "acr" {
#   source              = "../../modules/acr"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.location
#   acr_name            = "myappacr${random_id.acr_suffix.hex}"
#   sku                 = "Basic"
# }

module "azure_app_service" {
  source = "./azure_app_service_module"

  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  app_service_plan_name = "ASP-augmendhealth-9ede"
  app_service_name      = "augmend-medication"
}


module "keyvault" {
  source                    = "../../modules/keyvault"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  keyvault_name             = "myappkv${random_id.kv_suffix.hex}"
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  postgresql_admin_password = random_password.postgresql_admin_password.result
}
