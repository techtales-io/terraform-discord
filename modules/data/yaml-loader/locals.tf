locals {
  # Function to read and decode YAML files
  manifests = {
    for v in fileset("${path.root}/../data", "**/*.yaml") :
    basename(v) => yamldecode(file("${path.root}/../data/${v}"))
  }

  # Filter and ogranize server(s)
  servers = {
    for v in local.manifests :
    v.metadata.name => v
    if v.kind == "DiscordServer"
  }

  # Filter and organize categories
  categories = {
    for v in local.manifests :
    v.metadata.name => v
    if v.kind == "DiscordCategoryChannel"
  }

  # Filter and organize channels
  channels = {
    for v in local.manifests :
    v.metadata.name => v
    if v.kind == "DiscordTextChannel" || v.kind == "DiscordVoiceChannel"
  }

  # Filter and organize webhooks
  webhooks = {
    for v in local.manifests :
    v.metadata.name => v
    if v.kind == "DiscordWebhook"
  }
}
