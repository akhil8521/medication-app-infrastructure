resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}-dns"

  default_node_pool {
    temporary_name_for_rotation = "temporary"
    name                        = "default"
    node_count                  = var.node_count
    vm_size                     = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}
