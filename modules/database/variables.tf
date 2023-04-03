variable "name" {
    type        = string
    description = "The name of the Kusto Cluster database."
}

variable "cluster_name" {
    type        = string
    description = "The name of the Kusto Cluster."
}

variable "resource_group_name" {
    type        = string
    description = "The name of the Resource Group where the Kusto Cluster database should exist. Changing this forces a new resource to be created."
}

variable "location" {
    type        = string
    description = "The Azure Region where the Kusto Cluster database should exist. Changing this forces a new resource to be created."
}

variable "hot_cache_period" {
    type        = string
    validation {
        # value should be in the list of possible values
        condition     = contains(["P0D", "P1D", "P2D", "P3D", "P4D", "P5D", "P6D", "P7D", "P30D", "P60D", "P90D", "P120D", "P150D", "P180D", "P365D", "P400D", "P545D", "P731D", "P1827D", "P3653D"], var.hot_cache_period)
        error_message = "The hot_cache_period value must be in the list of possible values. (`P0D`, `P1D`, `P2D`, `P3D`, `P4D`, `P5D`, `P6D`, `P7D`, `P30D`, `P60D`, `P90D`, `P120D`, `P150D`, `P180D`, `P365D`, `P400D`, `P545D`, `P731D`, `P1827D`, `P3653D`)"        
    }
    description = "The hot cache period of the Kusto Cluster database. Possible values are: `P0D`, `P1D`, `P2D`, `P3D`, `P4D`, `P5D`, `P6D`, `P7D`, `P30D`, `P60D`, `P90D`, `P120D`, `P150D`, `P180D`, `P365D`, `P400D`, `P545D`, `P731D`, `P1827D`, `P3653D`."
}

variable "soft_delete_period" {
    type        = string
    validation {
        # value should be in the list of possible values
        condition     = contains(["P0D", "P1D", "P2D", "P3D", "P4D", "P5D", "P6D", "P7D", "P30D", "P60D", "P90D", "P120D", "P150D", "P180D", "P365D", "P400D", "P545D", "P731D", "P1827D", "P3653D"], var.soft_delete_period)
        error_message = "The soft_delete_period value must be in the list of possible values. (`P0D`, `P1D`, `P2D`, `P3D`, `P4D`, `P5D`, `P6D`, `P7D`, `P30D`, `P60D`, `P90D`, `P120D`, `P150D`, `P180D`, `P365D`, `P400D`, `P545D`, `P731D`, `P1827D`, `P3653D`)"
    }
    description = "The soft delete period of the Kusto Cluster database. Possible values are: `P0D`, `P1D`, `P2D`, `P3D`, `P4D`, `P5D`, `P6D`, `P7D`, `P30D`, `P60D`, `P90D`, `P120D`, `P150D`, `P180D`, `P365D`, `P400D`, `P545D`, `P731D`, `P1827D`, `P3653D`."
}
