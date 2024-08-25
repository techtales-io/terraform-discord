# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY
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
