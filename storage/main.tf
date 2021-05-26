resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
  other_information        = "not sensitive data"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.storage_container_name}"
  #resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.storage_account.name}"
  container_access_type = "${var.container_access_type}"
  other_information     = "not sensitive data"
}