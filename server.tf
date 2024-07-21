# --------------------------------------------------------------------------------
# SETUP SERVER
# --------------------------------------------------------------------------------
resource "discord_server" "techtales" {
  name                          = "techtales.io"
  region                        = "rotterdam"
  afk_channel_id                = "1028684203711271043"
  afk_timeout                   = 900
  default_message_notifications = 1
  verification_level            = 3
}

# Get newly created server's ID
data "discord_server" "techtales" {
  server_id = resource.discord_server.techtales.id
}
