#!/bin/bash

# turn on bash's job control
#set -m

# Start the primary process and put it in the background
# MOXA_CONNECTION_STRING eq. tcp:192.168.1.22:4001
echo MOXA_CONNECTION_STRING $MOXA_CONNECTION_STRING
socat pty,link=/dev/moxa0,raw $MOXA_CONNECTION_STRING & 

ps ax  
# Start the helper process
mpp-solar --configfile /etc/mpp-solar/mpp-solar.conf --debug
  
# the my_helper_process might need to know how to wait on the
# primary process to start before it does its work and returns
  
  
# now we bring the primary process back into the foreground
# and leave it there
#fg %2