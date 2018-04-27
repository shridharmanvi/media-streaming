# Docker file reference: https://github.com/Kurento/kurento-docker/blob/master/kurento-media-server/Dockerfile.trusty.2018

FROM ubuntu:14.04
MAINTAINER manvishri <shridharmanvi@gmail.com>

# Update and upgrade
RUN apt-get update -y && apt-get -y dist-upgrade

RUN echo "deb http://ubuntu.kurento.org trusty kms6" | tee /etc/apt/sources.list.d/kurento.list 
RUN apt-get install -y wget curl 
RUN wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - 
RUN apt-get update 
RUN apt-get clean
RUN apt-get install -y kurento-media-server-6.0

RUN service kurento-media-server-6.0 start

# Expose port
EXPOSE 8888

COPY ./entrypoint.sh /entrypoint.sh
COPY ./healthchecker.sh /healthchecker.sh

RUN chmod +x /entrypoint.sh && chmod +x healthchecker.sh

HEALTHCHECK --interval=5m --timeout=3s --retries=1 CMD /healthchecker.sh

ENV GST_DEBUG=Kurento*:5

ENTRYPOINT ["/entrypoint.sh"]

