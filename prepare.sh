#!/bin/bash

CUR_DIR=`realpath $(dirname $0)`

cp tfw-root.crt  tfw-root.key /tmp
cp 0 /var/www/html/

nginx -c $CUR_DIR/nginx.conf
