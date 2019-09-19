#!/usr/bin/env bash


SAVED="`pwd`"
cd "`dirname \"$PRG\"`/.." >&-
POC_HOME="`pwd -P`"
cd "$SAVED" >&-

source ${POC_HOME}/scripts/env.sh

for currHost in "${locator_hosts[@]}"
do
	echo Starting Locator on $currHost for site a
	ssh  -o LogLevel=Error -T ${SSH_USER}@${currHost}  '/usr/bin/env bash --login'  << ENDSSH &
	mkdir locator  > /dev/null 2>&1
	cd locator
	gfsh -e "start locator --locators=${locators} --name=${currHost}_locator"
ENDSSH
done

wait

for currHost in "${data_hosts[@]}"
do
	echo Starting gemfire server on $currHost
    ssh  -o LogLevel=Error -T ${SSH_USER}@${currHost} '/usr/bin/env bash --login'  << ENDSSH &
    cd server
	  nohup java -Dspring.data.gemfire.cache.name=${currHost}_server -jar demo-0.0.1-SNAPSHOT.jar >> server.log 2>&1 &
ENDSSH
done

wait

