output "aks_id" {
  value = azurerm_kubernetes_cluster.cluster-k8s.id
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster-k8s.kube_config
  sensitive = true
}