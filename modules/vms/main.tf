resource "azurerm_linux_virtual_machine" "webApp" {
  name                  = var.name
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.webApp.id]
  size                  = "Standard_B1ls"
  admin_username        = var.webAppMachines_username
  admin_password        = var.webAppMachines_password
  disable_password_authentication = false

    source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching       = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_network_interface" "webApp" {
  name                = "${var.name}-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

