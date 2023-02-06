variable "organization" {
  type        = string
  default     = "christosgalano"
  description = "Terraform Cloud organization"
}

variable "workspace" {
  type        = string
  default     = "terraform-library"
  description = "Terraform Cloud workspace"
}

variable "client_id" {
  type        = string
  sensitive   = true
  description = "Client id of the service principal used for deployment with OIDC"
}

variable "tenant_id" {
  type        = string
  sensitive   = true
  description = "Tenant id of the service principal used for deployment with OIDC"
}

variable "subscription_id" {
  type        = string
  sensitive   = true
  description = "Subscription id of the service principal used for deployment with OIDC"
}

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
