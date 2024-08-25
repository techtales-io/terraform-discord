# --------------------------------------------------------------------------------
# CONFIGURE SERVER
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
