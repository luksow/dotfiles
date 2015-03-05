#!/bin/sh

# xmobar is stupid or it's me but I couldn't manage to get it working with spaces between signs...

d1=`date +"%a %d %b %H:%M"`
d2=`TZ="America/Los_Angeles" date +"%a %d %b %H:%M"`
d3=`TZ="America/New_York" date +"%a %d %b %H:%M"`
echo L: $d1 NY: $d3 SF: $d2
