resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster-demo"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "akstest"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}
