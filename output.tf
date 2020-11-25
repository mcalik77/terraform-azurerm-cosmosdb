output "endpoint" {
  value = azurerm_cosmosdb_account.cosmosdb.endpoint 
}

output "read_endpoints" {
  value = azurerm_cosmosdb_account.cosmosdb.read_endpoints
}

output "write_endpoints" {
  value = azurerm_cosmosdb_account.cosmosdb.write_endpoints
}

output "primary_master_key" {
  value = azurerm_cosmosdb_account.cosmosdb.primary_master_key
}

output "primary_readonly_master_key" {
  value = azurerm_cosmosdb_account.cosmosdb.primary_readonly_master_key
}


