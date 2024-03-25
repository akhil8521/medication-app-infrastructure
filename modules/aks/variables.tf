variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure location where the AKS cluster will be created."
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  default     = 2
}
