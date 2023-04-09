output "name" {
  value = azurerm_kusto_cluster.this.name
}
output "cluster_uri" {
  value = azurerm_kusto_cluster.this.cluster_uri
}
output "data_ingestion_uri" {
  value = azurerm_kusto_cluster.this.data_ingestion_uri
}