#give the admin user name and password

output "admin_detalis" {

  value =    [
    for vm in module.vms : vm.admin_details
  ]
  sensitive = true
}