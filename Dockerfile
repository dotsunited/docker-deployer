FROM php:7-alpine

MAINTAINER dotsunited <info@dotsunited.de>

ENV DEPLOYER_VERSION=6.0.5
ENV DEPLOYER_USER=deployer-user

RUN apk update --no-cache && \
    apk add bash curl openssh-client tini --no-cache

RUN curl -LO https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

USER $DEPLOYER_USER

ENTRYPOINT ["tini", "--", "docker-entrypoint"]

