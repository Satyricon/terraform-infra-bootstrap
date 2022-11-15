provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.main.kube_config.0.host
    username               = azurerm_kubernetes_cluster.main.kube_config.0.username
    password               = azurerm_kubernetes_cluster.main.kube_config.0.password
    client_certificate     = base64decode(azurerm_kubernetes_cluster.main.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.main.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "aks-ado-agent" {
  name       = "aks-ado-agent"
  repository = var.aks_config.helm_repository
  chart      = var.aks_config.helm_chart
  version    = var.aks_config.helm_version
  namespace  = "default"
  timeout    = 600

  set {
    name  = "agent.replicas"
    value = var.azure_dev_ops_agent_pool_size
  }

  set_sensitive {
    name  = "azdevops.token"
    value = var.azure_dev_ops_pat
  }

  set {
    name  = "azdevops.url"
    value = var.azure_dev_ops_url
  }

  set {
    name  = "azdevops.agent_prefix"
    value = "aks"
  }

  set {
    name  = "azdevops.agent_pool"
    value = var.azure_dev_ops_agent_pool_name
  }

  set {
    name  = "identity.name"
    value = azurerm_user_assigned_identity.main.name
  }

  set {
    name  = "identity.resource_id"
    value = azurerm_user_assigned_identity.main.id
  }

  set {
    name  = "identity.client_id"
    value = azurerm_user_assigned_identity.main.client_id
  }

  set {
    name  = "image.name"
    value = var.aks_config.aks_agent_image
  }

  set {
    name  = "image.version"
    value = var.aks_config.aks_agent_image_version
  }

  set {
    name  = "terraform.version"
    value = var.terraform_version
  }
}
