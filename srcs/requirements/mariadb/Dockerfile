# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arafeeq <arafeeq@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/02 05:03:42 by arafeeq           #+#    #+#              #
#    Updated: 2023/06/05 03:57:39 by arafeeq          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#the image used for the conatainer
FROM alpine:3.16

# set our wrkdir. The following instructions will be executed in this location.
# WRKDIR <location>

#Arguments (stored in .env)
ARG DB_NAME \
    DB_USER \
    DB_PASS

# dependencies needed
RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Exposing a container port
# telling Docker that the container listens to a certain port
EXPOSE 3306

# Copy the <file> file from its location to <location>
COPY requirements/mariadb/conf/create_db.sh .

RUN sh create_db.sh && rm create_db.sh

USER mysql

# to create an environment variable.
# We can access ENV values during the build, as well as once the container runs.
# ENV

# command that is executed on 'docker container run'
# i.e the command to run the application
CMD ["/usr/bin/mysqld", "--skip-log-error"]

#to confugure executables that will always run after the container is initiated/launched
ENTRYPOINT ["sh", "db.sh"]
