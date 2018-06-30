#!/bin/bash

declare -a FILES=("load.sh" "load.yaml" "nginx.conf" "perf.sh" "start.sh"
                  "stop.sh" "tempesta_fw.conf" "tsung.xml")
NAME=`basename $0`

usage()
{
	echo -e "\nUsage: ${NAME} CONFIG\n"
	echo -e "Update scripts and configs to test environment"
	echo
}

missed_var()
{
	echo "Variable is missed in config:"
	echo "'$1': $2"
	echo " Exiting..."
	exit -22
}

load()
{
	. $1
}

test_names()
{
	if [[ -z $DUT_IP ]]; then
		missed_var "DUT_IP" "DUT IP address, used in load generators"
	fi
	if [[ -z $DUT_PORT_N ]]; then
		missed_var "DUT_PORT_N" "Nginx HTTP listen port"
	fi
	if [[ -z $DUT_PORT_N_SSL ]]; then
		missed_var "DUT_PORT_N_SSL" "Nginx HTTPS listen port"
	fi
	if [[ -z $DUT_PORT_T ]]; then
		missed_var "DUT_PORT_T" "Tempesta HTTP listen port"
	fi
	if [[ -z $DUT_PORT_T_SSL ]]; then
		missed_var "DUT_PORT_T_SSL" "Tempesta HTTPS listen port"
	fi
	if [[ -z $DUT_PORT_TEST ]]; then
		missed_var "DUT_PORT_TEST" "DUT stressed port"
	fi
	if [[ -z $DUT_SSH ]]; then
		missed_var "DUT_SSH" "DUT ssh hostname"
	fi
	if [[ -z $KEY ]]; then
		missed_var "KEY" "SSL certificate type"
	fi
}

replace()
{
	for file in "${FILES[@]}"
	do
		sed -i "s/%DUT_IP%/${DUT_IP}/g" $file
		sed -i "s/%DUT_PORT_N%/${DUT_PORT_N}/g" $file
		sed -i "s/%DUT_PORT_N_SSL%/${DUT_PORT_N_SSL}/g" $file
		sed -i "s/%DUT_PORT_T%/${DUT_PORT_T}/g" $file
		sed -i "s/%DUT_PORT_T_SSL%/${DUT_PORT_T_SSL}/g" $file
		sed -i "s/%DUT_PORT_TEST%/${DUT_PORT_TEST}/g" $file
		sed -i "s/%DUT_SSH%/${DUT_SSH}/g" $file
		sed -i "s/%KEY%/${KEY}/g" $file
	done
}

if [[ -z $1 ]]; then
	usage
	exit -22
fi
if [ ! -f $1 ]; then
	echo "File not found!"
	exit -2
fi

load $1
test_names
replace
