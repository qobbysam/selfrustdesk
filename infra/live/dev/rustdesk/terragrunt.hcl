terraform {
  source = "../../../modules/rustdesk"
}

inputs = {
  name        = "rustdesk-dev"
  region      = "nyc1"
  size        = "s-1vcpu-1gb"
  image       = "ubuntu-24-04-x64"
  docker_image = "rustdesk/rustdesk-server:latest"
  relay_port  = 21115
  tags        = ["env:dev"]
}

# NOTE: Provide DIGITALOCEAN_TOKEN via environment or configure provider in a parent terragrunt config.
