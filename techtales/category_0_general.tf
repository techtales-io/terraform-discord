# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY
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
  name                     = "reviews"
  position                 = 10
  sync_perms_with_category = true
  topic                    = "reviews"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.general.id
}
