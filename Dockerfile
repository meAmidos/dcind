# Inspired by https://github.com/mumoshu/dcind
FROM alpine:3.18
LABEL maintainer="Dmitry Matrosov <amidos@amidos.me>"

# Install Docker (23.0.6) and Docker Compose (v2.17.3) and other utilities
# https://pkgs.alpinelinux.org/package/v3.18/community/x86_64/docker
# https://pkgs.alpinelinux.org/package/v3.18/community/x86_64/docker-cli-compose
RUN apk --no-cache add bash curl util-linux device-mapper libffi-dev openssl-dev gcc libc-dev make iptables docker docker-cli-compose

# Include functions to start/stop docker daemon
COPY docker-lib.sh /docker-lib.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
