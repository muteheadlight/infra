/*
  Description: eventgrid and topics
*/

resource "azurerm_eventgrid_domain" "fch" {
  name                = "fch"
  location            = local.layer_00_out.region
  resource_group_name = local.layer_00_out.services_resource_group_name
}

resource "azurerm_eventgrid_domain_topic" "scale" {
  name                = "scale"
  domain_name         = azurerm_eventgrid_domain.fch.name
  resource_group_name = local.layer_00_out.services_resource_group_name
}

resource "azurerm_eventgrid_domain_topic" "sleep" {
  name                = "sleep"
  domain_name         = azurerm_eventgrid_domain.fch.name
  resource_group_name = local.layer_00_out.services_resource_group_name
}
