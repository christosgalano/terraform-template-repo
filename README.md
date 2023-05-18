# terraform-template-repo

## General

Welcome to the **terraform-template-repo**! This repository serves as a foundation for your Terraform projects, providing a streamlined setup and management process. With a well-organized structure, comprehensive documentation, and automated workflows, you can focus on building your infrastructure with ease.

## Purpose

The purpose of this repository is to simplify the setup and management of your Terraform projects. It offers the following key features:

- **Modular structure:** The repository is organized into logical modules to help you easily navigate and manage your Terraform configurations.
- **Comprehensive documentation:** The `docs/` folder houses all the necessary documentation to help you effectively utilize this template repository.
- **Automated workflows:** The repository comes with a set of automated workflows to streamline your development process.

## Layout

### Terraform

The `terraform/` folder contains two subfolders: `environments/` and `modules/`.

The `environments/` folder is where you can define different environments (e.g., development, staging, production) with their respective Terraform configurations. Each environment acts as a Terraform root module.

The `modules/` folder provides a dedicated space for organizing reusable Terraform modules that can be shared across environments. Each module acts as a Terraform child module.

### Workflows

The `.github/workflows/` folder contains a set of automated workflows to streamline your development process. In particular, the following capabilities are provided:

- Deploy infrastructure
- Destroy infrastructure
- Validate Terraform modules
- Generate documentation for Terraform modules

### Documentation

The `docs/` folder contains all the necessary documentation to help you effectively utilize this template repository. It contains information on how to effectively use this repository, how to set up your development environment, and how to use the automated workflows. Specifically, it contains the following files:

- [**Usage guideline**](/docs/usage.md)
- [**Manage environments**](/docs/environment_management.md)
- [**Manage modules**](/docs/module_management.md)
- [**Manage workflows**](/docs/workflows.md)

## Join the Community and Provide Your Feedback

Information on how to join the community and provide your feedback can be found in [CONTRIBUTING.md](/CONTRIBUTING.md).

## License

Released under [MIT](/LICENSE) by [@christosgalano](https://github.com/christosgalano).
