terraform {
  required_version = ">= 1.10.0, <= 1.14.5"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "2.4.0"
    }
  }
}

# https://registry.terraform.io/providers/Lucky3028/discord/latest/docs/resources/server
resource "discord_server" "main" {
  name                          = var.config.metadata.name
  region                        = var.config.spec.region
  afk_channel_id                = can(var.config.spec.afkChannelId) ? var.config.spec.afkChannelId : null
  afk_timeout                   = can(var.config.spec.afkTimeout) ? var.config.spec.afkTimeout : 300
  default_message_notifications = can(var.config.spec.defaultMessageNotifications) ? var.config.spec.defaultMessageNotifications : 1
  verification_level            = can(var.config.spec.verificationLevels) ? var.config.spec.verificationLevels : 3
}
