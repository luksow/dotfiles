#!/bin/sh

if ! [ "`ping -c 1 -W 1 google.com`" ]
then
    echo "No"
else
    echo "Ok"
fi

