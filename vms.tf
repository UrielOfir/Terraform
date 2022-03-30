#calling to a module to build vms (depends on the machines_ammount variable)

resource "azurerm_resource_group" "VMs" {
  name     = "${var.prefix}-VMs-resources"
  location = "eastus"
}


module "vms" {
  source         = "./modules/vms"
  count          = var.machines_ammount
  name           = "${var.prefix}-vm-${count.index + 1}"
  resource_group = azurerm_resource_group.VMs
  webAppMachines_username = var.webAppMachines_username
  webAppMachines_password = var.webAppMachines_password
  subnet_id      = azurerm_subnet.webApp-tier.id
  depends_on     = [azurerm_lb.lb]
}
