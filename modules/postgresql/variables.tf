variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL Flexible Server."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "postgresql_server_name" {
  description = "The name of the PostgreSQL Flexible Server instance."
  type        = string
}

variable "administrator_login" {
  description = "The Administrator Login for the PostgreSQL Flexible Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login for the PostgreSQL Flexible Server."
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet where the PostgreSQL Flexible Server will be deployed."
  type        = string
}

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone for the PostgreSQL server."
  type        = string
}
