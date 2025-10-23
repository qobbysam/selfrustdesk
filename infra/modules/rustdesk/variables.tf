variable "name" {
  description = "Droplet name"
  type        = string
  default     = "rustdesk-server"
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc1"
}

variable "image" {
  description = "Droplet image"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "size" {
  description = "Droplet size (smallest to save cost)"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "ssh_keys" {
  description = "List of SSH key IDs or fingerprints registered in DO account"
  type        = list(string)
  default     = []
}

variable "ssh_public_key" {
  description = "Optional public key content for cloud-init authorized_keys"
  type        = string
  default     = ""
}

variable "docker_image" {
  description = "RustDesk docker image or tag to deploy"
  type        = string
  default     = "rustdesk/rustdesk-server:latest"
}

variable "relay_port" {
  description = "Relay port for RustDesk (TCP)"
  type        = number
  default     = 21115
}

variable "stun" {
  description = "Optional STUN server (e.g., stun:stun.l.google.com:19302)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags for droplet"
  type        = list(string)
  default     = []
}
