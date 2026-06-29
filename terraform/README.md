<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

# TF DOCS

<!-- markdownlint-disable -->
<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0, <= 1.15.7 |
| <a name="requirement_discord"></a> [discord](#requirement\_discord) | 2.7.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 5.10.1 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_discord"></a> [discord](#provider\_discord) | 2.7.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.10.1 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_assets"></a> [assets](#module\_assets) | ../modules/assets/png-loader | n/a |
| <a name="module_category"></a> [category](#module\_category) | ../modules/discord/category | n/a |
| <a name="module_channel"></a> [channel](#module\_channel) | ../modules/discord/channel | n/a |
| <a name="module_server"></a> [server](#module\_server) | ../modules/discord/server | n/a |
| <a name="module_webhook"></a> [webhook](#module\_webhook) | ../modules/discord/webhook | n/a |
| <a name="module_yaml"></a> [yaml](#module\_yaml) | ../modules/data/yaml-loader | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [discord_channel_permission.allow_admin](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.allow_euphoria](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.allow_hermes](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.allow_moira](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.allow_nova](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.allow_owner](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.allow_titan_ai](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [discord_channel_permission.deny_everyone](https://registry.terraform.io/providers/Lucky3028/discord/2.7.0/docs/resources/channel_permission) | resource |
| [vault_kv_secret_v2.terraform_discord](https://registry.terraform.io/providers/hashicorp/vault/5.10.1/docs/resources/kv_secret_v2) | resource |
| [vault_generic_secret.terraform_discord](https://registry.terraform.io/providers/hashicorp/vault/5.10.1/docs/data-sources/generic_secret) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
<!-- markdownlint-enable -->
