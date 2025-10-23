#cloud-config
package_update: true
package_upgrade: true
packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg
  - lsb-release

write_files:
  - path: /etc/motd
    content: |
      RustDesk server provisioned by Terraform
  - path: /root/.ssh/authorized_keys
    content: |
%{ if public_key != "" }
${public_key}
%{ else }
# no public key provided
%{ endif }

runcmd:
  - [ bash, -lc, "curl -fsSL https://get.docker.com | sh" ]
  - [ bash, -lc, "systemctl enable --now docker" ]
  - [ bash, -lc, "docker network create rustdesk-net || true" ]
  - [ bash, -lc, "docker run -d --name hbbs --restart unless-stopped -p 21115:21115 -p 21116:21116 -e PASSWORD=${server_password} --network rustdesk-net ${docker_image} hbbs -r 21115" ]
  - [ bash, -lc, "docker run -d --name hbbr --restart unless-stopped --network rustdesk-net -e PASSWORD=${server_password} ${docker_image} hbbr" ]

final_message: "The RustDesk server is ready."
