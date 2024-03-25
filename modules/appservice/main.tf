resource "azurerm_app_service_plan" "plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.app_service_plan_sku["tier"]
    size = var.app_service_plan_sku["size"]
  }

  kind     = "Linux"
  reserved = true 
}

resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "PYTHON|3.8" 
  }
}
