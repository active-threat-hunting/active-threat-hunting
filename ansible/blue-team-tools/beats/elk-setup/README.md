These playbooks are mostly for automation purposes. It most likely would be easiest for you to SSH into a host running all of the beats and running the following commands manually (changing the elasticsearch_password, username and elasticsearch/kibana hosts) as needed), as it will be a one-time thing:

## Set up Elasticsearch:

```
filebeat setup --template -E output.logstash.enabled=false -E output.elasticsearch.username=elastic -E output.elasticsearch.password=elasticsearch_password -E output.elasticsearch.hosts=["elasticsearch_server:9200"]

auditbeat setup --template -E output.logstash.enabled=false -E output.elasticsearch.username=elastic -E output.elasticsearch.password=elasticsearch_password -E output.elasticsearch.hosts=["elasticsearch_server:9200"]

packetbeat setup --template -E output.logstash.enabled=false -E output.elasticsearch.username=elastic -E output.elasticsearch.password=elasticsearch_password -E output.elasticsearch.hosts=["elasticsearch_server:9200"]

metricbeat setup --template -E output.logstash.enabled=false -E output.elasticsearch.username=elastic -E output.elasticsearch.password=elasticsearch_password -E output.elasticsearch.hosts=["elasticsearch_server:9200"]
```

## To set up Kibana Dashboards:

```
filebeat setup --dashboards -e -E setup.kibana.username=elastic -E setup.kibana.password=elasticsearch_password -E setup.kibana.host=https://kibana_server:5601 -E setup.kibana.ssl.verification_mode=none

auditbeat setup --dashboards -e -E setup.kibana.username=elastic -E setup.kibana.password=elasticsearch_password -E setup.kibana.host=https://kibana_server:5601 -E setup.kibana.ssl.verification_mode=none

packetbeat setup --dashboards -e -E setup.kibana.username=elastic -E setup.kibana.password=elasticsearch_password -E setup.kibana.host=https://kibana_server:5601 -E setup.kibana.ssl.verification_mode=none

metricbeat setup --dashboards -e -E setup.kibana.username=elastic -E setup.kibana.password=elasticsearch_password -E setup.kibana.host=https://kibana_server:5601 -E setup.kibana.ssl.verification_mode=none
```
