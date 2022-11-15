resource "azurerm_kubernetes_cluster" "main" {
  name                = "${var.prefix}-${var.project_name}-aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aks-dns"
  kubernetes_version  = var.aks_config.kubernetes_version

  default_node_pool {
    name                  = "nodepool"
    vm_size               = var.aks_config.vm_size
    node_count            = var.aks_config.node_count
    vnet_subnet_id        = azurerm_subnet.main.id
    enable_auto_scaling   = false
    enable_node_public_ip = false
    max_pods              = 30
    node_labels           = {}
    os_disk_size_gb       = 128
    type                  = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    docker_bridge_cidr = "172.17.0.1/16"
    service_cidr       = "172.20.0.0/16"
    dns_service_ip     = "172.20.0.10"
  }

  tags = var.resource_tags
}

# Role assignments for AKS cluster
data "azurerm_resource_group" "node_resource_group" { # cluster resource group
  name  = azurerm_kubernetes_cluster.main.node_resource_group
}

resource "azurerm_role_assignment" "aks-mio-crg" {
  scope                = data.azurerm_resource_group.node_resource_group.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id # cluster managed identity
}

resource "azurerm_role_assignment" "aks-vmc-crg" {
  scope                = data.azurerm_resource_group.node_resource_group.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id # cluster managed identity
}

resource "azurerm_role_assignment" "aks-mio-uai" {
  scope                = azurerm_user_assigned_identity.main.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id # cluster managed identity
}

