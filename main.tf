provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tf_serviceapi_rg" {
    name = "tf_serviceapi_rg"
    location = "Central US"
}

resource "azurerm_container_group" "tf_serviceapi_cont_grp" {
  name = "tf_serviceapi_cont_grp"
  location = azurerm_resource_group.tf_serviceapi_rg.location
  resource_group_name = azurerm_resource_group.tf_serviceapi_rg.name

  ip_address_type = "Public"
  dns_name_label = "btchoumservicedeskapi"
  os_type = "Linux"

  container {
    name = "servicedeskapi"
    image = "tchoumkeu/servicedeskapi"
    cpu = "1"
    memory = "1"
    ports {
      port = 80
      protocol = "TCP"
    }
  }
}
