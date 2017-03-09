#!/bin/sh

logpath=/home/edgetrace/mnt/capture

sudo tcpdump -w '$logpath/trace_%Y-%m-%d_%H:%M:%S.pcap' \
	-G 3600 \
	-i re0 \
	"(tcp and port 80) or (udp and port 60606)"

