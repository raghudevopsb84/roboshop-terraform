module "frontend" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "frontend"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}

module "mongodb" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "mongodb"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}

module "catalogue" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "catalogue"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}

module "user" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "user"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}


module "redis" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "redis"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}


module "cart" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "cart"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}

module "mysql" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "mysql"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}


module "shipping" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "shipping"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}


module "payment" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "payment"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}


module "rabbitmq" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  name                       = "rabbitmq"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  network_security_group_id  = var.network_security_group_id
}







