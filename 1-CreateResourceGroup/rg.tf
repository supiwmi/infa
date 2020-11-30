#   ****************************************************
#   *                                                  *
#   *  This script will create azure resource          *
#   *  Azure CLI is required for subcription_id        *
#   *                  $ az login                      *
#   ****************************************************

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.38.0"

}
 
# Create a resource group - RG-TF-VM-Identity
resource "azurerm_resource_group" "Identity" {
  name     = "RG-TF-VM-Identity"
  location = "southeastasia"
  tags = {
    environment = "Production"
    CreatedBy = "Suparuek P"
    ProjectName = "TF"
  }
}
 
# Create a resource group - RG-TF-VM-Database
resource "azurerm_resource_group" "Database" {
  name     = "RG-TF-VM-Database"
  location = "southeastasia"
  tags = {
    environment = "Production"
    CreatedBy = "Suparuek P"
    ProjectName = "TF"
  }
}
 
# Create a resource group - RG-TF-VM-Network
resource "azurerm_resource_group" "Network" {
  name     = "RG-TF-VM-Network"
  location = "southeastasia"
  tags = {
    environment = "Production"
    CreatedBy = "Suparuek P"
    ProjectName = "TF"
  }
}
 
# Create a resource group - RG-TF-VM-WebFrontEnd
resource "azurerm_resource_group" "WebFronEnd" {
  name     = "RG-TF-VM-WebFronEnd"
  location = "southeastasia"
  tags = {
    environment = "Production"
    CreatedBy = "Suparuek P"
    ProjectName = "TF"    
  }
}
 
# Create a resource group - RG-TF-VM-Storage
resource "azurerm_resource_group" "Storage" {
  name     = "RG-TF-SA-Storage"
  location = "southeastasia"
  tags = {
    environment = "Production"
    CreatedBy = "Suparuek P"
    ProjectName = "TF"    
  }
}

# Create a resource group - RG-TF-VM-NSG
resource "azurerm_resource_group" "NSG" {
  name     = "RG-TF-VM-NSG"
  location = "southeastasia"
  tags = {
    environment = "Production"
    CreatedBy = "Suparuek P"
    ProjectName = "TF"    
  }
}
