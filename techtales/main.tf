# --------------------------------------------------------------------------------
# CONFIGURE TERRAFORM
# --------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0, <= 1.9.5"
  required_providers {
    # https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
    discord = {
      source  = "Lucky3028/discord"
      version = "1.8.1"
    }
    # https://registry.terraform.io/providers/hashicorp/vault/latest/docs
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }
  }
}
