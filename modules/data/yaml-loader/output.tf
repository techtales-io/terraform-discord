output "data" {
  value = {
    servers = local.servers
    categories = local.categories
    channels = local.channels
    webhooks = local.webhooks
  }
}
