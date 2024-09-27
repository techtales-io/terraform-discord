# --------------------------------------------------------------------------------
# CONFIGURE WEBHOOKS
# --------------------------------------------------------------------------------

data "discord_local_image" "prometheus" {
  file = "${path.root}/assets/prometheus.png"
}


resource "discord_webhook" "talos_flux_prometheus_alertmanager" {
  channel_id      = resource.discord_text_channel.talos_flux_prometheus_alertmanager.id
  name            = "talos-flux - Prometheus Alertmanager"
  avatar_data_uri = data.discord_local_image.prometheus.data_uri
}

# output "talos_flux_prometheus_alertmanager_url" {
#   value = nonsensitive(discord_webhook.talos_flux_prometheus_alertmanager.url)
# }

data "discord_local_image" "flux" {
  file = "${path.root}/assets/flux.png"
}

resource "discord_webhook" "talos_flux_flux_system" {
  channel_id      = resource.discord_text_channel.talos_flux_flux_system.id
  name            = "talos-flux - Flux Reconciler"
  avatar_data_uri = data.discord_local_image.flux.data_uri
}

# output "talos_flux_flux_system_url" {
#   value = nonsensitive(discord_webhook.talos_flux_flux_system.url)
# }

# data "discord_local_image" "botkube" {
#   file = "${path.module}/assets/botkube-dalle3.png"
# }

resource "discord_webhook" "talos_flux_botkube" {
  channel_id = resource.discord_text_channel.talos_flux_botkube.id
  name       = "talos-flux - Botkube"
  # avatar_data_uri = data.discord_local_image.botkube.data_uri
}

# output "talos_flux_botkube_url" {
#   value = nonsensitive(discord_webhook.talos_flux_botkube.url)
# }

# write the webhooks to vault
resource "vault_kv_secret_v2" "terraform_discord" {
  mount               = "infra"
  name                = "techtales/terraform-discord"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode({
    discord_token                  = var.discord_token
    talos_flux_botkube_webhook     = discord_webhook.talos_flux_botkube.url
    talos_flux_prometheus_webhook  = discord_webhook.talos_flux_prometheus_alertmanager.url
    talos_flux_flux_system_webhook = discord_webhook.talos_flux_flux_system.url
  })
}
