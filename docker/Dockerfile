FROM ubuntu:bionic

MAINTAINER Anthony K GROSS

WORKDIR /src

ENV MINECRAFT_VERSION='latest'

RUN apt-get update -y && \
    apt-get install -y git openjdk-8-jre-headless curl

ADD docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./src /src

EXPOSE 25565

ENTRYPOINT ["/entrypoint.sh"]
CMD ["run"]

