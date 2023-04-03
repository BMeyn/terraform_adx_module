resource "random_string" "this" {
  length           = 4
  lower           = true
  upper           = false
  numeric          = false
  special          = false
  override_special = "/@£$"
}

resource "azurerm_kusto_cluster" "this" {
  name                = format("%s%s", var.name, random_string.this.result)
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity # 1
  }

  tags = var.tags
}