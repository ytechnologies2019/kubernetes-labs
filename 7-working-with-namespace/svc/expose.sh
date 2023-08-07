#!/bin/bash
kubectl expose deployment web01 --port=80 --type=ClusterIP --namespace=prod
kubectl expose deployment web02 --port=80 --type=ClusterIP --namespace=prod
kubectl expose deployment stg-web --port=80 --type=ClusterIP --namespace=stg
