terraform {
  required_version = ">= 1.9.0"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "1.9.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
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
  source = "../modules/discord/server"
  config = each.value
}

module "category" {
  for_each = module.yaml.data.categories
  source = "../modules/discord/category"
  config = each.value
  server_config = module.yaml.data.servers[each.value.metadata.namespace]
  server = module.server[each.value.metadata.namespace].data
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
  source = "../modules/discord/webhook"
  config = each.value
  channel = module.channel[each.value.spec.channel].data
  assets = module.assets.data
}

# output "debug" {
#   value = module.assets.data
# }

# --------------------------------------------------------------------------------
# CONFIGURE SERVER ROLES
# --------------------------------------------------------------------------------

# data "discord_permission" "member" {
#   view_channel     = "allow"
#   send_messages    = "allow"
#   use_vad          = "deny"
#   priority_speaker = "deny"
# }
# data "discord_permission" "moderator" {
#   allow_extends    = data.discord_permission.member.allow_bits
#   deny_extends     = data.discord_permission.member.deny_bits
#   kick_members     = "allow"
#   ban_members      = "allow"
#   manage_nicknames = "allow"
#   view_audit_log   = "allow"
#   priority_speaker = "allow"
# }

# data "discord_color" "blue" {
#   hex = "#4287f5"
# }

# resource "discord_role" "mods" {
#     server_id =module.server["techtales.io"].data.id
#     name = "@mods"
#     permissions = data.discord_permission.moderator.allow_bits
#     color = data.discord_color.blue.dec
#     hoist = true
#     mentionable = true
#     position = 1
# }

# data "discord_local_image" "prometheus" {
#   file = "${path.module}/../assets/prometheus.png"
# }


# resource "discord_webhook" "talos_flux_prometheus_alertmanager" {
#   # channel_id      = resource.discord_text_channel.talos_flux_prometheus_alertmanager.id
#   channel_id      = module.channel["alerts"].data[0].id
#   name            = "talos-flux - Prometheus Alertmanager"
#   avatar_data_uri = data.discord_local_image.prometheus.data_uri
# }

# output "talos_flux_prometheus_alertmanager_url" {
#   value = nonsensitive(discord_webhook.talos_flux_prometheus_alertmanager.url)
# }

# data "discord_local_image" "flux" {
#   file = "${path.module}/../assets/flux.png"
# }

# resource "discord_webhook" "talos_flux_flux_system" {
#   # channel_id      = resource.discord_text_channel.talos_flux_flux_system.id
#   channel_id = module.channel["flux-system"].data[0].id
#   name            = "talos-flux - Flux Reconciler"
#   avatar_data_uri = data.discord_local_image.flux.data_uri
# }

# output "talos_flux_flux_system_url" {
#   value = nonsensitive(discord_webhook.talos_flux_flux_system.url)
# }

# data "discord_local_image" "botkube" {
#   file = "${path.module}/assets/botkube-dalle3.png"
# }

# resource "discord_webhook" "talos_flux_botkube" {
#   # channel_id = resource.discord_text_channel.talos_flux_botkube.id
#   channel_id = module.channel["botkube"].data[0].id
#   name       = "talos-flux - Botkube"
#   # avatar_data_uri = data.discord_local_image.botkube.data_uri
# }

# output "talos_flux_botkube_url" {
#   value = nonsensitive(discord_webhook.talos_flux_botkube.url)
# }

# write the webhooks to vault
resource "vault_kv_secret_v2" "terraform_discord" {
  mount               = "infra"
  name                = "techtales/terraform-discord"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    discord_token                  = data.vault_generic_secret.terraform_discord.data["discord_token"]
    talos_flux_flux_system_webhook = module.webhook["botkube"].data.url
    talos_flux_prometheus_webhook  = module.webhook["prometheus-alertmanager"].data.url
    talos_flux_flux_system_webhook = module.webhook["flux-system"].data.url
  })
}
