FROM openjdk:8-jre

# Install pbzip2 for parallel extraction
RUN apt-get update \
    && apt-get -y install \
        pbzip2 \
        wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /photon
ADD https://github.com/komoot/photon/releases/download/0.4.2/photon-0.6.2.jar /photon/photon.jar
ADD https://raw.githubusercontent.com/reniko/photon-docker/refs/heads/master/entrypoint.sh ./entrypoint.sh

VOLUME /photon/photon_data
EXPOSE 2322

ENTRYPOINT /photon/entrypoint.sh
