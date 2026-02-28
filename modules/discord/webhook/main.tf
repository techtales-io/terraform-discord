terraform {
  required_version = ">= 1.10.0, <= 1.14.6"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "2.5.0"
    }
  }
}

variable "config" {
  type = any
}

variable "channel" {
  type = any
}

variable "assets" {
  type = map(string)
}

output "data" {
  value = discord_webhook.main
}

# data "discord_local_image" "main" {
#   count = can(var.config.avatar) ? 1 : 0
#   file = "${path.root}/../${var.config.avatar}"
# }

resource "discord_webhook" "main" {
  channel_id      = var.channel[0].id
  name            = can(var.config.spec.displayName) ? var.config.spec.displayName : var.config.metadata.name
  avatar_data_uri = can(var.assets[var.config.spec.avatar]) ? var.assets[var.config.spec.avatar] : null
}
