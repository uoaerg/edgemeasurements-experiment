#!/bin/sh

logpath=/home/edgetrace/mnt/capture     

server/server | tee -a $logpath/packetlog.log   
