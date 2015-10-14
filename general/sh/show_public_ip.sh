#!/bin/bash

ip=$(telnet ifcfg.me | grep IPv4 | grep -Eo [0-9.]+ | tail -n 1)
notify-send $ip
echo $ip
