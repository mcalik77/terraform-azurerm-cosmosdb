
info = {
  domain      = ""      
  subdomain   = ""
  project     = ""
  role        = ""
  environment = ""
  sequence    = ""
}

tags = {
  environment = "Dev"
  source      = "Terraform"
}

resource_group_name = ""


location            = "southcentralus"
database_name       = "Provider"

private_endpoint = {
     virtual_network_name                = ""           
     virtual_network_subnet_name         = ""
     virtual_network_resource_group_name = ""
   }

// partition_key_path = "/entityType"

max_throughput     = "5000"

// container_name = "HrpTransactions"

// cosmosdb_container_count = 2

container_attributes = [
  {
    
    container_name    = "HrpTransactions"
    partition_key_path = "/entityType"
    
  },

  # If you want to add second container , just use second list of map. 
   {
     container_name     = "containername2"
     partition_key_path = "/key2"
     
   }
  
]

subnet_whitelist = [
  {
     virtual_network_name                = ""           
     virtual_network_subnet_name         = ""
     virtual_network_resource_group_name = ""
   
  }

  // {
  //   virtual_network_name                = ""           
  //   virtual_network_subnet_name         = ""
  //   virtual_network_resource_group_name = ""
  // }
  
]


