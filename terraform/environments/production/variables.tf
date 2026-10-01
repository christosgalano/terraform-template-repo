variable "project" {
  description = "Project name, used in resource names and labels."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "owner" {
  description = "Team that owns the environment."
  type        = string
}
