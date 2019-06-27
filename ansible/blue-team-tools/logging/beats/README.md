### beats installation ansible playbook

The ELK Stack is a stack of software (Elasticsearch, Logstash and Kibana) produced by the company [Elastic](https://www.elastic.co/) for aggregating logs.

These playbooks install the various Elastic Beats for shipping logs to ELK Stack *_in Docker_* (for easier cross-platform compatibility). ELK Stack should already be up and running before running these playbooks.

### Installation:

1. Install the Ansible roles that are dependencies for the playbook to run:

`ansible-galaxy install -r requirements.yml`


2. Edit the variables in `inventory` to reflect the values appropriate for your install.


3. Run the playbook:

`ansible-playbook -i inventory all-beats.yml`

If installing all of the Beats is not optimal, substitute the `all-beats.yml` playbook for your respective Beat that you'd like to install (I.E. `filebeat.yml`).



### Post-install:

Once the beats are running, it would be recommended to [set up the Indices in Elasticsearch and Dashboards in Kibana](https://github.com/heywoodlh/active-threat-hunting/tree/master/ansible/blue-team-tools/logging/beats/elk-setup). 
