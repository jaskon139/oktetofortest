#!/bin/bash
cd /app

echo "rungit"

sleep 20h

export KUBECONFIG=./okteto-kube.config

./kubectl apply -f ./k8s.yml





# while /bin/true
# do
#         currentHour=$(date +%H)
#         if [ $currentHour -eq 19 ]
#         then
        
#         dataline=$(cat README.md)
#         current=$(date +%d)

#         if [ $dataline -eq $current ]
#         then
#            echo $(date +%Y-%m-%d);
#         else
#                 date +%d > README.md
#         fi
#         else
#         echo $(date +%Y-%m-%d);
#         fi
#         sleep 55m
# done
#/app/v2ray-v3.31-linux-64/v2ray -co