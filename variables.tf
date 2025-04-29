variable "ip_configuration_subnet_id" {
  default = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
}

variable "zone_name" {
  default = "rdevopsb84.online"
}

variable "location" {
  default = "UK West"
}

variable "rg_name" {
  default = "project-setup-1"
}

variable "storage_image_reference_id" {
  default = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
}

variable "network_security_group_id" {
  default = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/networkSecurityGroups/allow-all"
}

variable "databases" {
  default = {
    mongodb = {}
    rabbitmq = {}
    mysql = {}
    redis = {}
  }
}

variable "applications" {
  default = {
    catalogue = {}
    user = {}
    cart = {}
    payment = {}
    shipping = {}
    frontend = {}
  }
}

