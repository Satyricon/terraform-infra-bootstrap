terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.4.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.1.4"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.59.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.1.2"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
  }
  required_version = ">= 0.15"
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

provider "azuredevops" {
}

data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}