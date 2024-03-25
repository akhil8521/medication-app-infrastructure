variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure location where the key vault will be created."
}

variable "keyvault_name" {
  description = "The name of the key vault."
}

variable "tenant_id" {
  description = "The tenant ID for the key vault."
}

variable "postgresql_admin_password" {
  description = "The administrator password for PostgreSQL."
}
