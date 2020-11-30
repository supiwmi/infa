# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  #version = "=1.38.0"
  version = "=2.20.0"
  features {}
}

# refer to a resource group
data "azurerm_resource_group" "ExistingStorageRG" {
  name = "RG-TF-SA-Storage"
}

resource "azurerm_storage_account" "ExistingStorageRG" {
  name                     = "sa4productionv1ploy"
  resource_group_name      = "${data.azurerm_resource_group.ExistingStorageRG.name}"
  location                 = "${data.azurerm_resource_group.ExistingStorageRG.location}"
  #account_kind            = "Storage2"
  account_kind             = "Storage"
  account_tier             = "Standard"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Suparuek P"
      }
  }

resource "azurerm_storage_container" "ExistingStorageRG" {
  name                  = "blobcontainer4tf"
  storage_account_name  = azurerm_storage_account.ExistingStorageRG.name
  #storage_account_name  = 
  container_access_type = "private"
}

resource "azurerm_storage_blob" "ExistingStorageRG" {
  name                   = "terraformblob"
  storage_account_name   = azurerm_storage_account.ExistingStorageRG.name
  storage_container_name = azurerm_storage_container.ExistingStorageRG.name
  type                   = "Block"
}
resource "azurerm_storage_share" "ExistingStorageRG" {
  name                 = "terraformshare"  
  storage_account_name = azurerm_storage_account.ExistingStorageRG.name
  quota                = 50
}