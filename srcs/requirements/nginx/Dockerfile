# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arafeeq <arafeeq@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/02 05:03:42 by arafeeq           #+#    #+#              #
#    Updated: 2023/07/03 11:10:53 by arafeeq          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#the image used for the conatainer
FROM alpine:3.16

# dependencies needed
RUN apk update && apk upgrade && apk add --no-cache nginx openssl

COPY /requirements/nginx/conf/nginx.conf /etc/nginx/http.d/


# WORKDIR /etc/nginx/ssl

RUN mkdir -p /etc/nginx/ssl/; rm -rf /etc/nginx/http.d/default.conf
	
COPY ${CERT_} /etc/nginx/http.d/
COPY ${KEY_} /etc/nginx/http.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

