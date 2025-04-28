resource "azurerm_public_ip" "publicip" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.ip_configuration_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.rg_name
  network_interface_ids         = [azurerm_network_interface.privateip.id]
  vm_size                       = "Standard_B2s"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = var.storage_image_reference_id
  }

  storage_os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.name
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_dns_a_record" "dns_record" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.privateip.private_ip_address]
}


