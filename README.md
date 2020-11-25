# Azure CosmosDB
Terraform module that provisions a CosmosDB and Database on Azure then create container with attributes of Autoscale, Maximum Througput and partition key path using ARM templates.

## Usage
You can include the module by using the following code:

```
# CosmosDB Module
module "cosmos_db" {
  source = "git::"
  info = var.info
  tags = var.tags
  
  # Resource Group
  resource_group_name  = module.rg.name
  location             = module.rg.location
  
  # CosmosDB Database Name
  database_name = var.database_name

  private_endpoint = var.private_endpoint
  # Container
  partition_key_path = var. partition_key_path

  container_name = var.container_name
  max_throughput = var.max_throughput

  cosmosdb_container_count = var.cosmosdb_container_count

  # Firewall 
  subnet_whitelist = var.subnet_whitelist

}
```

## Inputs

The following are the supported inputs for the module.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| info | Info object used to construct naming convention for all resources. | `object` | n/a | yes |
| tags | Tags object used to tag resources. | `object` | n/a | yes |
| resource_group | Name of the resource group where the data factory will be deployed. | `string` | n/a | yes |
| database_name | Name of the database. | `string` | n/a | yes |
| location | Location of CosmosDB and database. | `string` | n/a | yes |
| failover_location | Failover Location for CosmosDB. | `string` | westus2 | no |
| network_filter    | If you want to enable firewall for CosmosDB | `bool` | `true` | no |
| container_name    |                                             | `string` | n/a | no |
| max_throughput    | The throughput of SQL container (RU/s).The minimum value is 400 | `string` | n/a | no |
| subnet | Name of the subnet used to lookup the subnet ID for the virtual machine. | `string` | `vnD01sn112` | no |
| virtual_network | Name of the virtual network used to lookup the subnet ID for the virtual machine. | `string` | `vnetVelConD01` | no |