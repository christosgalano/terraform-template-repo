variable "scope" {
  type        = string
  description = "The scope at which the role assignment applies to"
}

variable "role_definition_name" {
  type        = string
  description = "The role definition name used in the role assignment"
}

variable "principal_id" {
  type        = string
  description = "The principal ID assigned to the role"
}
