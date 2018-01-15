FROM php:7-alpine

MAINTAINER dotsunited <info@dotsunited.de>

ENV DEPLOYER_VERSION=6.0.5

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add bash curl openssh-client tini rsync --no-cache

RUN curl -LO https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["dep", "--version"]
