# --------------------------------------------------------------------------------
# CONFIGURE CATEGORY
# --------------------------------------------------------------------------------

resource "discord_category_channel" "home_ops_talos_flux" {
  name      = "🚢 HOME-OPS - TALOS-FLUX"
  position  = 3
  server_id = data.discord_server.techtales.id
}

resource "discord_text_channel" "talos_flux_prometheus_alertmanager" {
  name                     = "🚨・alerts"
  position                 = 0
  sync_perms_with_category = true
  topic                    = "from Prometheus Alertmanager"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_ops_talos_flux.id
}

resource "discord_text_channel" "talos_flux_flux_system" {
  name                     = "💬・flux-system"
  position                 = 1
  sync_perms_with_category = true
  topic                    = "flux-system alerts and info"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_ops_talos_flux.id
}

# Botkube is a kubernetes bot for monitoring and debugging your applications and infrastructure
# in a kubernetes cluster. This is his channel.
resource "discord_text_channel" "talos_flux_botkube" {
  name                     = "🤖・botkube"
  position                 = 2
  sync_perms_with_category = true
  topic                    = "monitor + act on your K8s cluster"
  server_id                = data.discord_server.techtales.id
  category                 = resource.discord_category_channel.home_ops_talos_flux.id
}
