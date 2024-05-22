# Module management

## Add a new module

### Directory

Create a directory with the name of the environment in `terraform/modules`. Follow the structure below:

```bash
📦new_module
 ┣ 📜.terraform-docs.yaml
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┣ 📜README.md
 ┗ 📜variables.tf
```

You can copy the `.terraform-docs.yaml` from an existing environment, it requires no modifications. You can also skip the creation of the `README.md` since it will be automatically generated when the `ci` workflow runs.

### Example

Let's say we wish to add a new module that will create our network infrastructure on Azure. We will call it `network`.

We create a new directory in `terraform/modules` with the following structure:

```bash
📦network
 ┣ 📜.terraform-docs.yaml
 ┣ 📜main.tf
 ┣ 📜outputs.tf
 ┗ 📜variables.tf
```

---

## Remove a module

If you wish to remove a module the process is straightforward. Simply:

- delete the module's directory
- remove all the module calls from the environment's modules
