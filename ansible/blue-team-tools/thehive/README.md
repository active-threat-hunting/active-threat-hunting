### thehive ansible playbook

This playbook runs thehive in Docker

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory thehive.yml`


### Post-Install:

Access the web interface for Cortex on port 9001 of the remote server.

Access the web interface for the hive on port 10000 of the remote server.
