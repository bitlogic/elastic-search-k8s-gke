#!/bin/bash -v
kubectl create -f resources/
# kubectl expose deployment sma-frontend  --port=8080 --type=LoadBalancer --name=frontend-ext
