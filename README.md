1. Set up. Place this repo and https://github.com/ikoveshnikov/thc-tls-dos in the same directory:
```
user@debian:~/tls-test$ ls
thc-tls-dos  tls-hs-bench
```
2. Build `thc-tls-dos`:
```
cd thc-tls-dos
./configure
make all
```
3. Make configuration file. like `ik-vm.cfg` or `tempesta-server.cfg`. and run
`prepare.sh <CONFIG>` if some variables are missed, `prepare.sh` will print
a warning. definition of variables are described in `prepare.sh`

4. traffic generation server uses ssh to login to target system. Please, configure
logins without password (`ssh-copy-id`).

5. start nginx by typing
```
./start.sh
```

6. server can be tested by
```
./load.sh curl
```

7. generate tls handshakes dos:
```
./load.sh dos
```

8. stop tls dos:
```
killall thc-ssl-dos
```

9. grab the statistics:
```
./dos_stats.sh
```
