provider "azurerm" {
  features {}
  subscription_id = "323379f3-3beb-4865-821e-0fff68e4d4ca"
}

terraform {
  backend "azurerm" {}
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.8.0"
    }
  }
}

provider "vault" {
  address = "http://vault-int.rdevopsb84.online:8200"
  token   = var.token
}


