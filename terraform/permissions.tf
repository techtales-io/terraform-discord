# Channel permission overrides for private Hermes agent channels
# Each owner channel gets 4 permission entries:
#   1. Deny @everyone VIEW_CHANNEL
#   2. Allow the channel owner read/write
#   3. Allow @admin role read/write
#   4. Allow Hermes bot read/write

resource "discord_channel_permission" "deny_everyone" {
  for_each     = local.owner_channels
  channel_id   = module.channel[each.key].data[0].id
  type         = "role"
  overwrite_id = local.everyone_role_id
  deny         = tonumber(local.perms_view_channel)
  allow        = 0
}

resource "discord_channel_permission" "allow_owner" {
  for_each     = local.owner_channels
  channel_id   = module.channel[each.key].data[0].id
  type         = "user"
  overwrite_id = local.user_ids[each.value.spec.owner]
  deny         = 0
  allow        = tonumber(local.perms_read_write_history)
}

resource "discord_channel_permission" "allow_admin" {
  for_each     = local.owner_channels
  channel_id   = module.channel[each.key].data[0].id
  type         = "role"
  overwrite_id = local.admin_role_id
  deny         = 0
  allow        = tonumber(local.perms_read_write_history)
}

resource "discord_channel_permission" "allow_hermes" {
  for_each     = local.owner_channels
  channel_id   = module.channel[each.key].data[0].id
  type         = "user"
  overwrite_id = local.user_ids["hermes"]
  deny         = 0
  allow        = tonumber(local.perms_read_write_history)
}

resource "discord_channel_permission" "allow_euphoria" {
  channel_id   = module.channel["euphoria"].data[0].id
  type         = "user"
  overwrite_id = local.user_ids["euphoria"]
  deny         = 0
  allow        = tonumber(local.perms_read_write_history)
}

resource "discord_channel_permission" "allow_moira" {
  channel_id   = module.channel["moira"].data[0].id
  type         = "user"
  overwrite_id = local.user_ids["moira"]
  deny         = 0
  allow        = tonumber(local.perms_read_write_history)
}

resource "discord_channel_permission" "allow_titan_ai" {
  channel_id   = module.channel["titan-ai"].data[0].id
  type         = "user"
  overwrite_id = local.user_ids["titan-ai"]
  deny         = 0
  allow        = tonumber(local.perms_read_write_history)
}
