terraform {
  required_version = ">= 1.10.0, <= 1.14.4"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "2.3.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "5.6.0"
    }
  }
}

module "yaml" {
  source = "../modules/data/yaml-loader"
}

module "assets" {
  source = "../modules/assets/png-loader"
}

module "server" {
  for_each = module.yaml.data.servers
  source   = "../modules/discord/server"
  config   = each.value
}

module "category" {
  for_each      = module.yaml.data.categories
  source        = "../modules/discord/category"
  config        = each.value
  server_config = module.yaml.data.servers[each.value.metadata.namespace]
  server        = module.server[each.value.metadata.namespace].data
}

module "channel" {
  for_each        = module.yaml.data.channels
  source          = "../modules/discord/channel"
  config          = each.value
  category_config = local.channel_to_category[each.value.metadata.name]
  category        = module.category[local.channel_to_category[each.value.metadata.name].metadata.name].data
  server          = module.server[each.value.metadata.namespace].data
}

module "webhook" {
  for_each = module.yaml.data.webhooks
  source   = "../modules/discord/webhook"
  config   = each.value
  channel  = module.channel[each.value.spec.channel].data
  assets   = module.assets.data
}

# write the webhooks to vault
resource "vault_kv_secret_v2" "terraform_discord" {
  mount               = "infra"
  name                = "techtales/terraform-discord"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    discord_token                  = data.vault_generic_secret.terraform_discord.data["discord_token"]
    talos_flux_botkube_webhook     = module.webhook["botkube"].data.url
    talos_flux_prometheus_webhook  = module.webhook["prometheus-alertmanager"].data.url
    talos_flux_flux_system_webhook = module.webhook["flux-system"].data.url
  })
}
