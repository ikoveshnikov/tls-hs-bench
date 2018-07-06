#!/bin/bash

scp nginx.conf tempesta_fw.conf %KEY%/tfw-root.crt %KEY%/tfw-root.key %DUT_SSH%:/tmp
scp 0 %DUT_SSH%:/var/www/html/

ssh %DUT_SSH% 'sysctl -w net.ipv4.tcp_tw_reuse=1; \
               sysctl -w net.core.netdev_max_backlog=10000; \
               sysctl -w net.core.somaxconn=131072; \
               sysctl -w net.ipv4.tcp_fin_timeout=10;'

ssh %DUT_SSH% 'nginx -c /tmp/nginx.conf'
