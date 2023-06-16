variable "terraform_version" {
  type        = string
  description = "Terraform version to be installed"
  default     = "1.5.0"
}

variable "location" {
  type        = string
  description = "Location of all resources"
  default     = "northeurope"
}

variable "project_name" {
  type        = string
  description = "Project name to be used for all resources. Better to keep default name and change the prefix variable. Combination of prefix and project name define names of all resources and resource group"
  default     = "tf-infra"
}

variable "prefix" {
  type        = string
  description = "Preffix to be applied to all resource names"
}

variable "resource_tags" {
  type        = map(string)
  description = "Tags to be applied for all resources"
  default = {
    managed_by = "Terraform"
    usage      = "Infrastructure provisioning automation resources"
  }
}

# Azure devops related variables
variable "azure_dev_ops_url" {
  type        = string
  description = "Azure DevOps URL"
}

variable "azure_dev_ops_agent_pool_name" {
  type        = string
  description = "Existing Azure Dev Ops Agent Pool name where this self-hosted agent should be added"
}

variable "azure_dev_ops_agent_pool_size" {
  type        = number
  description = "Number of Agents in Agent Pool"
  default     = 1
}

# AKS related variables
variable "aks_config" {
  type = object({
    node_count              = number
    vm_size                 = string
    kubernetes_version      = string
    aks_agent_image         = string
    aks_agent_image_version = string
    helm_repository         = string
    helm_chart              = string
    helm_version            = string
  })
  description = "Pod and HPA configurations"
  default = {
    node_count              = 1
    vm_size                 = "Standard_D2as_v5"
    kubernetes_version      = "1.25.6"
    aks_agent_image         = "yubarseg/ado-agent"
    aks_agent_image_version = "latest"                         # Image version of Azure Devops agent
    helm_repository         = "https://satyricon.github.io/helm-charts/"
    helm_chart              = "ado-agent-helm-chart"
    helm_version            = "0.2.0"
  }
}

variable "azure_dev_ops_pat" {
  type = string
  description = "Azure DevOps Personal Access Token with scope Agent Pools Read & Manage"
}
