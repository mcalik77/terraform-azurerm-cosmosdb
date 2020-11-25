
# Resource Group Module
// module "rg" {
//   source = "git::git@ssh.dev.azure.com:v3/AZBlue/OneAZBlue/terraform.devops.resource-group?ref=v0.0.3"

//   info = var.info
//   tags = var.tags

//   location = var.location
// }

# CosmosDB Module
module "cosmos_db" {
  source = "git::git@github.com:mcalik77/terraform-azurerm-cosmosdb.git?ref=v0.0.2"
  info = var.info
  tags = var.tags
  
  # Resource Group
  resource_group_name  = var.resource_group_name
  location             = var.location
  
  # CosmosDB Database Name
  database_name = var.database_name

  private_endpoint = var.private_endpoint
  # Container
  container_attributes = var.container_attributes
  // partition_key_path = var. partition_key_path

  // container_name = var.container_name
  max_throughput = var.max_throughput

  // cosmosdb_container_count = var.cosmosdb_container_count

  # Firewall 
  subnet_whitelist = var.subnet_whitelist

}

