provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

terraform {
  backend "azurerm"{
    resource_group_name = "Devops"
    storage_account_name = "devopssri"
    container_name = "tfstatesri"
    key = "dev.terraform.tfstate"
  }
}