variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "NTPOC"
}

variable "location" {
  description = "eastus"
  default = "eastus"
}


variable "resource_group_name" {}
variable "admin_password" {}
variable "admin_username" {}
variable "size" {}
variable "sku" {}
variable "storage_account_type" {}