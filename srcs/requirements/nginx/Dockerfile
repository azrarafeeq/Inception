# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arafeeq <arafeeq@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/02 05:03:42 by arafeeq           #+#    #+#              #
#    Updated: 2023/06/03 05:32:42 by arafeeq          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#the image used for the conatainer
FROM alpine:3.16

# dependencies needed
RUN apk update && apk upgrade && apk add --no-cache nginx

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
