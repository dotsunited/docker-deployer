FROM php:7-alpine

MAINTAINER Dots United GmbH <info@dotsunited.de>

ENV PATH="~/.composer/vendor/bin:${PATH}"
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HTACCESS_PROTECT 0

ENV DEPLOYER_VERSION=6.3.0
ENV DEPLOYER_RECIPES_VERSION=6.1.6
ENV REACTPHP_EVENT_LOOP_VERSION=1.0.0
ENV REACTPHP_PROMISE_VERSION=2.7.0
ENV BUZZ_VERSION=2.5.0
ENV BLOCK_VERSION=1.3.0

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add bash curl git openssh-client openssl rsync tini zlib-dev --no-cache

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini"
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

RUN docker-php-ext-install zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir -p ~/.composer /deployer

COPY ssh_config /ssh_config
RUN cat /ssh_config >> /etc/ssh/ssh_config
RUN rm -f /ssh_config

# Run self-update in case we have copied an outdated version earlier
RUN composer self-update

RUN composer global require --prefer-dist --no-interaction hirak/prestissimo
RUN composer global require --prefer-dist --no-interaction deployer/deployer:"$DEPLOYER_VERSION"
RUN composer global require --prefer-dist --no-interaction deployer/recipes:"$DEPLOYER_RECIPES_VERSION"
RUN composer global require --prefer-dist --no-interaction react/event-loop:"$REACTPHP_EVENT_LOOP_VERSION"
RUN composer global require --prefer-dist --no-interaction react/promise:"$REACTPHP_PROMISE_VERSION"
RUN composer global require --prefer-dist --no-interaction clue/buzz-react:"$BUZZ_VERSION"
RUN composer global require --prefer-dist --no-interaction clue/block-react:"$BLOCK_VERSION"

RUN rm -rf ~/.composer/cache/*

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

WORKDIR /deployer

ENTRYPOINT ["/sbin/tini", "--", "docker-entrypoint"]

CMD ["dep", "--version"]
