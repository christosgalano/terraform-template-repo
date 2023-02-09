variable "name" {
  type        = string
  description = "Name of the virtual network"
}

variable "location" {
  type        = string
  description = "Location of the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the virtual network will reside."
}

variable "address_space" {
  type        = list(string)
  description = "List of the virtual network's address spaces"
  validation {
    condition     = length(var.address_space) >= 1
    error_message = "Virtual network must contain at least one address space."
  }
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  description = "Subnets that the virtual network will contain"
  validation {
    condition     = length(var.subnets) >= 1
    error_message = "Virtual network must contain at least one subnet."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be applied on the resource"
}
