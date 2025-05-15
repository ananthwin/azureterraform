output "aks_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "kube_admin_config" {
  description = "Admin Kubernetes config block"
  value = {
    host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
    client_key             = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
    cluster_ca_certificate = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
    username               = azurerm_kubernetes_cluster.aks.kube_config[0].username
    password               = azurerm_kubernetes_cluster.aks.kube_config[0].password
  }
  sensitive = true
}

output "kube_config_raw" {
  description = "Raw Kubeconfig file to access the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "aks_fqdn" {
  description = "AKS cluster FQDN"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}
