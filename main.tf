# create basic main.tf file to deploy infrastructure to azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "adx-cluster-demo"
  location = "West Europe"
}

module "cluster" {
  source = "./modules/cluster/"
  # version = "1.0.0"
  name = "adxclusterdemo"
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  sku_name = "Standard_D11_v2"
  sku_capacity = 2
  tags = {
    environment = "dev"
  }
}

module "database" {
  source = "./modules/database/"
  # version = "1.0.0"
  name = "adxdemodb"
  resource_group_name = azurerm_resource_group.this.name
  location = azurerm_resource_group.this.location
  cluster_name = module.cluster.name
  hot_cache_period = "P7D"
  soft_delete_period = "P30D"
}