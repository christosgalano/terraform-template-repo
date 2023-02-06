variable "name" {
  type        = string
  description = "Name of the user-assigned managed identity"
}

variable "location" {
  type        = string
  description = "Location of the user-assigned managed identity"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the user-assigned managed identity will reside"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be applied on the resource"
}
