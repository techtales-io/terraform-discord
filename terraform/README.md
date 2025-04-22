<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

# TF DOCS

<!-- prettier-ignore-start -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_discord"></a> [discord](#requirement\_discord) | 2.0.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 4.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_assets"></a> [assets](#module\_assets) | ../modules/assets/png-loader | n/a |
| <a name="module_category"></a> [category](#module\_category) | ../modules/discord/category | n/a |
| <a name="module_channel"></a> [channel](#module\_channel) | ../modules/discord/channel | n/a |
| <a name="module_server"></a> [server](#module\_server) | ../modules/discord/server | n/a |
| <a name="module_webhook"></a> [webhook](#module\_webhook) | ../modules/discord/webhook | n/a |
| <a name="module_yaml"></a> [yaml](#module\_yaml) | ../modules/data/yaml-loader | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_kv_secret_v2.terraform_discord](https://registry.terraform.io/providers/hashicorp/vault/4.7.0/docs/resources/kv_secret_v2) | resource |
| [vault_generic_secret.terraform_discord](https://registry.terraform.io/providers/hashicorp/vault/4.7.0/docs/data-sources/generic_secret) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

<!-- prettier-ignore-end -->
