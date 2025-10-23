terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.25"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "digitalocean" {
  # token should come from Terragrunt/parent provider block or env var DIGITALOCEAN_TOKEN
}

resource "random_password" "root_password" {
  length           = 16
  override_characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
}

resource "digitalocean_droplet" "rustdesk" {
  name   = var.name
  region = var.region
  image  = var.image
  size   = var.size

  ipv6 = false

  ssh_keys = var.ssh_keys

  user_data = templatefile("${path.module}/cloud-init.tpl", {
    server_password = random_password.root_password.result
    public_key      = var.ssh_public_key
    relay_port      = var.relay_port
    stun           = var.stun
    docker_image    = var.docker_image
  })

  tags = concat(var.tags, ["rustdesk"])
}

output "droplet_id" {
  value = digitalocean_droplet.rustdesk.id
}

output "ipv4_address" {
  value = digitalocean_droplet.rustdesk.ipv4_address
}

output "root_password" {
  value       = random_password.root_password.result
  description = "Random password generated for services (if used by cloud-init)."
  sensitive   = true
}
