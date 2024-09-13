moved {
  from = discord_server.techtales
  to   = module.server["techtales.io"].discord_server.main
}

moved {
  from = discord_category_channel.family
  to   = module.category["family"].discord_category_channel.main
}

moved {
  from = discord_category_channel.voice
  to   = module.category["voice-channels"].discord_category_channel.main
}

moved {
  from = discord_category_channel.home_automation
  to   = module.category["home-automation"].discord_category_channel.main
}

moved {
  from = discord_category_channel.home_ops_talos_flux
  to   = module.category["home-ops"].discord_category_channel.main
}

moved {
  from = discord_category_channel.general
  to   = module.category["general"].discord_category_channel.main
}

moved {
  from = discord_text_channel.chat
  to   = module.channel["chat"].discord_text_channel.main[0]
}

moved {
  from = discord_text_channel.configs
  to   = module.channel["configs"].discord_text_channel.main[0]
}

moved {
  from = discord_text_channel.crowlex
  to   = module.channel["crowlex"].discord_text_channel.main[0]
}
# discord_text_channel.floor_heating
moved {
  from = discord_text_channel.floor_heating
  to   = module.channel["floor-heating"].discord_text_channel.main[0]
}
# discord_text_channel.food
moved {
  from = discord_text_channel.food
  to   = module.channel["food"].discord_text_channel.main[0]
}
# discord_text_channel.gametime
moved {
  from = discord_text_channel.gametime
  to   = module.channel["gametime"].discord_text_channel.main[0]
}
# discord_text_channel.holidays
moved {
  from = discord_text_channel.holidays
  to   = module.channel["holidays"].discord_text_channel.main[0]
}
# discord_text_channel.home_automation
moved {
  from = discord_text_channel.home_automation
  to   = module.channel["home-automation"].discord_text_channel.main[0]
}
# discord_text_channel.info
moved {
  from = discord_text_channel.info
  to   = module.channel["info"].discord_text_channel.main[0]
}
# discord_text_channel.links
moved {
  from = discord_text_channel.links
  to   = module.channel["links"].discord_text_channel.main[0]
}
# discord_text_channel.nas
moved {
  from = discord_text_channel.nas
  to   = module.channel["nas"].discord_text_channel.main[0]
}
# discord_text_channel.reviews
moved {
  from = discord_text_channel.reviews
  to   = module.channel["reviews"].discord_text_channel.main[0]
}
# discord_text_channel.service_incidents
moved {
  from = discord_text_channel.service_incidents
  to   = module.channel["service-incidents"].discord_text_channel.main[0]
}
# discord_text_channel.talos_flux_botkube
moved {
  from = discord_text_channel.talos_flux_botkube
  to   = module.channel["botkube"].discord_text_channel.main[0]
}
# discord_text_channel.talos_flux_flux_system
moved {
  from = discord_text_channel.talos_flux_flux_system
  to   = module.channel["flux-system"].discord_text_channel.main[0]
}
# discord_text_channel.talos_flux_prometheus_alertmanager
moved {
  from = discord_text_channel.talos_flux_prometheus_alertmanager
  to   = module.channel["alerts"].discord_text_channel.main[0]
}
# discord_text_channel.techinik
moved {
  from = discord_text_channel.techinik
  to   = module.channel["techinik"].discord_text_channel.main[0]
}
# discord_text_channel.todos
moved {
  from = discord_text_channel.todos
  to   = module.channel["todos"].discord_text_channel.main[0]
}
# discord_text_channel.window_venting
moved {
  from = discord_text_channel.window_venting
  to   = module.channel["window-venting"].discord_text_channel.main[0]
}
# discord_voice_channel.afk
moved {
  from = discord_voice_channel.afk
  to   = module.channel["afk"].discord_voice_channel.main[0]
}
# discord_voice_channel.gaming
moved {
  from = discord_voice_channel.gaming
  to   = module.channel["gaming"].discord_voice_channel.main[0]
}
# discord_voice_channel.minecraft
moved {
  from = discord_voice_channel.minecraft
  to   = module.channel["minecraft"].discord_voice_channel.main[0]
}
# discord_voice_channel.stream
moved {
  from = discord_voice_channel.stream
  to   = module.channel["stream"].discord_voice_channel.main[0]
}
# discord_webhook.talos_flux_prometheus_alertmanager
moved {
  from = discord_webhook.talos_flux_prometheus_alertmanager
  to   = module.webhook["prometheus-alertmanager"].discord_webhook.main
}
# discord_webhook.talos_flux_botkube
moved {
  from = discord_webhook.talos_flux_botkube
  to   = module.webhook["botkube"].discord_webhook.main
}
# discord_webhook.talos_flux_flux_system
moved {
  from = discord_webhook.talos_flux_flux_system
  to   = module.webhook["flux-system"].discord_webhook.main
}
