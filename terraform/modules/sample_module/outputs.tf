output "id" {
  description = "Resource ID."
  value       = terraform_data.this.id
}

output "name" {
  description = "Resource name."
  value       = var.name
}
