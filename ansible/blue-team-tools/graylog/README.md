### graylog-install ansible playbook

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.

For `graylog_password_secret` run the following command to generate a secure pepper for your passwords: `pwgen -s 96 1`

For `graylog_root_password_sha2` run the following command to get the SHA256 Sum of your desired Graylog password: `echo -n "Enter Password: " && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1`




3. Run the playbook:

`ansible-playbook -i inventory graylog.yml`



### Post-install:

Access the web interface for Graylog on port 9000 of the remote server.

After the install, it would be recommended to use firewall rules to restrict access to your Graylog instance. It would also be recommended to set up an SSL certificate for the application.
