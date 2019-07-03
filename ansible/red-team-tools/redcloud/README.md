### redcloud ansible playbook

This playbook installs [Redcloud](https://github.com/khast3x/Redcloud).

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.


3. Run the playbook:

`ansible-playbook -i inventory redcloud.yml`


### Post-install:

Access the web interface for Redcloud on port 443 of the remote server. Portainer is available at /portainer of the server URI (i.e. https://192.168.1.5/portainer).
