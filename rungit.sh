#!/bin/bash

apt install -y git

while true
do

sleep 1400

cd /tmp

    if [ ! -n $gitdir ]; then  
        echo "IS NULL"  
    else
        rm -rf $gitname
        echo "IS not NULL"  
        git clone $gitdir  
        cd $gitname
        chmod +x configrun.sh
        ./configrun.sh 2>&1 > /tmp/zz.txt
    fi
done
