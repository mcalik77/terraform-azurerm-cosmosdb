
module naming {
  source  = "Azure/naming/azurerm"
  version = "0.1.0"
  suffix  = [ "${title(var.info.domain)}${title(var.info.subdomain)}" ]
}


 data "azurerm_subnet" "subnet" {
  
  for_each = {
   for index, attribute in var.subnet_whitelist: index => attribute
  }

  name                 = each.value.virtual_network_subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.virtual_network_resource_group_name
  
  }

  
resource "azurerm_cosmosdb_account" "cosmosdb" {
  #name =lower("cdb${var.info.domain}${var.info.subdomain}${substr(var.info.environment, 0, 1)}${var.info.sequence}")
  name = format("%s%s%03d", lower("cdb${var.info.domain}"), 
                lower("${var.info.subdomain}${substr(var.info.environment, 0, 1)}"), 
                lower("${substr(var.info.sequence, 0, 3)}"))
  
  location                          = var.location
  resource_group_name               = var.resource_group_name
  offer_type                        = var.cosmosdb_offer_type
  kind                              = var.cosmosdb_kind 
  ip_range_filter                   = var.ip_range
  enable_automatic_failover         = true
  is_virtual_network_filter_enabled = var.network_filter
  
  consistency_policy {
    consistency_level = var.cosmosdb_consistency_level
  }
 
  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    prefix            = var.prefix
    location          = var.location
    failover_priority = 0
  }

  dynamic "virtual_network_rule" {
    for_each = data.azurerm_subnet.subnet

    content{
       id = virtual_network_rule.value.id
     }
  }
  
 
}