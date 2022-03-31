#give the admin user name and password

output "webAppVMs_admin_detalis" {

  value =    [
    for vm in module.vms : vm.admin_details
  ]
  sensitive = true
}