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
    use_oidc         = true
    use_azuread_auth = true
    resource_group_name = "Devops"
    storage_account_name = "devopssri"
    container_name = "tfstatesri"
    key = "dev.terraform.tfstate"
    client_id = "f46948ff-0e57-48d1-9ff0-b6381d27a04f"
    tenant_id = "4c80ac04-5db4-42f8-b80b-1350bec1089c"
    subscription_id = "ade43848-5abe-4133-a155-ddd89781b6ee"
  }
}