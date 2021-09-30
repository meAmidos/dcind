# Inspired by https://github.com/mumoshu/dcind
FROM python:3-alpine
LABEL maintainer="Dmitry Matrosov <amidos@amidos.me>"

ENV DOCKER_VERSION=20.10.8 \
    DOCKER_COMPOSE_VERSION=1.29.2

# Install Docker and Docker Compose
RUN apk --no-cache add bash curl util-linux device-mapper py3-pip python3-dev libffi-dev openssl-dev gcc libc-dev make iptables && \
    curl https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar zx && \
    mv /docker/* /bin/ && \
    chmod +x /bin/docker* && \
    pip3 install docker-compose==${DOCKER_COMPOSE_VERSION} && \
    rm -rf /root/.cache

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
