#!/bin/sh
temp=$(sensors | grep "Core 0" | awk '{print $4}' | sed 's/+//g')
echo $temp
