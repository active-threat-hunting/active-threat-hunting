### Sn1per ansible playbook

This playbook installs [Sn1per](https://github.com/1N3/Sn1per).

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.


3. Run the playbook:

`ansible-playbook -i inventory sniper.yml`


