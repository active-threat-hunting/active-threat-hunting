#!/usr/bin/env bash
ELK_VERSION='7.2.0'

echo "Provisioning virtual machine..."
apt-get update
apt-get dist-upgrade -y

echo "Installing dependencies..."
apt-get install curl python3-pip docker.io -y
pip3 install docker
sed -i 's/127.0.0.53/8.8.8.8/g' /etc/resolv.conf
adduser --system --no-create-home --group --uid 1050 docker-elk
systemctl enable --now docker.service

echo "Installing Elasticsearch..."
docker pull elasticsearch:"$ELK_VERSION"
docker volume create elk_elasticsearch_data
sysctl -w vm.max_map_count=262144
docker run -d --name=elk_elasticsearch --restart=unless-stopped -p 9200:9200 -p 9300:9300 -v elk_elasticsearch_data:/usr/share/elasticsearch/data -e 'http.host=0.0.0.0' -e 'transport.host=0.0.0.0' -e 'xpack.security.enabled=false' -e 'cluster.name=elk' -e 'discovery.type=single-node' elasticsearch:"$ELK_VERSION"

echo "Installing Kibana..."
docker pull kibana:"$ELK_VERSION"
docker run -d --name=elk_kibana --user=1050 --restart=unless-stopped -p 5601:5601 --link elk_elasticsearch:elasticsearch -e 'SERVER_NAME=localhost' -e 'ELASTICSEARCH_HOSTS=http://elasticsearch:9200' kibana:"$ELK_VERSION"

echo "Installing Logstash..."
docker pull logstash:"$ELK_VERSION"
mkdir -p /opt/elk-docker/logstash
chmod 700 /opt/elk-docker
mv /tmp/logstash/conf /opt/elk-docker/logstash
docker run -d --name=elk_logstash --user=1050 --restart=unless-stopped --link elk_elasticsearch:elasticsearch -p 5044:5044 -p 9995:9995 -p 1514:1514 -v /opt/elk-docker/logstash/conf:/usr/share/logstash/pipeline logstash:"$ELK_VERSION"
