### passbolt ansible playbook

This playbook installs passbolt in Docker.

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`

2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory passbolt.yml`


### Post-install:

Access the web interface for Passbolt on port 9800 (HTTPS) of the remote server.

