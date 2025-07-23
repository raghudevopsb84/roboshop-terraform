env                        = "dev"
ip_configuration_subnet_id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
zone_name                  = "rdevopsb84.online"
dns_record_rg_name         = "project-setup-1"
storage_image_reference_id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
network_security_group_id  = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/networkSecurityGroups/allow-all"
tools_vnet_resource_id     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main"
databases = {
  mongodb = {
    rgname      = "ukwest"
    vnet_prefix = "main"
    subnet      = "main"
    vm_size     = "Standard_B2s"
    port        = 27017
  }
  rabbitmq = {
    rgname      = "ukwest"
    vnet_prefix = "main"
    subnet      = "main"
    vm_size     = "Standard_B2s"
    port        = 5672
  }
  mysql = {
    rgname      = "ukwest"
    vnet_prefix = "main"
    subnet      = "main"
    vm_size     = "Standard_B2s"
    port        = 3306
  }
  redis = {
    rgname      = "ukwest"
    vnet_prefix = "main"
    subnet      = "main"
    vm_size     = "Standard_B2s"
    port        = 6379
  }
}
applications = {
  catalogue = {
    rgname = "ukwest"
  }
  user = {
    rgname = "ukwest"
  }
  cart = {
    rgname = "ukwest"
  }
  payment = {
    rgname = "ukwest"
  }
  shipping = {
    rgname = "ukwest"
  }
  frontend = {
    rgname = "ukwest"
  }
}
rg_name = {
  ukwest = {
    location = "UK West"
  }
}


aks = {
  main-dev = {
    rgname      = "ukwest"
    vnet_prefix = "main"
    subnet      = "main"
    default_node_pool = {
      nodes   = 1
      vm_size = "Standard_D3_v2"
    }
    app_node_pool = {
      one = {
        max_count            = 10
        min_count            = 2
        vm_size              = "Standard_D3_v2"
        auto_scaling_enabled = true
        node_labels = {
          "project/name" = "roboshop"
        }
      }
    }

  }
}


vnets = {
  main-dev = {
    rgname        = "ukwest"
    address_space = ["10.50.0.0/24"]
    subnets = {
      main = {
        address_prefixes = ["10.50.0.0/24"]
      }
    }
  }
}

bastion_nodes = ["10.0.0.101", "10.0.0.11"]

