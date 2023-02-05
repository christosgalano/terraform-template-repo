variable "name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "tags" {
  type = map(string)
  default = {
    "key" = "value"
  }
  description = "Tags to be applied on the resource group"
}