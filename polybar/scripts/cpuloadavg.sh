#!/bin/sh

load=$(awk '{print $1}' < /proc/loadavg)
label=" "
echo -n $load
