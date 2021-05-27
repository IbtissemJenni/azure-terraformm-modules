resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
  netsed_block{
  storage_access_key       ="${azurerm_storage_account.storage_account.primary_access_key}"
  other_information = "not sensitive data"
  }
   netsed_block{
  storage_id       ="${azurerm_storage_account.storage_account.id}"
  other_information = "not sensitive data"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.storage_container_name}"
  #resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.storage_account.name}"
  container_access_type = "${var.container_access_type}"
  
}
