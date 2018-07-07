#/bin/bash

procs=`nproc`
rm dos_log_all
for i in `seq 1 ${procs}`;
do
	tail -n 2 dos_log_${i} | head -n 1 >> dos_log_all
done

res=`perl -ne '/\[(\d+)/ && print "$1 + ";' dos_log_all`
echo "Total handshakes per second: `perl -e "print $res 0;"`"

