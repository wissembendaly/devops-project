provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~>2.8.0"

    }
  }
   backend "azurerm" {
    resource_group_name = "devops-gl5"
    storage_account_name = "storageaccountdevopsgl5"
    container_name = "devopsgl5"
    key = "ingress-terraform-provisioning"
  }
}

