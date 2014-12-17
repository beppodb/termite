docker build -t termite/elasticsearch ./elasticsearch
docker build -t termite/kibana ./kibana
docker build -t termite/logstash ./logstash

docker kill elasticsearch ; docker rm elasticsearch
docker kill kibana ; docker rm kibana
docker kill logstash ; docker rm logstash

docker run --name elasticsearch -d -p 9200:9200 -p 9300:9300 \
  -v /opt/elasticsearch/data:/opt/elasticsearch/data \
  --name elasticsearch termite/elasticsearch
docker run --name kibana -d -p 80:80 termite/kibana
docker run --name logstash --link elasticsearch:elasticsearch \
  -d -p 1514:1514 -v /ftp_logs:/opt/logs \
  termite/logstash -f /etc/ls-ftplogs.conf

