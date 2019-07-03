### elastalert ansible playbook

This playbook installs Elastalert using [Bitsensor's Image](https://github.com/bitsensor/elastalert).

This would be recommended to install on the same host running the Elastic Stack.

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.

3. Edit the configuration files in `files/elastalert/` to reflect the desired configuration. See [https://github.com/bitsensor/elastalert#configuration](https://github.com/bitsensor/elastalert#configuration) for additional information on the configuration values.

*The default configuration uses localhost:9200 as ElasticSearch host, if this is not the case in your setup please edit es_host and es_port in both the elastalert.yaml and config.json configuration files.*

4. Run the playbook:

`ansible-playbook -i inventory elastalert.yml`
