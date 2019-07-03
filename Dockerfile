# Inspired by https://github.com/mumoshu/dcind
FROM alpine:3.10
MAINTAINER Dmitry Matrosov <amidos@amidos.me>

ENV DOCKER_VERSION=18.09.7 \
    DOCKER_COMPOSE_VERSION=1.23.2

# Install Docker and Docker Compose
RUN apk --update add curl util-linux device-mapper py-pip iptables \
&& curl https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar zx \
&& mv /docker/* /bin/ \
&& chmod +x /bin/docker* \
&& pip install docker-compose==${DOCKER_COMPOSE_VERSION}

# Include useful functions to start/stop docker daemon in garden-runc containers in Concourse CI.
# Example: source /docker-lib.sh && start_docker
COPY docker-lib.sh /docker-lib.sh

