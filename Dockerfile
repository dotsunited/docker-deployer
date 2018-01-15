FROM php:7-alpine

MAINTAINER dotsunited <info@dotsunited.de>

ENV DEPLOYER_VERSION=6.0.5

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add bash curl openssh-client tini rsync --no-cache

RUN curl -LO https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

COPY deployer-ssh-setup.sh /usr/local/bin/deployer-ssh-setup
RUN chmod +x /usr/local/bin/deployer-ssh-setup

ENTRYPOINT ["tini", "--"]

CMD ["dep", "--version"]
