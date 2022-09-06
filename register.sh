#!/bin/bash
OLD=$(realpath $1)
NEW="./$OLD"
printf "%s -> %s\n" $OLD $NEW
mkdir -p $(dirname $NEW)
cp $OLD $OLD.bak && cp $OLD $NEW && rm -f $OLD $OLD.bak
ln -sr $NEW $OLD
