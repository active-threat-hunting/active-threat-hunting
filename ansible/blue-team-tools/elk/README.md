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

After the install, it would be recommended to use firewall rules to restrict access to your ELK instance. The exposed ports are (if left default in the inventory file):

9200 -- Elasticsearch REST API port
9300 -- Elasticsearch node communication port (for clustering)
5601 -- Kibana web interface
1514 -- Logstash syslog input
5044 -- Logstash beats input
9995 -- Logstash netflow port

It is highly recommended to restrict Elasticsearch to only be accessible from other Elasticsearch nodes and from localhost. Kibana should also be configured to use a password for logging in ([see here for an example](https://www.hugeserver.com/kb/how-secure-kibana-nginx-centos/)) and HTTPS instead of HTTP.
