#!/bin/bash
if [ ! -d "$PWD/srcs/data" ]; then
        mkdir $PWD/srcs/data
        mkdir $PWD/srcs/data/mariadb
        mkdir $PWD/srcs/data/wordpress
fi