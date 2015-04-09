FROM debian:jessie
RUN export http_proxy=http://gateway.ad.renci.org:8080 && export https_proxy=http://gateway.ad.renci.org:8080 && \
 apt-get update && apt-get install -y wget ca-certificates openjdk-7-jre
RUN export http_proxy=http://gateway.ad.renci.org:8080 && export https_proxy=http://gateway.ad.renci.org:8080 && \
 wget https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz -O /tmp/kibana.tar.gz && \
    cd /tmp && tar zxf kibana.tar.gz && mv kibana-* /opt/kibana && \
    rm -rf /tmp/*
COPY kibana.yml /opt/kibana/config/kibana.yml
EXPOSE 5601
CMD ["/opt/kibana/bin/kibana"]
