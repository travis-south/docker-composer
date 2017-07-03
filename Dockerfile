FROM composer:1.4.2
MAINTAINER Irvin Capagcuan <irvin@capagcuan.org>
ENV GOSU_VERSION 1.10
RUN set -ex; \
    \
    apk add --no-cache --virtual .gosu-deps \
        dpkg \
        gnupg \
        openssl \
    ; \
    \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
    \
# verify the signature
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc; \
    \
    chmod +x /usr/local/bin/gosu; \
# verify that the binary works
    gosu nobody true; \
    \
    apk del .gosu-deps
RUN docker-php-ext-install sockets
RUN mkdir -p /composer/cache
RUN chmod -R 777 /composer
RUN mkdir -p /root/.ssh
COPY composer.sh /composer.sh
RUN chmod 777 /composer.sh
VOLUME ["/app"]
WORKDIR /app
ENTRYPOINT ["/composer.sh"]
