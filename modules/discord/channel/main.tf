terraform {
  required_version = ">= 1.10.0, <= 1.14.5"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "2.3.0"
    }
  }
}

variable "config" {
  # TODO: add proper structure and validation
  type = any
}

variable "category_config" {
  # TODO: add proper structure and validation
  type = any
}

variable "category" {
  # TODO: add proper structure and validation
  type = any
}

variable "server" {
  # TODO: add proper structure and validation
  type = any
}

output "data" {
  value = can(discord_text_channel.main) ? discord_text_channel.main : discord_voice_channel.main
}

# TODO: add link to resource docu
resource "discord_text_channel" "main" {
  count = var.config.kind == "DiscordTextChannel" ? 1 : 0
  # required
  name      = can(var.config.spec.displayName) ? var.config.spec.displayName : var.config.metadata.name
  server_id = var.server.id
  # optional
  category                 = var.category.id
  nsfw                     = can(var.config.spec.nsfw) ? true : false
  position                 = index(var.category_config.spec.channels, var.config.metadata.name)
  sync_perms_with_category = try(var.config.spec.syncPermissionsWithCategory, true)
  topic                    = can(var.config.spec.topic) ? var.config.spec.topic : null
}

resource "discord_voice_channel" "main" {
  count = var.config.kind == "DiscordVoiceChannel" ? 1 : 0
  # required
  name      = can(var.config.spec.displayName) ? var.config.spec.displayName : var.config.metadata.name
  server_id = var.server.id
  # optional
  bitrate                  = can(var.config.spec.bitrate) ? var.config.spec.bitrate : 64000
  category                 = var.category.id
  position                 = index(var.category_config.spec.channels, var.config.metadata.name)
  sync_perms_with_category = try(var.config.spec.syncPermissionsWithCategory, true)
  user_limit               = can(var.config.spec.userLimit) ? var.config.spec.userLimit : 0
}
