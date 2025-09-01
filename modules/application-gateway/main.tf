# 5. Create a Public IP Address for the Application Gateway
resource "azurerm_public_ip" "appgw_pip" {
  name                = "appgw-pip"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# 6. Create the Application Gateway with WAF
resource "azurerm_application_gateway" "appgw" {
  name                = "my-appgw"
  resource_group_name = var.rg_name
  location            = var.rg_location

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-appgw-ip-config"
    subnet_id = var.vnet_subnet_id
  }

  # Frontend Public IP Configuration
  frontend_ip_configuration {
    name                 = "my-appgw-frontend-ip"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  # Frontend Port (e.g., for HTTP traffic on port 80)
  frontend_port {
    name = "http-port"
    port = 80
  }

  # Backend Pool
  backend_address_pool {
    name = "backend-pool"
    # Here you would add the IP addresses or FQDNs of your backend servers.
    # For AKS, this would be managed by the AGIC Ingress Controller.
    # For now, it's empty to be configured later.
  }

  # HTTP Settings for the Backend
  backend_http_settings {
    name                                = "http-settings"
    cookie_based_affinity               = "Disabled"
    port                                = 80
    protocol                            = "Http"
    request_timeout                     = 20
    probe_name                          = null
  }

  # Listener (listens for incoming requests)
  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "my-appgw-frontend-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  # Routing Rule to connect the listener to the backend
  request_routing_rule {
    name                       = "request-routing-rule-1"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "http-settings"
    rule_type                  = "Basic"
    priority                   = 100
  }

  # WAF Configuration
  waf_configuration {
    enabled            = true
    firewall_mode      = "Prevention"
    rule_set_type      = "OWASP"
    rule_set_version   = "3.2"
    file_upload_limit_mb = 100
    request_body_check = true
  }
}


