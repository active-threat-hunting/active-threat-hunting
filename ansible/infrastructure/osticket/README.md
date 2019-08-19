### osticket ansible playbook

This playbook installs OSTicket in Docker.

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`

2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory osticket.yml`


### Post-install:

Access the web interface for OSTicket on port 9700 of the remote server.

Login with default admin user & password at [http://localhost:9700/scp](http://localhost:9700/scp):
    username: ostadmin
    password: Admin1
