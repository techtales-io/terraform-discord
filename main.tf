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
  backend "s3" {
    bucket                      = "terraform"
    key                         = "techtales/discord/terraform.tfstate"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}

module "techtales" {
  source        = "./techtales"
  discord_token = data.vault_generic_secret.terraform_discord.data["discord_token"]
}
