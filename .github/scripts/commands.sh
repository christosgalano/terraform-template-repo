#!/bin/bash

# Reformat your configuration in the standard style
terraform fmt

# Check whether the configuration is valid
terraform validate

# Prepare your working directory for other commands
terraform init

# Show changes required by the current configuration
terraform plan # -destroy

# Create or update infrastructure
terraform apply # -auto-approve -destroy -refresh-only

# Destroy previously-created infrastructure
terraform destroy

# Show the current state or a saved plan
terraform show

# Show the current state of specific resource
terraform state show <resource_name>

# List resources of current state
terraform state list

# Show output values from your root module
terraform output