output "ipv4_address" {
  value = digitalocean_droplet.rustdesk.ipv4_address
}

output "droplet_name" {
  value = digitalocean_droplet.rustdesk.name
}
