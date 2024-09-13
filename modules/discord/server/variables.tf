variable "config" {
  type = object({
    apiVersion = string
    kind       = string
    metadata = object({
      name      = string
      namespace = optional(string)
    })
    spec = object({
      afkTimeout                  = optional(number)
      afkChannelId                = optional(string)
      categories                  = optional(list(string))
      defaultMessageNotifications = optional(number)
      region                      = string
      verificationLevel           = optional(number)
    })
  })

  validation {
    condition     = var.config.kind == "DiscordServer"
    error_message = "The kind must be 'DiscordServer'."
  }

  validation {
    condition     = var.config.metadata.name != ""
    error_message = "The metadata.name must be a non-empty string."
  }

  validation {
    condition     = contains(["us-west", "us-east", "us-central", "us-south", "singapore", "sydney", "rotterdam", "brazil", "hongkong", "russia", "japan", "india", "south-africa"], var.config.spec.region)
    error_message = "The spec.region must be a valid Discord server region."
  }
}
