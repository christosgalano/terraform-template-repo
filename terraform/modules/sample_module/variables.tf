variable "name" {
  description = "Resource name."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,30}$", var.name))
    error_message = "name must be lowercase letters, digits and hyphens, 3-31 characters, starting with a letter."
  }
}

variable "labels" {
  description = "Labels attached to the resource."
  type        = map(string)
  default     = {}
}
