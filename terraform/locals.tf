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
}
