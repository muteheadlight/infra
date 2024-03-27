/*
  Description: providers, and state
*/

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "layer_00" {
  backend = "local"

  config = {
    path = "../00-net/terraform.tfstate"
  }
}

locals {
  layer_00_out = data.terraform_remote_state.layer_00.outputs
}
