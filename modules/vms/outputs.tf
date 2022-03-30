#Send out vm network interface out of the module:

output "nic_id" {
  value = azurerm_network_interface.webApp.id
}


output "admin_details"{
  value = {
    adminUsername = azurerm_linux_virtual_machine.webApp.admin_username
    adminPassword = azurerm_linux_virtual_machine.webApp.admin_password
  }
}