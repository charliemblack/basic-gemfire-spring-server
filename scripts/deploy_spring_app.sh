#!/usr/bin/env bash

SAVED="`pwd`"
cd "`dirname \"$PRG\"`/.." >&-
POC_HOME="`pwd -P`"
cd "$SAVED" >&-

source ${POC_HOME}/scripts/env.sh

for currHost in "${data_hosts[@]}"
do
    echo ==== Uploading $currHost
    ssh ${SSH_USER}@${currHost} 'mkdir ~/server > /dev/null 2>&1'
    scp ${POC_HOME}/build/libs/demo-0.0.1-SNAPSHOT.jar ${SSH_USER}@${currHost}:~/server/ &
done

wait
