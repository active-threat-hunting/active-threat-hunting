### guacamole ansible playbook

This playbook installs Guacamole in Docker using a self-signed SSL certificate

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`

2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory guacamole.yml`


### Post-install:

Access the web interface for Guacamole on port 8006 of the remote server.

