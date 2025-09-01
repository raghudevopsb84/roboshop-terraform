module "resource-group" {
  for_each = var.rg_name
  source   = "./modules/resource-group"
  name     = "${each.key}-${var.env}"
  location = each.value["location"]
}

module "vnet" {
  for_each               = var.vnets
  source                 = "./modules/vnet"
  address_space          = each.value["address_space"]
  location               = module.resource-group[each.value["rgname"]].location
  name                   = each.key
  resource_group_name    = module.resource-group[each.value["rgname"]].name
  subnets                = each.value["subnets"]
  env                    = var.env
  tools_vnet_resource_id = var.tools_vnet_resource_id
  #delegations            = lookup(lookup(each.value["subnets"], "main", {} ), "delegations", {})
}

module "disk_encryption_set" {
  for_each            = var.des_keys
  source              = "./modules/des"
  location            = module.resource-group[each.value["rgname"]].location
  name                = each.key
  resource_group_name = module.resource-group[each.value["rgname"]].name
}

module "databases" {
  for_each                   = var.databases
  source                     = "./modules/vm"
  ip_configuration_subnet_id = module.vnet["${each.value["vnet_prefix"]}-${var.env}"].subnet[each.value["subnet"]].id
  subnet_cidr                = module.vnet["${each.value["vnet_prefix"]}-${var.env}"].subnet[each.value["subnet"]].address_prefixes
  name                       = each.key
  rg_name                    = module.resource-group[each.value["rgname"]].name
  rg_location                = module.resource-group[each.value["rgname"]].location
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  dns_record_rg_name         = var.dns_record_rg_name
  token                      = var.token
  type                       = "db"
  vm_size                    = each.value["vm_size"]
  bastion_nodes              = var.bastion_nodes
  port                       = each.value["port"]
  nsg_cidr                   = each.value["nsg_cidr"]
  disk_encryption_set_id     = module.disk_encryption_set["rdevopsb84-tf1"].des_id
}


# module "applications" {
#   depends_on                 = [ module.databases ]
#   for_each                   = var.applications
#   source                     = "./modules/vm"
#   ip_configuration_subnet_id = var.ip_configuration_subnet_id
#   name                       = each.key
#   rg_name                    = module.resource-group[each.value["rgname"]].name
#   rg_location                = module.resource-group[each.value["rgname"]].location
#   storage_image_reference_id = var.storage_image_reference_id
#   zone_name                  = var.zone_name
#   network_security_group_id  = var.network_security_group_id
#   dns_record_rg_name         = var.dns_record_rg_name
#   token                      = var.token
#   type                       = "app"
# }

module "aks" {
  for_each          = var.aks
  source            = "./modules/aks"
  name              = each.key
  rg_name           = module.resource-group[each.value["rgname"]].name
  rg_location       = module.resource-group[each.value["rgname"]].location
  env               = var.env
  token             = var.token
  default_node_pool = each.value["default_node_pool"]
  app_node_pool     = each.value["app_node_pool"]
  vnet_subnet_id    = module.vnet["${each.value["vnet_prefix"]}-${var.env}"].subnet[each.value["subnet"]].id
}

module "mysql" {
  for_each       = var.mysql
  source         = "./modules/mysql"
  rg_location    = module.resource-group[each.value["rgname"]].location
  rg_name        = module.resource-group[each.value["rgname"]].name
  vnet_id        = module.vnet["${each.value["vnet_prefix"]}-${var.env}"].vnet_id.id
  vnet_subnet_id = module.vnet["${each.value["vnet_prefix"]}-${var.env}"].subnet[each.value["subnet"]].id
  name           = each.key
  env            = var.env
}

# module "application-gateway" {
#   for_each = var.application_gateway
#   source = "./modules/application-gateway"
#   rg_location    = module.resource-group[each.value["rgname"]].location
#   rg_name        = module.resource-group[each.value["rgname"]].name
# }
