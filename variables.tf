variable info {
  type = object({
    domain      = string
    subdomain   = string
    project     = string
    role        = string
    environment = string
    sequence    = string
  })
}

variable tags {
  type = object({
    environment = string
    source      = string
  })
}

# Resource Group
variable location {}

#cosmosdb database
variable database_name{}

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

// variable partition_key_path {}

// variable container_name {}

variable resource_group_name {}


variable max_throughput {}

variable "subnet_whitelist" {
 type = list(object({
   virtual_network_name                = string
   virtual_network_subnet_name         = string
   virtual_network_resource_group_name = string
  }
))
}    






