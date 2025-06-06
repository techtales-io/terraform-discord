terraform {
  required_version = ">= 1.9.0"

  required_providers {
    discord = {
      # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
      source  = "Lucky3028/discord"
      version = "2.0.1"
    }
  }
}

resource "discord_category_channel" "main" {
  name      = can(var.config.spec.displayName) ? var.config.spec.displayName : var.config.metadata.name
  position  = index(var.server_config.spec.categories, var.config.metadata.name)
  server_id = var.server.id
}
