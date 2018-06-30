#!/bin/bash

scp nginx.conf %DUT_SSH%:/tmp
ssh %DUT_SSH% 'nginx -c /tmp/nginx.conf -s quit'
