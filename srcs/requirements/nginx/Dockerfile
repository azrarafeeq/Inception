# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arafeeq <arafeeq@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/02 05:03:42 by arafeeq           #+#    #+#              #
#    Updated: 2023/07/02 09:29:18 by arafeeq          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#the image used for the conatainer
FROM alpine:3.16

# dependencies needed
RUN apk update && apk upgrade && apk add --no-cache nginx

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/nginx.conf

RUN apk update && apk add --no-cache wget curl openssl

WORKDIR /etc/nginx/ssl
RUN curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest \
    | grep browser_download_url \
    | grep linux-amd64 \
    | cut -d '"' -f 4 \
    | wget -qi - \
    && mv mkcert-v*-linux-amd64 mkcert \
    && chmod a+x mkcert
# Generate SSL certificates using mkcert
RUN ./mkcert arafeeq.42.fr \
    && mv arafeeq.42.fr-key.pem arafeeq.42.fr.key \
    && mv arafeeq.42.fr.pem arafeeq.42.fr.crt \
    && rm mkcert
# Change back to the previous working directory
WORKDIR /

# Set file permissions to readable for all
RUN chmod 644 /etc/nginx/http.d/nginx.conf

# Set ownership to the Nginx user and group
RUN chown -R nginx:nginx /etc/nginx/http.d

# Set file permissions for SSL keys
RUN chmod 600 /etc/nginx/ssl/arafeeq.42.fr.crt
RUN chmod 600 /etc/nginx/ssl/arafeeq.42.fr.key

# Set ownership to the Nginx user and group
RUN chown -R nginx:nginx /etc/nginx/http.d /etc/nginx/ssl

# Exposing a container port
# telling Docker that the container listens to a certain port
EXPOSE 443

# command that is executed on 'docker container run'
CMD ["nginx", "-g", "daemon off;"]


# set our wrkdir. The following instructions will be executed in this location.
# WRKDIR <location>

# Copy the <file> file from <location> to WRKDIR location
# COPY <file> <location>


# to create an environment variable.
# We can access ENV values during the build, as well as once the container runs.
# ENV

#to confugure executables that will always run after the container is initiated/launched
# ENTRYPOINT
