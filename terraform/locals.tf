locals {
  # Create a map of categories, each containing a map of channels
  category_channel_map = {
    for category_name, category_data in module.yaml.data.categories :
    category_name => {
      for channel_name in category_data.spec.channels :
      channel_name => category_data
    }
  }

  # Flatten the nested map into a single map of channel_name to category_data
  channel_to_category = merge(values(local.category_channel_map)...)

  # Discord user snowflake IDs for private channel access control
  user_ids = {
    crowlex  = "1028665851588657263"
    techinik = "1381694540964040714"
    jazzlyn  = "777140685118898176"
    tyriis   = "713481031768080388"
    hermes   = "1504207550097260716"
    euphoria = "1510342663701004318"
    moira    = "1512927492577689620"
    titan-ai = "1513107170533703730"
    nova     = "1513218263885287584"
  }

  # @everyone role ID is always the server/guild ID in Discord
  everyone_role_id = module.server["techtales.io"].data.id
  admin_role_id    = "829004846152941648"

  # Permission bitmasks used:
  # VIEW_CHANNEL (0x400)        = 1024
  # SEND_MESSAGES (0x800)       = 2048
  # READ_MESSAGE_HISTORY (0x10000) = 65536
  # read + write + history = 1024 + 2048 + 65536 = 68608
  perms_read_write_history = "68608"
  perms_view_channel       = "1024"

  # Filter channels that have an owner (private per-user channels)
  owner_channels = {
    for ch_name, ch_data in module.yaml.data.channels :
    ch_name => ch_data
    if try(ch_data.spec.owner, null) != null
  }
}
