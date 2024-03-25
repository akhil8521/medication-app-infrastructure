variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure location where the ACR will be created."
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
}

variable "sku" {
  description = "The SKU name of the Azure Container Registry. Possible values are Basic, Standard and Premium."
  default     = "Basic"
}
