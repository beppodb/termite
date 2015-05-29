docker build -t termite/elasticsearch ./elasticsearch
docker build -t termite/kibana4 ./kibana4
docker build -t termite/logstash ./logstash

docker kill elasticsearch ; docker rm elasticsearch
docker kill kibana4 ; docker rm kibana4
docker kill logstash ; docker rm logstash

docker run --name elasticsearch -d -p 9200:9200 -p 9300:9300 \
  -v /opt/elasticsearch/data:/opt/elasticsearch/data \
  --name elasticsearch termite/elasticsearch
docker run --name logstash --link elasticsearch:elasticsearch \
  -d -p 1514:1514 -v /ftp_logs:/opt/logs -v /opt/sincedb:/opt/sincedb \
  termite/logstash -f /etc/ls-ftplogs.conf

for i in {001..240};do echo -n .;sleep 1;done
echo starting kibana

docker run --name kibana4 --link elasticsearch:elasticsearch \
 -d -p 5601:5601 termite/kibana4

