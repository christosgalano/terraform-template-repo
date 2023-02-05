variable "workload" {
  type        = string
  description = "Name of the workload that will be deployed"
}

variable "environment" {
  type        = string
  description = "Name of the workload's environment"
}

variable "location" {
  type        = string
  description = "Azure region used for the deployment of all resources"
}

variable "location_abbreviation" {
  type        = string
  description = "Abbreviation of the location"
}

variable "rg_tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be applied on the resource groups"
}
