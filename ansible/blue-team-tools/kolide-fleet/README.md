### kolide-fleet ansible playbook

This playbook runs kolide-fleet in Docker using a self-signed SSL certificate

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Run the playbook:

`ansible-playbook -i inventory fleet.yml`


### Post-install:

Access the web interface for Kolide Fleet on port 8080 of the remote server.

### Additional information:

You can replace the cert in `/opt/fleet-docker/` on the remote server as needed with a valid certificate on the remote server and then re-run the playbook to re-initialize the Nginx docker container using the new SSL cert.
