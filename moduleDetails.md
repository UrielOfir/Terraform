<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vms"></a> [vms](#module\_vms) | ./modules/vms | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lb](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.lb_address_pool](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_outbound_rule.http](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.front_lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.app](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_rule) | resource |
| [azurerm_lb_rule.ssh](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine.ansible](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.ansible](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_backend_address_pool_association.association](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_security_group.DB-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.ansible-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.webApp-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/network_security_group) | resource |
| [azurerm_postgresql_flexible_server.db](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.postgresql_flexible_server_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.ansiblePip](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.DB](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_resource_group.VMs](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_resource_group.ansible](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_resource_group.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.DB-tier](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | resource |
| [azurerm_subnet.ansible](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | resource |
| [azurerm_subnet.webApp-tier](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.DB-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.ansible-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.webApp-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ansible_password"></a> [ansible\_password](#input\_ansible\_password) | n/a | `any` | n/a | yes |
| <a name="input_ansible_username"></a> [ansible\_username](#input\_ansible\_username) | n/a | `any` | n/a | yes |
| <a name="input_ipToconnetAnsibleWorkStation"></a> [ipToconnetAnsibleWorkStation](#input\_ipToconnetAnsibleWorkStation) | n/a | `any` | n/a | yes |
| <a name="input_machines_ammount"></a> [machines\_ammount](#input\_machines\_ammount) | n/a | `any` | n/a | yes |
| <a name="input_pg_pass"></a> [pg\_pass](#input\_pg\_pass) | n/a | `any` | n/a | yes |
| <a name="input_pg_user"></a> [pg\_user](#input\_pg\_user) | n/a | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_webAppMachines_password"></a> [webAppMachines\_password](#input\_webAppMachines\_password) | n/a | `any` | n/a | yes |
| <a name="input_webAppMachines_username"></a> [webAppMachines\_username](#input\_webAppMachines\_username) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_webAppVMs_admin_detalis"></a> [webAppVMs\_admin\_detalis](#output\_webAppVMs\_admin\_detalis) | n/a |
<!-- END_TF_DOCS -->