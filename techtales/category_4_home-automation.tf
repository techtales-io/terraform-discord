# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY
# --------------------------------------------------------------------------------

resource "discord_category_channel" "home_automation" {
  name      = "🏠・HOME AUTOMATION"
  position  = 4
  server_id = data.discord_server.techtales.id
}

resource "discord_text_channel" "floor_heating" {
  name                     = "🌡・floor-heating"
  position                 = 0
  sync_perms_with_category = true
  topic                    = "floor heating"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_automation.id
}

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
