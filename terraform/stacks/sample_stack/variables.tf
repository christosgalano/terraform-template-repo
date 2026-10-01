variable "name" {
  description = "Name prefix for the environment, e.g. acme-dev."
  type        = string
}

variable "labels" {
  description = "Labels applied to everything in the stack."
  type        = map(string)
  default     = {}
}
