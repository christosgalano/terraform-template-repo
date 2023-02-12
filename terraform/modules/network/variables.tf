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
  description = "Name of the resource group where the virtual network will reside"
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
  type        = map(string)
  description = "Subnets that the virtual network will contain, format: 'subnet_name' = 'subnet_address_prefix'"
  validation {
    condition     = length(var.subnets) >= 1
    error_message = "Virtual network must contain at least one subnet."
  }
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable private endpoint network policies in all subnets"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be applied on the resource"
}
