#!/bin/bash
cp $1 ./$1
rm -rf $1
ln -sr ./$1 $1
