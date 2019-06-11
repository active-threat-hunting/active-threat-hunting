### https-reverse-proxy ansible playbook

This playbook runs an nginx reverse proxy in Docker using a self-signed SSL certificate


### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.

Config changes of note:
`ssl_port` should reflect the same SSL port that is exposed in `./files/nginx.conf`

3. Edit the Nginx config in `./files/nginx.conf` as needed.

*Note: It would be recommended to only change the configuration under the `server` directive in the config. Also, the playbook creates a self-signed SSL certificate and key and mounts them at /tmp/server. Don't change the values for the paths to the keys unless you modify the actual Ansible playbook.*

4. Run the playbook:

`ansible-playbook -i inventory proxy.yml`


### Additional information:

The playbook creates a self-signed SSL cert and key in /opt in a directory using the same name as the value set for `container_name`. So if the `container_name` is `nginx-docker` the self-signed SSL cert and key would be in `/opt/nginx-docker`. You can replace the cert as needed with a valid certificate on the remote server and then re-run the playbook to re-initialize the Nginx docker container using the new SSL cert.

