#!/bin/bash

nc -z localhost 7199 > /dev/null 2>&1
rt_val=$?

down="Cassandra down and stopped running";
up="Cassandra is up and running";
if [ $rt_val != 0 ]; then
   echo $down
    exit 3
else
    echo $up
    exit 0
fi
