#!/bin/bash
REAL=$(realpath $1)
MANAGED=./$REAL
ln -sr $MANAGED $REAL
