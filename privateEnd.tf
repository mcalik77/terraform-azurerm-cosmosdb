data azurerm_subnet "private_endpoint" {
  
  resource_group_name  = var.private_endpoint.virtual_network_resource_group_name
  virtual_network_name = var.private_endpoint.virtual_network_name
  name                 = var.private_endpoint.virtual_network_subnet_name
}

data "azurerm_cosmosdb_account" "cosmosdb" {
  name                = azurerm_cosmosdb_account.cosmosdb.name
  resource_group_name = var.resource_group_name

    depends_on = [
    azurerm_cosmosdb_account.cosmosdb,
    azurerm_cosmosdb_sql_database.sql_db
]
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = format(
    "%s%s%s%03d",
    substr(module.naming.private_endpoint.name, 0, 2),
    substr(module.naming.private_endpoint.name, 3, module.naming.private_endpoint.max_length - 4),
    substr(var.info.environment, 0, 1),
    var.info.sequence
  )
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.private_endpoint.id

  private_service_connection {
    name                           = format("%s%s%s%03d",
      substr(module.naming.private_endpoint.name, 0, 2),
      substr(module.naming.private_endpoint.name, 3, module.naming.private_endpoint.max_length - 4),
      substr(var.info.environment, 0, 1),
      var.info.sequence
    )
    private_connection_resource_id = data.azurerm_cosmosdb_account.cosmosdb.id
    subresource_names              = ["Sql"]
    is_manual_connection           = false
  }

  depends_on = [
    azurerm_cosmosdb_account.cosmosdb,
    azurerm_cosmosdb_sql_database.sql_db
]
}

