output "storage_access_key" {

  value = "${azurerm_storage_account.storage_account.primary_access_key}"
  sensitive = true
}

output "storage_id" {
  value = "${azurerm_storage_account.storage_account.id}"
  sensitive = true
}

