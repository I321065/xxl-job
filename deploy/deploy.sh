#!/usr/bin/env bash

if [ -z ${version} ];
then
    export version=latest
fi

if [ -z ${env} ];
then
    echo "env not defined!"
else
    kubectl get deployment xxl-job-${env} -n zaihui-marketing
    if [ $? -ne 0 ]; then
        kubectl apply -f deploy/${env}/deployment-bird.yaml -n zaihui-marketing
    else
      if [ ${version}="latest" ];
      then
         kubectl delete deployment xxl-job-${env} -n zaihui-marketing
         kubectl apply -f deploy/${env}/deployment-bird.yaml -n zaihui-marketing
      else
         kubectl set image deployment/xxl-job-${env} xxl-job-${env}=docker-inter.kezaihui.com/marketing/xxl-job/xxl-job-app:${version} -n zaihui-marketing
      fi
    fi
    echo "deploy done!!!"
fi