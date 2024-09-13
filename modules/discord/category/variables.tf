variable "config" {
  type = object({
    apiVersion = string
    kind       = string
    metadata = object({
      name      = string
      namespace = optional(string)
    })
    spec = object({
      displayName = optional(string)
      channels    = list(string)
    })
  })

  validation {
    condition     = var.config.apiVersion == "terraform.techtales.io/v1alpha1"
    error_message = "The api must be `terraform.techtales.io` in version `v1alpha1`."
  }

  validation {
    condition     = var.config.kind == "DiscordCategoryChannel"
    error_message = "The kind must be 'DiscordCategoryChannel'."
  }

  validation {
    condition     = can(regex("^[a-z0-9-.]+$", var.config.metadata.name)) && var.config.metadata.name != ""
    error_message = "The metadata.name must be a non-empty string."
  }

  validation {
    condition     = var.config.spec.displayName == null || trim(var.config.spec.displayName, " \n\t") != ""
    error_message = "The metadata.name must be a non-empty string."
  }

  validation {
    condition     = length(var.config.spec.channels) > 0
    error_message = "The `channels` list in the spec must contain ar least one channel."
  }
}

variable "server_config" {
  # TODO: add proper structure and validation
  type = any
}

variable "server" {
  # TODO: add proper structure and validation
  type = any
}
