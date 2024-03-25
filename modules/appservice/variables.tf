variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the App Service Plan and App Service."
}

variable "location" {
  type        = string
  description = "The location where the resources will be created."
}

variable "app_service_plan_name" {
  type        = string
  description = "The name of the App Service Plan to create."
}

variable "app_service_plan_sku" {
  type = map(string)
  default = {
    tier = "Basic"
    size = "B1"
  }
  description = "The SKU of the App Service Plan (tier and size)."
}

variable "app_service_name" {
  type        = string
  description = "The name of the App Service to create."
}
