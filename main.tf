terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "5badcc20-9d8e-4fbf-8681-5d67006faf87"
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}
