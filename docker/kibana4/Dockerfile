FROM debian:jessie
ENV http_proxy http://gateway.ad.renci.org:8080
ENV https_proxy http://gateway.ad.renci.org:8080
RUN apt-get update && apt-get install -y wget ca-certificates openjdk-7-jre
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz -O /tmp/kibana.tar.gz && \
    cd /tmp && tar zxf kibana.tar.gz && mv kibana-* /opt/kibana && \
    rm -rf /tmp/*
COPY kibana.yml /opt/kibana/config/kibana.yml
EXPOSE 5601
ENTRYPOINT ["/opt/kibana/bin/kibana"]
CMD []
