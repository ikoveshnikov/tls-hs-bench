#!/bin/bash

CUR_DIR=`realpath $(dirname $0)`

nginx -c $CUR_DIR/nginx.conf -s quit
