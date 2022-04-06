# internal workstation to connect the app machines

resource "azurerm_resource_group" "ansible" {
  name     = "${var.prefix}-ansible-resources"
  location = "eastus"
}

resource "azurerm_public_ip" "ansiblePip" {
  name                = "myPublicIP"
  location            = azurerm_resource_group.ansible.location
  resource_group_name = azurerm_resource_group.ansible.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "ansible" {
  name                = "${var.prefix}-ansibleNIC"
  location            = azurerm_resource_group.ansible.location
  resource_group_name = azurerm_resource_group.ansible.name

  ip_configuration {
    name                          = "ansibleNicConfiguration"
    subnet_id                     = azurerm_subnet.ansible.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ansiblePip.id
  }
}

resource "azurerm_linux_virtual_machine" "ansible" {
  name                  = "${var.prefix}-ansibleVM"
  location              = azurerm_resource_group.ansible.location
  resource_group_name   = azurerm_resource_group.ansible.name
  network_interface_ids = [azurerm_network_interface.ansible.id]
  size                  = "Standard_B1s"
  admin_username        = var.ansible_username
  admin_password        = var.ansible_password
  disable_password_authentication = false

  os_disk {
    caching       = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}