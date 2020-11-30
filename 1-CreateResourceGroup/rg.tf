#   ****************************************************
#   *                                                  *
#   *  This script will create azure resource          *
#   *  Azure CLI is required for subcription_id        *
#   *                  $ az login                      *
#   ****************************************************

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  #version = "=1.38.0"
  version = "=2.20.0"

# subscription_id = "69c3d8de-1812-4e7b-a1ea-d4bdf2727ce9"    #<--- Suparuek
# subscription_id = "28e7413d-4da6-4281-a940-af6c67d5cc14"    #<--- Supawat
# subscription_id = "7450d6a3-c62a-4b03-a328-9212a2827341"    #<--- Supawan
# subscription_id = "94061c49-560e-4893-8742-1bc78226b26a"    #<--- Varaporn
# subscription_id = "a87466a6-ec2a-47b8-b830-112715fa6c4d"    #<--- TPITDevOps
# subscription_id = "51adbb53-59e7-4448-824a-7fdea4254423"    #<--- Krit
  
  subscription_id = "69c3d8de-1812-4e7b-a1ea-d4bdf2727ce9"    #<--- Suparuek
  tenant_id       = "4d73b592-41a0-4c4c-b446-283c89d92545"

  features {}
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
