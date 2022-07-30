#data "azurerm_resource_group" "resourcerg" {
#   name = "appmonitor"
#}
#
#output "rgname" {
#  value = data.azurerm_resource_group.resourcerg
#}
#
resource "azurerm_resource_group" "ex44" {
  #for_each = toset(["eastus","australiaeast"])
  name     = "${var.rgname}-data"
  location = var.location
}
#
#resource "azurerm_virtual_network" "main" {
#  for_each = toset(["eastus","australiaeast"])
#  name                = "net44-${each.key}"
#  address_space       = ["10.0.0.0/16"]
#  location            = each.value
#  resource_group_name = "${var.rgname}-${each.key}"
#}
#
#resource "azurerm_subnet" "internal" {
#  for_each = azurerm_virtual_network.main
#  name                 = "subnet-44-${each.key}"
#  resource_group_name  = "${var.rgname}-${each.key}"
#  virtual_network_name = "net44-${each.key}"
#  address_prefixes     = ["10.0.2.0/24"]
#}
#
#resource "azurerm_network_interface" "main" {
#  for_each = azurerm_subnet.internal
#  name                = "nic-${each.key}"
#   location            = each.key
#  resource_group_name = "${var.rgname}-${each.key}"
#
#  ip_configuration {
#    name                          = "testconfiguration1"
#    subnet_id                     = azurerm_subnet.internal[each.key].id
#    private_ip_address_allocation = "Dynamic"
#  }
#}
#resource "azurerm_virtual_machine" "main" {
#    for_each = azurerm_virtual_network.main
#  name                  = "vm-${each.key}"
#    location            = each.key
#  resource_group_name = "${var.rgname}-${each.key}"
#  network_interface_ids = [azurerm_network_interface.main[each.key].id]
#  vm_size               = "Standard_DS1_v2"
#
#  # Uncomment this line to delete the OS disk automatically when deleting the VM
#  # delete_os_disk_on_termination = true
#
#  # Uncomment this line to delete the data disks automatically when deleting the VM
#  # delete_data_disks_on_termination = true
#
#  storage_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }
#  storage_os_disk {
#    name              = "myosdisk1-${each.key}"
#    caching           = "ReadWrite"
#    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
#  }
#  os_profile {
#    computer_name  = "hostname"
#    admin_username = "testadmin"
#    admin_password = "Password1234!"
#  }
#  os_profile_linux_config {
#    disable_password_authentication = false
#  }
#  tags = {
#    environment = "staging"
#  }
#}