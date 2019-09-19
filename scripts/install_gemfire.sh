#!/usr/bin/env bash

SAVED="`pwd`"
cd "`dirname \"$PRG\"`/.." >&-
POC_HOME="`pwd -P`"
cd "$SAVED" >&-

source ${POC_HOME}/scripts/env.sh

for currHost in "${all_hosts[@]}"
do
    echo ==== Installing on $currHost
    ssh -o LogLevel=Error -t ${SSH_USER}@${currHost} '/usr/bin/env bash --login'  << ENDSSH
        wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
        sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
        sudo apt-get -y install adoptopenjdk-8-hotspot
        wget https://gemfire-field.s3.amazonaws.com/pivotal-gemfire-9.8.3.tgz
        tar zxvf pivotal-gemfire-9.8.3.tgz
        echo "export PATH=~/pivotal-gemfire-9.8.3/bin:\\\${PATH}" >> ~/.bash_profile
        rm -f pivotal-gemfire-9.8.3.tgz
ENDSSH
done

