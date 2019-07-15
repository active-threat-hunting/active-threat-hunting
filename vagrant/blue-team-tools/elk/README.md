### elk vagrant script

This `Vagrantfile` and related scripts will setup a dev ELK Stack instance using Vagrant+Virtualbox.


### Installation:

1. `cd` into the same directory as the `Vagrantfile`

2. Edit the `ELK_VERSION` variable in `setup.sh` to reflect whatever is the most recent version Elasticsearch, Logstash and Kibana are on.

3. Deploy the Vagrant VM: `vagrant up`


_Once the VM is no longer needed, destroy the VM with the following command (assuming you are still in the same directory as the `Vagrantfile`): `vagrant destroy`_



### Post-Installation:

The following URI's will be available after the installation:

[http://10.10.5.5:5601](http://10.10.5.5:5601) -- Kibana
10.10.5.5:9200 -- Elasticsearch API
10.10.5.5:9300 -- Elasticsearch

10.10.5.5:5044 -- Logstash beats input
10.10.5.5:1514 -- Logstash syslog input
10.10.5.5:9995 -- Logstash netflow input
