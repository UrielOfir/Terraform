#give the admin user name and password

output "webAppVMs_admin_detalis" {

  value =    [
    for vm in module.vms : vm.admin_details
  ]
  sensitive = true
}

output "ansible_vm_detalis" {
  value= {
    admin_username=azurerm_linux_virtual_machine.ansible.admin_username
    admin_password=azurerm_linux_virtual_machine.ansible.admin_password
  }
  sensitive = true
}

# output "postgress_details" {
#   value = {
#     admin_username=azurerm_postgresql_flexible_server.db.administrator_login
#     admin_password=azurerm_postgresql_flexible_server.db.administrator_password
#   }
#   sensitive = true
# }