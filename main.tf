terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.39.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.3.0"
    }
  }
  required_version = ">= 1.3"
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