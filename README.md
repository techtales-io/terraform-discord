<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]
[![terraform][terraform-shield]][terraform-url]
[![statefile][statefile-shield]](README.md)

# Terraform Discord for techtales.io

Discord Server Infrastructure as code with Terraform.

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Code-Style](#code-style)
  - [Terraform](#terraform)
- [Getting Started](#getting-started)
  - [Prerequisties](#prerequisties)
  - [Initialize repository](#initialize-repository)
- [Configuration](#configuration)
  - [env](#env)
- [CRD like data structure](#crd-like-data-structure)
  - [Easy Collaboration](#easy-collaboration)
  - [Versioning and Change Management](#versioning-and-change-management)
  - [Data and Logic Separation](#data-and-logic-separation)
  - [Flexibility in Spec Changes](#flexibility-in-spec-changes)
  - [Standardization and Consistency](#standardization-and-consistency)
  - [Improved Maintainability](#improved-maintainability)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## Code-Style

### Terraform

#### Best practices

[terraform-best-practices.com][terraform-best-practices]

#### Naming of Terraform resources

- lower-case characters

Pattern: `[a-z_-]+`

## Getting Started

### Prerequisties

- [pre-commit][pre-commit-url]
- [terraform][terraform-url]
- [terraform-docs][terraform-docs]
- [tflint][tflint]
- [trivy][trivy]

### Initialize repository

Terraform and pre-commit framework need to get initialized.

```console
task terraform:init
task pre-commit:init
```

## Configuration

### env

| Name                    | Description                           |
| ----------------------- | ------------------------------------- |
| `VAULT_TOKEN`           | vault token                           |
| `AWS_ENDPOINT_URL_S3`   | endpoint url for the s3 state backend |
| `AWS_REGION`            | region for the s3 state backend       |
| `AWS_ACCESS_KEY_ID`     | username for the s3 state backend     |
| `AWS_SECRET_ACCESS_KEY` | password for the s3 state backend     |

## CRD like data structure

By leveraging YAML-like CRDs as Terraform inputs, we can create a more flexible, maintainable, and collaborative infrastructure-as-code ecosystem that can easily adapt to changing requirements and team dynamics.

### Easy Collaboration

- **Human-readable format**: YAML is easy to read and write, making it accessible for team members with varying technical expertise.
- **Version control friendly**: YAML files are text-based, allowing for easy tracking of changes in version control systems like Git.

### Versioning and Change Management

- **Clear versioning**: The apiVersion field allows for easy tracking of schema changes over time.
- **Structured updates**: Changes to resources can be clearly documented and reviewed in pull requests.

### Data and Logic Separation

- **Clean separation**: YAML files contain only data, while Terraform handles the logic, promoting a clear separation of concerns.
- **Reduced complexity**: Simplifies maintenance by keeping configuration data separate from infrastructure-as-code logic.

### Flexibility in Spec Changes

- **Extensible structure**: The spec section can be easily extended to accommodate new fields or configurations without breaking existing setups.
- **Backward compatibility**: New versions can be introduced while maintaining support for older versions.

### Standardization and Consistency

- **Uniform structure**: Consistent format across different resource types improves readability and reduces errors.
- **Metadata support**: The metadata section provides a standardized way to include additional information about resources.

### Improved Maintainability

- **Modular approach**: Each resource is defined in its own YAML block, making it easier to manage and update individual components.
- **Reusability**: YAML blocks can be easily copied, shared, or templated for use across different projects or environments.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[terraform-best-practices]: https://www.terraform-best-practices.com/naming
[terraform-docs]: https://github.com/terraform-docs/terraform-docs
[tflint]: https://github.com/terraform-linters/tflint
[trivy]: https://aquasecurity.github.io/trivy

<!-- Badges -->

[terraform-shield]: https://img.shields.io/badge/terraform-1.x-844fba?logo=terraform
[terraform-url]: https://www.terraform.io/
[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[taskfile-shield]: https://img.shields.io/badge/taskfile-enabled-brightgreen?logo=task
[taskfile-url]: https://taskfile.dev/
[statefile-shield]: https://img.shields.io/badge/minio-tfstate-F8991D.svg?logo=amazons3
