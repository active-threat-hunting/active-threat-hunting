### proxmox ansible playbook

This playbook installs Proxmox on Debian Buster using a self-signed SSL certificate

### Installation:

1. Edit the variables in `inventory` to reflect the values appropriate for your install.

2. Run the playbook:

`ansible-playbook -i inventory proxmox.yml`


### Post-install:

Access the web interface for Proxmox on port 8006 of the remote server.

