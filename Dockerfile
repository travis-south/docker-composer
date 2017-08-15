FROM composer:1.5
MAINTAINER Irvin Capagcuan <irvin@capagcuan.org>
RUN composer global require hirak/prestissimo
RUN mkdir -p /tmp/cache
RUN chmod -R 777 /tmp
COPY composer.sh /composer.sh
RUN chmod 777 /composer.sh
VOLUME ["/var/www/html/app"]
WORKDIR /var/www/html/app
ENTRYPOINT ["/composer.sh"]
