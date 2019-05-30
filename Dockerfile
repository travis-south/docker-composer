FROM composer:1.8.5
LABEL maintainer="irvin@capagcuan.org"
RUN composer global require hirak/prestissimo
RUN docker-php-ext-install sockets
RUN mkdir -p /tmp/cache
RUN chmod -R 777 /tmp
WORKDIR /var/www/html/app
ENV PATH="/tmp/vendor/bin:${PATH}"
ENTRYPOINT ["composer"]
CMD ["list"]
