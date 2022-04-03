#This file manage the load balancer infrastructure:

resource "azurerm_public_ip" "public_ip" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = "${var.prefix}-lb"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  sku = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_rule" "ssh" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "ssh"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_address_pool.id]
  disable_outbound_snat          = true
}

resource "azurerm_lb_probe" "front_lb_probe" {
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "front-probe-lb"
  port                = 8080
}

resource "azurerm_lb_rule" "app" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "app"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.front_lb_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_address_pool.id]
  disable_outbound_snat          = true
}

resource "azurerm_lb_outbound_rule" "http" {
  loadbalancer_id         = azurerm_lb.lb.id
  name                    = "http"
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_address_pool.id

  frontend_ip_configuration {
    name = "PublicIPAddress"
  }
}

resource "azurerm_lb_backend_address_pool" "lb_address_pool" {
    name            = "lb_int"
    loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "association" {
    count                  = var.machines_ammount
    network_interface_id    = module.vms[count.index].nic_id
    ip_configuration_name   = "ipconfig1" 
    backend_address_pool_id = azurerm_lb_backend_address_pool.lb_address_pool.id
}