# What is the resoult of this Terraform files?



# how to run this project?
## Requriments
1. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. Azure account
3. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

## Steps to run the project:
1. Conncte your Azure CLI to your Azure accont-`az login`.
2. Add `secretVars.tf` file with this content of variabls (the users names and passwords for you virtual machines.):
```
variable "webAppVMUserName" { default = "<userName>" }
variable "webAppVMPassword" { default = "<password>" }
variable "DB-VMUserName" { default = "<userName>" }
variable "DB-VMPassword" { default = "<password" }
```

3. Run `terraform apply` (in the project directory).
4. Now you can connect your machines through bastion in your azure portal and use the bash scripts (in the configureVMs_scripts directory) to inatall the app and the DB on them.
(The bash scripts are not ready yet to run automaticlly, so copy-paste the commands to the machine CLI and change the .env file as you need for the machine IP address, the Public IP, password, etc.)

# Terraform backend on azure storage
To upload the terraform state to azure storage, you need to cancel the comment inside the "backetStateConfiguration.tf" file.
And change the storage attributes names to your own.

You need to run `terraform init` again, to apply the backend configuration.

# More details
You can read more details about this terraform module in the automated documentation:
[Terraform-docs](./terraform-docs.md)