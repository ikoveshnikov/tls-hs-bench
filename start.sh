#!/bin/bash

scp nginx.conf tempesta_fw.conf tfw-root.crt tfw-root.key %DUT_SSH%:/tmp
ssh %DUT_SSH% 'nginx -c /tmp/nginx.conf'
