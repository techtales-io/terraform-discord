provider "discord" {
  token = var.discord_token
}

provider "vault" {
  skip_child_token = true
}
