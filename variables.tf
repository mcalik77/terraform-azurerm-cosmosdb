# Environment variables should be used for authentication.
#
# ARM_SUBSCRIPTION_ID
# ARM_CLIENT_ID
# ARM_CLIENT_SECRET
# ARM_TENANT_ID
#
# Reference the Azure Provider documentation for more information.
variable info {
  type = object({
    domain      = string
    subdomain   = string
    project     = string
    role        = string
    environment = string
    sequence    = string
  })

  description = "Info object used to construct naming convention for all resources."
}

variable tags {
  type = object({
    environment = string
    source      = string
  })

  description = "Tags object used to tag resources."
}

# Resource Group
variable resource_group_name {
  default = "cosmosdb-test"
}
variable location {}

# CosmosDB Database 
variable database_name{}

variable failover_location {
    default = "westus2"
}

variable ip_range {
    default = "204.153.155.151,104.42.195.92,40.76.54.131,52.176.6.30,52.169.50.45,52.187.184.26"
}
variable network_filter {
    default = true
}

variable cosmosdb_offer_type {
    default = "Standard"
}

variable cosmosdb_kind {
    default = "GlobalDocumentDB"
}

variable cosmosdb_consistency_level {
    default = "Session"
}

variable prefix{
  default = "bcbsreplication"
}

// variable privateEndpointName {}

variable private_endpoint{
  type = object (
    {
      virtual_network_name                = string
      virtual_network_subnet_name         = string
      virtual_network_resource_group_name = string
    }
  )
}

#cosmosdb container attributes
variable "container_attributes" {
 type = list(object({
   container_name     = string
   partition_key_path = string
  }
))
}    

// variable cosmosdb_container_count {
//   default = "1"
// }

// variable container_name {}

// variable partition_key_path {}

variable max_throughput {}

variable "subnet_whitelist" {
 type = list(object({
   virtual_network_name                = string
   virtual_network_subnet_name         = string
   virtual_network_resource_group_name = string
  }
))
} 
