#!/bin/bash

#
# Simple Port Scan [v1] by [github.com/] BobyMCbobs
# GPL 2.0
#

#<fetch options>
port=$1
dhcpBase=$2
rBottom=$3
rTop=$4

echo "Welcome to Simple Port Scan."

if [ ! -f /usr/bin/nmap ]
then
	echo
	echo "Whoops! Something's wrong!"
	echo
	echo "Please install nmap using your package manager"
	exit
fi

#<if options 1-3 don't exist>
if [ ! $dhcpBase ] || [ ! $port ] || [ ! $rBottom ]
then
	echo
	echo "	spc [port] [IP base] [bottom of range] [top of range, this is optional]"
	echo "Example:"
	echo "	spc 22 192.168.1 0 64"
	echo
	echo "Exiting."
	exit
fi

#<if option 4 doesn't exist, make it the same as option 3>
if [ ! $rTop ]
then
	rTop=$rBottom
fi

#<start open port counter>
totalOpen=0
totalClosed=0

echo "Starting scan on" $dhcpBase.$rBottom-$rTop

#<count from base bottom to top>
for (( i=$rBottom; i<=$rTop; i++ ))
do
	#<find closed and open ports>
	if nmap -Pn --host_timeout 100 --max-retries 0 -p $port $dhcpBase.$i | grep filtered > /dev/null
	then
		echo "	$dhcpBase.$i:$port is closed"
		((totalClosed+=1))
	else
		echo "	$dhcpBase.$i:$port is open"
		((totalOpen+=1))
	fi
done

echo "Scan complete. Port scaned: '$port'. $totalOpen port(s) open, $totalClosed port(s) closed."
