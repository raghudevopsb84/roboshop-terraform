env                        = "dev"
ip_configuration_subnet_id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
zone_name                  = "rdevopsb84.online"
storage_image_reference_id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
network_security_group_id  = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/networkSecurityGroups/allow-all"
databases = {
  mongodb  = {
      rgname = "ukwest-dev"
  }
  rabbitmq = {
      rgname = "ukwest-dev"
  }
  mysql    = {
      rgname = "ukwest-dev"
  }
  redis    = {
      rgname = "ukwest-dev"
  }
}
applications = {
  catalogue = {}
  user      = {}
  cart      = {}
  payment   = {}
  shipping  = {}
  frontend  = {}
}
rg_name = {
  ukwest = {
    location = "UK West"
  }
}
