### redcloud ansible playbook

This playbook installs [ctfd](https://github.com/CTFd/CTFd/).

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.


3. Run the playbook:

`ansible-playbook -i inventory ctfd.yml`


### Post-install:

Access the web interface for `ctfd` on port 8000 of the remote server.
