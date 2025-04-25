provider "azurerm" {
  features {}
  subscription_id = "323379f3-3beb-4865-821e-0fff68e4d4ca"
}

resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "frontend"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "frontend"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_virtual_machine" "frontend" {
  name                  = "frontend"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "frontend-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_public_ip" "mongodb" {
  name                = "mongodb"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "mongodb"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mongodb.id

  }
}

resource "azurerm_virtual_machine" "mongodb" {
  name                  = "mongodb"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "mongodb-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mongodb"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_public_ip" "catalogue" {
  name                = "catalogue"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "catalogue"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.catalogue.id

  }
}

resource "azurerm_virtual_machine" "catalogue" {
  name                  = "catalogue"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "catalogue-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "catalogue"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "redis" {
  name                = "redis"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "redis" {
  name                = "redis"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "redis"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.redis.id

  }
}

resource "azurerm_virtual_machine" "redis" {
  name                  = "redis"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.redis.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "redis-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "redis"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "user" {
  name                = "user"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "user" {
  name                = "user"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "user"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.user.id

  }
}

resource "azurerm_virtual_machine" "user" {
  name                  = "user"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.user.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "user-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "user"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_public_ip" "cart" {
  name                = "cart"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cart" {
  name                = "cart"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "cart"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cart.id

  }
}

resource "azurerm_virtual_machine" "cart" {
  name                  = "cart"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.cart.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "cart-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "cart"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_public_ip" "mysql" {
  name                = "mysql"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mysql" {
  name                = "mysql"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "mysql"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mysql.id

  }
}

resource "azurerm_virtual_machine" "mysql" {
  name                  = "mysql"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "mysql-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mysql"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
    public_ip_address_id          = azurerm_public_ip.mysql.id

  }
}


resource "azurerm_public_ip" "shipping" {
  name                = "shipping"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "shipping" {
  name                = "shipping"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "shipping"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.shipping.id

  }
}

resource "azurerm_virtual_machine" "shipping" {
  name                  = "shipping"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "shipping-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "shipping"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}



resource "azurerm_public_ip" "rabbitmq" {
  name                = "rabbitmq"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "rabbitmq" {
  name                = "rabbitmq"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "rabbitmq"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rabbitmq.id

  }
}

resource "azurerm_virtual_machine" "rabbitmq" {
  name                  = "rabbitmq"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "rabbitmq-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "rabbitmq"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_public_ip" "payment" {
  name                = "payment"
  location            = "UK West"
  resource_group_name = "project-setup-1"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "payment" {
  name                = "payment"
  location            = "UK West"
  resource_group_name = "project-setup-1"

  ip_configuration {
    name                          = "payment"
    subnet_id                     = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.payment.id

  }
}

resource "azurerm_virtual_machine" "payment" {
  name                  = "payment"
  location              = "UK West"
  resource_group_name   = "project-setup-1"
  network_interface_ids = [azurerm_network_interface.payment.id]
  vm_size               = "Standard_B2s"

  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/323379f3-3beb-4865-821e-0fff68e4d4ca/resourceGroups/project-setup-1/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "payment-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "payment"
    admin_username = "azuser"
    admin_password = "DevOps@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.frontend.private_ip_address]
}

resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.catalogue.private_ip_address]
}

resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.mongodb.private_ip_address]
}

resource "azurerm_dns_a_record" "redis" {
  name                = "redis-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.redis.private_ip_address]
}


resource "azurerm_dns_a_record" "rabbitmq" {
  name                = "rabbitmq-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.rabbitmq.private_ip_address]
}


resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.mysql.private_ip_address]
}


resource "azurerm_dns_a_record" "user" {
  name                = "user-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.user.private_ip_address]
}


resource "azurerm_dns_a_record" "cart" {
  name                = "cart-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.cart.private_ip_address]
}


resource "azurerm_dns_a_record" "shipping" {
  name                = "shipping-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.shipping.private_ip_address]
}


resource "azurerm_dns_a_record" "payment" {
  name                = "payment-dev"
  zone_name           = "rdevopsb84.online"
  resource_group_name = "project-setup-1"
  ttl                 = 3
  records             = [azurerm_network_interface.payment.private_ip_address]
}








