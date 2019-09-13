#!/bin/bash 
xterm -hold -e "ipfs init; killall ipfs; ipfs daemon; sleep 5; kill \$PPID"  &


