#!/bin/sh
temp=$(sensors | grep Package | awk '{print $4}' | sed 's/+//g')
echo $temp
