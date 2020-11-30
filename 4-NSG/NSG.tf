# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  #version = "=1.38.0"
  version = "=2.20.0"
  features {}
}

# refer to a resource group
data "azurerm_resource_group" "ExistingNGSRG" {
  name = "RG-TF-VM-NSG"
}

resource "azurerm_network_security_group" "nsg" {
#  name                        = "NSG-TF-WEB-Linux-Allow443-Block80"
  name                        = "NSG-TF-WEB-Linux-Allow443-Block21"
  location                    = "${data.azurerm_resource_group.ExistingNGSRG.location}"
  resource_group_name         = "${data.azurerm_resource_group.ExistingNGSRG.name}"
}
 
#=============================== Outbound===================================================== 
resource "azurerm_network_security_rule" "Web443Allow" {
  name                        = "Web443Allow"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "443"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
}
 
resource "azurerm_network_security_rule" "Web80Allow" {
  name                        = "Web80Allow"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "80"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "SSH22Allow" {
  name                        = "SSH22Allow"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "22"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
}
 
resource "azurerm_network_security_rule" "AllowRange4000_9999" {
  name                        = "AllowRange4000_9999"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "4000-9999"
  destination_port_range      = "4000-9999"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
} 

resource "azurerm_network_security_rule" "AllowRange30000_65000" {
  name                        = "AllowRange30000_65000"
  priority                    = 104
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "30000-65000"
  destination_port_range      = "30000-65000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
} 
#=============================== Outbound=====================================================
resource "azurerm_network_security_rule" "FTP21OutDeny" {
  name                        = "FTP21OutDeny"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "21"
  destination_port_range      = "21"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
} 

/*
resource "azurerm_network_security_rule" "Web80Deny" {
  name                        = "Web80Deny"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "80"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = "${data.azurerm_resource_group.ExistingNGSRG.name}"
  network_security_group_name = azurerm_network_security_group.nsg.name
} 
*/