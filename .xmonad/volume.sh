#!/bin/sh

# Volume support was not compiled in xmobar from repo... this was faster
amixer get Master | grep -Eo '\[off\]' > /dev/null
if [ $? == 0 ]
then
    echo '   M'
    exit 0
fi

printf %4s `amixer get Master | grep -Eo '\[.*?%\]' | tr -d []%`%
