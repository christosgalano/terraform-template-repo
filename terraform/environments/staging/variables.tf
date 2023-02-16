variable "workload" {
  type        = string
  description = "Name of the workload that will be deployed"
  validation {
    condition     = length(var.workload) >= 2 && length(var.workload) <= 10
    error_message = "Workload's length should be >= 2 and <= 10."
  }
}

variable "environment" {
  type        = string
  description = "Name of the workload's environment"
  validation {
    condition     = length(var.environment) >= 2 && length(var.environment) <= 10
    error_message = "Environment's length should be >= 2 and <= 10."
  }
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
