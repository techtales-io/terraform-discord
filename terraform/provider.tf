provider "vault" {
}

data "vault_generic_secret" "terraform_discord" {
  path = "infra/techtales/terraform-discord"
}

provider "discord" {
  token = data.vault_generic_secret.terraform_discord.data["discord_token"]
}
