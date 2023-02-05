variable "scope" {
  type        = string
  description = "The scope at which the Role Assignment applies to"
}

variable "role_definition_id" {
  type        = string
  description = "The role definition ID used in the role assignment"
}

variable "principal_id" {
  type        = string
  description = "The principal ID assigned to the role"
}
