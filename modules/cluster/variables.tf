variable "name" {
  type        = string
  description = "The name of the Kusto Cluster."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Kusto Cluster should exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure Region where the Kusto Cluster should exist. Changing this forces a new resource to be created."
}

variable "sku_name" {
  type        = string
  description = "The SKU Name of the Kusto Cluster. Possible values are: `Dev(No SLA)_Standard_D11_v2`, `Standard_D11_v2`, `Standard_D12_v2`, `Standard_D13_v2`, `Standard_D14_v2`, `Standard_DS13_v2+1TB_PS`, `Standard_DS13_v2+2TB_PS`, `Standard_DS14_v2+3TB_PS`, `Standard_DS14_v2+4TB_PS`, `Standard_E16_v3`, `Standard_E16s_v3`, `Standard_E2_v3`, `Standard_E2s_v3`, `Standard_E32-16s_v3`, `Standard_E32-8s_v3`, `Standard_E32_v3`, `Standard_E32s_v3`, `Standard_E4_v3`, `Standard_E4s_v3`, `Standard_E64-16s_v3`, `Standard_E64-32s_v3`, `Standard_E64_v3`, `Standard_E64s_v3`, `Standard_E8_v3`, `Standard_E8s_v3`, `Standard_F16s_v2`, `Standard_F16s_v2+1TB_PS`, `Standard_F16s_v2+2TB_PS`, `Standard_F16s_v2+3TB_PS`, `Standard_F16s_v2+4TB_PS`, `Standard_F2s_v2`, `Standard_F2s_v2+1TB_PS`, `Standard_F2s_v2+2TB_PS`, `Standard_F2s_v2+3TB_PS`, `Standard_F2s_v2+4TB_PS`, `Standard_F32s_v2`, `Standard_F32s_v2+1TB_PS`, `Standard_F32s_v2+2TB_PS`, `Standard_F32s_v2+3TB_PS`, `Standard_F32s_v2+4TB_PS`, `Standard_F4s_v2`, `Standard_F4s_v2+1TB_PS`, `Standard_F4s_v2+2TB_PS`, `Standard_F4s_v2+3TB_PS`, `Standard_F4s_v2+4TB_PS`, `Standard_F8s_v2`, `Standard_F8s_v2+1TB_PS`, `Standard_F8s_v2+2TB_PS`"
}

variable "sku_capacity" {
  type        = number
  validation {
    # value should be at least 2 and lower than 8 
    condition     = var.sku_capacity >= 2 && var.sku_capacity <= 8
    error_message = "The sku_capacity value must be at least 2."
  }

  description = "The number of instances of the cluster. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

