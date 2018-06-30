#!/bin/bash

ssh %DUT_SSH% 'mkdir -p tls_perf; cd tls_perf; perf record --call-graph dwarf sleep 5'
