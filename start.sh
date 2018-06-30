#!/bin/bash

scp nginx.conf tempesta_fw.conf tfw-root.crt tfw-root.key %DUT_SSH%:/tmp
scp 0 %DUT_SSH%:/var/www/html/
ssh %DUT_SSH% 'nginx -c /tmp/nginx.conf'