FROM debian:jessie
ENV http_proxy https://gateway.ad.renci.org:8080
ENV https_proxy https://gateway.ad.renci.org:8080
ENV ES_HEAP_SIZE 4g
RUN apt-get update && \
    apt-get install -y openjdk-7-jre wget
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN (cd /tmp && \
    wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.0.tar.gz -O pkg.tar.gz && \
    tar zxf pkg.tar.gz && mv elasticsearch-* /opt/elasticsearch &&\
    rm -rf /tmp/*)
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
EXPOSE 9200
EXPOSE 9300
VOLUME /opt/elasticsearch/data
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
CMD []
