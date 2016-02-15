#!/bin/bash

cd "$1"
feh --bg-fill `ls | shuf -n 2 | tr '\n' ' '`
