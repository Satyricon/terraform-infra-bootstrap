terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.7.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
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