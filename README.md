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
- [ENV](#env)
- [Terraform docs](#terraform-docs)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

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

## ENV

| Name                    | Description                           |
| ----------------------- | ------------------------------------- |
| `VAULT_TOKEN`           | vault token                           |
| `AWS_ENDPOINT_URL_S3`   | endpoint url for the s3 state backend |
| `AWS_REGION`            | region for the s3 state backend       |
| `AWS_ACCESS_KEY_ID`     | username for the s3 state backend     |
| `AWS_SECRET_ACCESS_KEY` | password for the s3 state backend     |

## Terraform docs

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_discord"></a> [discord](#requirement\_discord) | 1.8.1 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 4.3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_discord"></a> [discord](#provider\_discord) | 1.8.1 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.3.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [discord_category_channel.family](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/category_channel) | resource |
| [discord_category_channel.general](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/category_channel) | resource |
| [discord_category_channel.home_automation](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/category_channel) | resource |
| [discord_category_channel.home_ops_talos_flux](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/category_channel) | resource |
| [discord_category_channel.voice](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/category_channel) | resource |
| [discord_server.techtales](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/server) | resource |
| [discord_text_channel.chat](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.configs](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.crowlex](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.floor_heating](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.food](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.gametime](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.holidays](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.home_automation](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.info](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.links](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.nas](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.reviews](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.service_incidents](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.talos_flux_botkube](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.talos_flux_flux_system](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.talos_flux_prometheus_alertmanager](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.techinik](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.todos](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_text_channel.window_venting](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/text_channel) | resource |
| [discord_voice_channel.afk](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/voice_channel) | resource |
| [discord_voice_channel.gaming](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/voice_channel) | resource |
| [discord_voice_channel.minecraft](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/voice_channel) | resource |
| [discord_voice_channel.stream](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/voice_channel) | resource |
| [discord_webhook.talos_flux_botkube](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/webhook) | resource |
| [discord_webhook.talos_flux_flux_system](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/webhook) | resource |
| [discord_webhook.talos_flux_prometheus_alertmanager](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/resources/webhook) | resource |
| [vault_kv_secret_v2.terraform_discord](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/resources/kv_secret_v2) | resource |
| [discord_local_image.flux](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/data-sources/local_image) | data source |
| [discord_local_image.prometheus](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/data-sources/local_image) | data source |
| [discord_server.techtales](https://registry.terraform.io/providers/Lucky3028/discord/1.8.1/docs/data-sources/server) | data source |
| [vault_generic_secret.terraform_discord](https://registry.terraform.io/providers/hashicorp/vault/4.3.0/docs/data-sources/generic_secret) | data source |

### Inputs

No inputs.

### Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->

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
