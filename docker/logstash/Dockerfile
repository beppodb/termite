FROM debian:jessie
ENV http_proxy http://gateway.ad.renci.org:8080
ENV https_proxy http://gateway.ad.renci.org:8080
RUN apt-get update && \
    apt-get install -y wget
RUN wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.2-1-2c0f5a1_all.deb -O /tmp/logstash.deb && \
    wget https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash-contrib_1.4.2-1-efd53ef_all.deb -O /tmp/logstash-contrib.deb && \
    dpkg -i /tmp/logstash.deb ; \
    dpkg -i /tmp/logstash-contrib.deb ; \
    apt-get -f -y install && \
    rm -rf /tmp/logstash.deb /tmp/logstash-contrib.deb
# kibana4 requires elasticsearch 1.4.0 or greater (https://github.com/elasticsearch/kibana/issues/1629)
RUN rm -rf /opt/logstash/vendor/jar/elasticsearch-* 
RUN (cd /tmp && \
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.tar.gz -O pkg.tar.gz && \
    tar zxf pkg.tar.gz && mv elasticsearch-* /opt/logstash/vendor/jar/ &&\
    rm -rf /tmp/*)
COPY ls-ftplogs.conf /etc/ls-ftplogs.conf
EXPOSE 1514
ENTRYPOINT ["/opt/logstash/bin/logstash"]
CMD []
