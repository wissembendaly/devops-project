provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.31.0"
    }
  }

   backend "azurerm" {
    resource_group_name = "devops-gl5"
    storage_account_name = "storageaccountdevopsgl5"
    container_name = "devopsgl5"
    key = "cluster-terraform-provisioning"
  }
}