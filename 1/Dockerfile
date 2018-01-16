FROM php:7-alpine

MAINTAINER dotsunited <info@dotsunited.de>

ENV DEPLOYER_VERSION=6.0.5

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add bash curl git openssh-client rsync tini --no-cache

COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

RUN curl -LO https://deployer.org/releases/v$DEPLOYER_VERSION/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

COPY deployer-ssh-setup.sh /usr/local/bin/deployer-ssh-setup
RUN chmod +x /usr/local/bin/deployer-ssh-setup

COPY deployer-ssh-start.sh /usr/local/bin/deployer-ssh-start
RUN chmod +x /usr/local/bin/deployer-ssh-start

ENTRYPOINT ["tini", "--", "deployer-ssh-start"]

CMD ["dep", "--version"]
