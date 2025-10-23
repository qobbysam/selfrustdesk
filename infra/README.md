RustDesk Terraform/Terragrunt
=============================

This folder provides a minimal Terraform module and Terragrunt live config to deploy a low-cost RustDesk server on DigitalOcean.

Prerequisites
 - DigitalOcean account and a personal access token (export as DIGITALOCEAN_TOKEN)
 - terragrunt installed (v0.45+ recommended)
 - optional: add your SSH key to DigitalOcean and set its ID in the `ssh_keys` input or pass a public key

Quick start (development)

1. Export your DO token:

```
export DIGITALOCEAN_TOKEN=your_token_here
```

2. cd into the live environment and apply:

```
cd infra/live/dev/rustdesk
terragrunt init
terragrunt apply
```

Notes
- The module uses cloud-init to install Docker and run RustDesk `hbbs` and `hbbr` containers. It generates a random password and exposes it as a sensitive output.
- For production use: use a larger droplet, set up backups, set up remote state (S3/backends), and secure the server with a firewall.
