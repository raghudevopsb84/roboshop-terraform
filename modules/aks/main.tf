resource "azurerm_kubernetes_cluster" "main" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "roboshop"

  default_node_pool {
    name           = "default"
    node_count     = var.default_node_pool["nodes"]
    vm_size        = var.default_node_pool["vm_size"]
    vnet_subnet_id = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  aci_connector_linux {
    subnet_name = var.vnet_subnet_id
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.100.0.0/24"
    dns_service_ip = "10.100.0.10"
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "main" {
  for_each              = var.app_node_pool
  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  vm_size               = each.value["vm_size"]
  node_count            = each.value["min_count"]
  min_count             = each.value["min_count"]
  max_count             = each.value["max_count"]
  auto_scaling_enabled  = each.value["auto_scaling_enabled"]
}

