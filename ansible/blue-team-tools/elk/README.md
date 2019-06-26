### elk-install ansible playbook

The ELK Stack is a stack of software (Elasticsearch, Logstash and Kibana) produced by the company [Elastic](https://www.elastic.co/) for aggregating logs.

This playbook installs each part of the Stack in Docker containers and links them.

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.


3. Run the playbook:

`ansible-playbook -i inventory elk.yml`



### Post-install:

Access the web interface for Kibana on the HTTP port of the remote server that was specified in the inventory file.

After the install, it would be recommended to use firewall rules to restrict access to your ELK instance.
