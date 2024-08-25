# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY
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
