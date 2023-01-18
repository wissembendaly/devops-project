
data "azurerm_resource_group" "gl5-RG" {
  name     = "devops-terraform"
}

# data "terraform_remote_state" "aks" {
#   backend = "azurerm"
#   config = {
#     resource_group_name = "devops-gl5"
#     container_name = "devops-gl5"
#     storage_account_name = "storageaccountdevopsgl5"
#     key = "8GT1XhZg5VrAFgWQVPMm7TXC31Ef7A2/V4eliPevJRt9up7mYvnEXTa1HOHbkRLbC0OcBUTqn0mr+AStZnzpJA=="
#    }
# }

resource "azurerm_kubernetes_cluster" "cluster-k8s" {
  name                = "terraform-cluster"
  location            = data.azurerm_resource_group.gl5-RG.location
  resource_group_name = data.azurerm_resource_group.gl5-RG.name
  dns_prefix = "devopsgl5"
  sku_tier            = "Free"
  http_application_routing_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}
