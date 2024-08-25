# --------------------------------------------------------------------------------
# CONFIGURE PROVIDERS
# --------------------------------------------------------------------------------

# https://registry.terraform.io/providers/hashicorp/vault/latest/docs
provider "vault" {
}

data "vault_generic_secret" "terraform_discord" {
  path = "infra/techtales/terraform-discord"
}

# https://registry.terraform.io/providers/Lucky3028/discord/latest/docs
provider "discord" {
  token = data.vault_generic_secret.terraform_discord.data["discord_token"]
}
