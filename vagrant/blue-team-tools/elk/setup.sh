ELK_VERSION='7.2.0'

apt-get update
apt-get dist-upgrade -y

apt-get install curl python3-pip docker.io -y
pip3 install docker
adduser --system --no-create-home --group --uid 1050 docker-elk
systemctl enable --now docker.service

docker pull elasticsearch:"$ELK_VERSION"
docker volume create elk_elasticsearch_data
sysctl -w vm.max_map_count=262144
docker run -d --name=elk_elasticsearch --restart=unless-stopped -p 9200:9200 -p 9300:9300 -v elk_elasticsearch_data:/usr/share/elasticsearch/data -e 'http.host=0.0.0.0' -e 'transport.host=0.0.0.0' -e 'xpack.security.enabled=false' -e 'cluster.name=elk' -e 'discovery.type=single-node' elasticsearch:"$ELK_VERSION"

docker pull kibana:"$ELK_VERSION"
docker run -d --name=elk_kibana --user=1050 --restart=unless-stopped -p 5601:5601 --link elk_elasticsearch:elasticsearch -e 'SERVER_NAME=localhost' -e 'ELASTICSEARCH_HOSTS=http://elasticsearch:9200' kibana:"$ELK_VERSION"

docker pull logstash:"$ELK_VERSION"
chmod 700 /opt/elk-docker
docker run -d --name=elk_logstash --user=1050 --restart=unless-stopped --link elk_elasticsearch:elasticsearch -p 5044:5044 -p 9995:9995 -p 1514:1514 -v /opt/elk-docker/logstash/conf:/usr/share/logstash/pipeline logstash:"$ELK_VERSION"
