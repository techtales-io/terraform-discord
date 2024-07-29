# --------------------------------------------------------------------------------
# SETUP TERRAFORM
# --------------------------------------------------------------------------------
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "1.8.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.3.0"
    }
  }
}

# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY GENERAL
# --------------------------------------------------------------------------------
resource "discord_category_channel" "general" {
  name      = "🦄・GENERAL"
  position  = 0
  server_id = data.discord_server.techtales.id
}

resource "discord_text_channel" "chat" {
  name      = "💬・chat"
  position  = 0
  server_id = data.discord_server.techtales.id
  category  = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "service_incidents" {
  name                     = "⚠・service-incidents"
  position                 = 1
  sync_perms_with_category = true
  topic                    = "maybe there is a real problem out there"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "techinik" {
  name                     = "👦・techinik・🎮"
  position                 = 2
  sync_perms_with_category = false
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "crowlex" {
  name                     = "👦・crowlex・🎮"
  position                 = 3
  sync_perms_with_category = true
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "links" {
  name                     = "🔗・links"
  position                 = 5
  sync_perms_with_category = false
  topic                    = "links for later"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "configs" {
  name                     = "📁・configs"
  position                 = 6
  sync_perms_with_category = false
  topic                    = "configs for later"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "todos" {
  name                     = "📋・todos"
  position                 = 7
  sync_perms_with_category = false
  topic                    = "one day…"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "food" {
  name                     = "🍲・food"
  position                 = 8
  sync_perms_with_category = true
  topic                    = "mjam mjam mjam.at"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "holidays" {
  name                     = "🏖・holidays"
  position                 = 9
  sync_perms_with_category = false
  topic                    = "holiday planning"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

resource "discord_text_channel" "reviews" {
  name                     = "・reviews"
  position                 = 10
  sync_perms_with_category = false
  topic                    = "github reviews"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}

# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY FAMILY
# --------------------------------------------------------------------------------
resource "discord_category_channel" "family" {
  name      = "🌈・FAMILY"
  position  = 1
  server_id = data.discord_server.techtales.id
}

resource "discord_text_channel" "info" {
  name                     = "ℹ・info"
  position                 = 0
  sync_perms_with_category = false
  topic                    = "share all kind of informations with the family"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.family.id
}

resource "discord_text_channel" "gametime" {
  name                     = "🎮・gametime"
  position                 = 1
  sync_perms_with_category = true
  topic                    = "gametime"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.family.id
}

# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY HOME-OPS - TALOS-FLUX
# --------------------------------------------------------------------------------
resource "discord_category_channel" "home_ops_talos_flux" {
  name      = "🚢 HOME-OPS - TALOS-FLUX"
  position  = 3
  server_id = data.discord_server.techtales.id
}

resource "discord_text_channel" "talos_flux_prometheus_alertmanager" {
  name                     = "🚨・alerts"
  position                 = 0
  sync_perms_with_category = true
  topic                    = "from Prometheus Alertmanager"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_ops_talos_flux.id
}

resource "discord_text_channel" "talos_flux_flux_system" {
  name                     = "💬・flux-system"
  position                 = 1
  sync_perms_with_category = true
  topic                    = "flux-system alerts and info"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_ops_talos_flux.id
}

# Botkube is a kubernetes bot for monitoring and debugging your applications and infrastructure
# in a kubernetes cluster. This is his channel.
resource "discord_text_channel" "talos_flux_botkube" {
  name                     = "🤖・botkube"
  position                 = 2
  sync_perms_with_category = true
  topic                    = "monitor + act on your K8s cluster"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_ops_talos_flux.id

}

# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY HOME-AUTOMATION
# --------------------------------------------------------------------------------
resource "discord_category_channel" "home_automation" {
  name      = "🏠・HOME AUTOMATION"
  position  = 4
  server_id = data.discord_server.techtales.id
}

# add channel for the floor heating with a unicode icon
resource "discord_text_channel" "floor_heating" {
  name                     = "🌡・floor-heating"
  position                 = 0
  sync_perms_with_category = true
  topic                    = "floor heating"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_automation.id
}

# add a channel for window venting with a unicode icon
resource "discord_text_channel" "window_venting" {
  name                     = "🪟・window-venting"
  position                 = 1
  sync_perms_with_category = true
  topic                    = "window venting"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_automation.id
}

resource "discord_text_channel" "nas" {
  name                     = "📢・nas"
  position                 = 2
  sync_perms_with_category = false
  topic                    = "synology disk station alerts and infos"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_automation.id
}

resource "discord_text_channel" "home_automation" {
  name                     = "🧙・home-automation"
  position                 = 3
  sync_perms_with_category = false
  topic                    = "beep beep beep"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_automation.id
}

# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY VOICE
# --------------------------------------------------------------------------------
resource "discord_category_channel" "voice" {
  name      = "🔊・VOICE CHANNELS"
  position  = 2
  server_id = data.discord_server.techtales.id
}

resource "discord_voice_channel" "stream" {
  name                     = "🎙・stream"
  server_id                = data.discord_server.techtales.id
  position                 = 0
  category                 = resource.discord_category_channel.voice.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "afk" {
  name                     = "💤・AFK"
  server_id                = data.discord_server.techtales.id
  position                 = 1
  category                 = resource.discord_category_channel.voice.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "gaming" {
  name                     = "🎮・gaming"
  server_id                = data.discord_server.techtales.id
  position                 = 2
  category                 = resource.discord_category_channel.voice.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "minecraft" {
  name                     = "⛏・minecraft"
  server_id                = data.discord_server.techtales.id
  position                 = 3
  category                 = resource.discord_category_channel.voice.id
  sync_perms_with_category = true
}

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
#     server_id = data.discord_server.techtales.id
#     name = "@mods"
#     permissions = data.discord_permission.moderator.allow_bits
#     color = data.discord_color.blue.dec
#     hoist = true
#     mentionable = true
#     position = 1
# }

data "discord_local_image" "prometheus" {
  file = "${path.module}/assets/prometheus.png"
}


resource "discord_webhook" "talos_flux_prometheus_alertmanager" {
  channel_id      = resource.discord_text_channel.talos_flux_prometheus_alertmanager.id
  name            = "talos-flux - Prometheus Alertmanager"
  avatar_data_uri = data.discord_local_image.prometheus.data_uri
}

# output "talos_flux_prometheus_alertmanager_url" {
#   value = nonsensitive(discord_webhook.talos_flux_prometheus_alertmanager.url)
# }

data "discord_local_image" "flux" {
  file = "${path.module}/assets/flux.png"
}

resource "discord_webhook" "talos_flux_flux_system" {
  channel_id      = resource.discord_text_channel.talos_flux_flux_system.id
  name            = "talos-flux - Flux Reconciler"
  avatar_data_uri = data.discord_local_image.flux.data_uri
}

# output "talos_flux_flux_system_url" {
#   value = nonsensitive(discord_webhook.talos_flux_flux_system.url)
# }

# data "discord_local_image" "botkube" {
#   file = "${path.module}/assets/botkube-dalle3.png"
# }

resource "discord_webhook" "talos_flux_botkube" {
  channel_id = resource.discord_text_channel.talos_flux_botkube.id
  name       = "talos-flux - Botkube"
  # avatar_data_uri = data.discord_local_image.botkube.data_uri
}

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
    talos_flux_botkube_webhook     = discord_webhook.talos_flux_botkube.url
    talos_flux_prometheus_webhook  = discord_webhook.talos_flux_prometheus_alertmanager.url
    talos_flux_flux_system_webhook = discord_webhook.talos_flux_flux_system.url
  })
}
