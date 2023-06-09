#the image used for the conatainer
FROM alpine:3.16

#Arguments
ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS

# dependencies needed
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    wget \
	curl \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && mkdir -p /var/www && \
    rm -f /var/cache/apk/*

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#   && chmod +x wp-cli.phar && php wp-cli.phar --info \
#   && cp wp-cli.phar /usr/local/bin/wp


# to create an environment variable.
# We can access ENV values during the build, as well as once the container runs.
# ENV

# Copy the <file> file from <location> to the mentione location
COPY ./requirements/wordpress/conf/wp_config_create.sh .
COPY ./requirements/wordpress/conf/setup.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/setup.sh
RUN sh wp_config_create.sh && rm wp_config_create.sh && \
    chmod -R 0777 wp-content/

EXPOSE 9000
# command that is executed on 'docker container run'
# ENTRYPOINT ["/usr/local/bin/setup.sh"]
# CMD ["/usr/local/bin/setup.sh"]
CMD ["/usr/sbin/php-fpm8", "-F"]

#to confugure executables that will always run after the container is initiated/launched
# ENTRYPOINT

# Exposing a container port (access from outside)
# telling Docker that the container listens to a certain port
# EXPOSE <port>
