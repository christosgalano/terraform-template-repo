# Module management

## Add a new module

### Directory

Create a directory with the name of the environment in `terraform/modules`. Follow the structure below:

```bash
📦new_module
 ┣ 📂validate
 ┃ ┣ 📜.terraform-docs.yaml
 ┃ ┣ 📜README.md
 ┃ ┗ 📜validate.tf
 ┣ 📜.terraform-docs.yaml
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┣ 📜README.md
 ┗ 📜variables.tf
```

You can copy the `.terraform-docs.yaml` from an existing environment, it requires no modifications. You can also skip the creation of the `README.md` since it will be automatically generated when they `deploy` workflow runs.

The `new_module/validate/` subdirectory is used to run `terraform init` and `terraform validate`. You can copy it from an existing module and simply modify the `validate.tf` file.

### Example

Let's say we wish to add a new module that will create our network infrastructure on Azure. We will call it `network`.

We create a new directory in `terraform/modules` with the following structure:

```bash
📦network
 ┣ 📂validate
 ┃ ┣ 📜.terraform-docs.yaml
 ┃ ┗ 📜validate.tf
 ┣ 📜.terraform-docs.yaml
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┗ 📜variables.tf
```

Then we need to modify the `validate.tf` file in the `validate` subdirectory in the following manner:

```hcl
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  # these can be dummy values since we are not using plan or apply, just init and validate
  client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  
  tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  features {}
}

module "network" {
  source = "../"

  # these can be dummy values since we are not using plan or apply, just init and validate
  # param_1 = ...
  # param_3 = ... 
  # param_2 = ... 
  # ...
}
```

---

## Remove a module

If you wish to remove a module the process is straightforward. Simply:

- delete the module's directory
- remove all the module calls from the environment's modules
