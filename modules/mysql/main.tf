resource "azurerm_private_dns_zone" "main" {
  name                = "roboshop.mysql.rdevopsb84.online"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name                  = "rdevopsb84.online"
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.rg_name
}

# resource "azurerm_mysql_flexible_server" "example" {
#   name                   = "example-fs"
#   resource_group_name    = azurerm_resource_group.example.name
#   location               = azurerm_resource_group.example.location
#   administrator_login    = "psqladmin"
#   administrator_password = "H@Sh1CoR3!"
#   backup_retention_days  = 7
#   delegated_subnet_id    = azurerm_subnet.example.id
#   private_dns_zone_id    = azurerm_private_dns_zone.example.id
#   sku_name               = "GP_Standard_D2ds_v4"
#
#   depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
# }




