data "azurerm_resources" "example" {
  resource_group_name = "RG-DevOpsPractice"
} 

# Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "${var.AzureTagName}-vnet"
  location            = var.AzureLocation
  resource_group_name = data.azurerm_resources.example.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "example" {
  name                 = "${var.AzureTagName}-subnet"
  resource_group_name  = data.azurerm_resources.example.resource_group_name #Interpolation
  virtual_network_name = azurerm_virtual_network.example.name #Interpolation
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "example" {
  name                = "${var.AzureTagName}-nic"
  location            = azurerm_virtual_network.example.location
  resource_group_name = data.azurerm_resources.example.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "example" {
  name                = "${var.AzureTagName}-vm"
  location            = azurerm_virtual_network.example.location
  resource_group_name = data.azurerm_resources.example.resource_group_name
  size                = var.AzureVMsize
  admin_username      = var.AzureAdmin_user
  admin_password      = var.AzureAdmin_password # Update this password

  network_interface_ids = [
    azurerm_network_interface.example.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.AzureStorageAccType
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}