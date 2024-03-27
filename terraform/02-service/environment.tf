/*
  Description: providers, and state
*/

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

data "terraform_remote_state" "layer_00" {
  backend = "local"

  config = {
    path = "../00-net/terraform.tfstate"
  }
}
data "terraform_remote_state" "layer_01" {
  backend = "local"

  config = {
    path = "../01-foundation/terraform.tfstate"
  }
}

locals {
  layer_00_out = data.terraform_remote_state.layer_00.outputs
  layer_01_out = data.terraform_remote_state.layer_01.outputs
}
