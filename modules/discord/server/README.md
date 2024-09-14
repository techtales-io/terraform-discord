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
| <a name="requirement_discord"></a> [discord](#requirement\_discord) | 1.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_discord"></a> [discord](#provider\_discord) | 1.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [discord_server.main](https://registry.terraform.io/providers/Lucky3028/discord/1.9.0/docs/resources/server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | n/a | <pre>object({<br>    apiVersion = string<br>    kind       = string<br>    metadata = object({<br>      name      = string<br>      namespace = optional(string)<br>    })<br>    spec = object({<br>      afkTimeout                  = optional(number)<br>      afkChannelId                = optional(string)<br>      categories                  = optional(list(string))<br>      defaultMessageNotifications = optional(number)<br>      region                      = string<br>      verificationLevel           = optional(number)<br>    })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data"></a> [data](#output\_data) | n/a |
<!-- END_TF_DOCS -->

<!-- prettier-ignore-end -->
