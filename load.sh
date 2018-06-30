#!/bin/bash

NAME=`basename $0`

usage()
{
	echo -e "\nUsage: ${NAME} TOOL\n"
	echo -e "Start load for the DUT"
	echo -e "TOOL:"
	echo -e "tank          - Yandex Tank"
	echo -e "tsung         - tsung"
	echo -e "dos           - thc-tls-dos tool"
	echo -e "curl          - curl"
	echo
}

run_tank()
{
	docker run -v $(pwd):/var/loadtest --net host -it direvius/yandex-tank
}

run_tsung()
{
	tsung -k -f tsung.xml start
}

run_dos()
{
	../thc-tls-dos/src/thc-tls-dos --accept %DUT_IP% %DUT_PORT_TEST%
}

run_curl()
{
	curl -v -k https://%DUT_IP%:%DUT_PORT_TEST%/0
}

case $space in
	tank)
		run_tank
		exit 0
		;;
	tsung)
		run_tsung
		exit 0
		;;
	dos)
		run_dos
		exit 0
		;;
	curl)
		run_curl
		exit 0
		;;
	*)
		usage
		exit -1
		;;
esac
