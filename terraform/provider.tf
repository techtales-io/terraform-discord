provider "vault" {
  # ATLANTIS_INJECT_VAULT_CONFIG
}

data "vault_generic_secret" "terraform_discord" {
  path = "infra/techtales/terraform-discord"
}

provider "discord" {
  token = data.vault_generic_secret.terraform_discord.data["discord_token"]
}
