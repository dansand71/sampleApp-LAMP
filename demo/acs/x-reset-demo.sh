#!/bin/bash
echo "Delete the service and deployment which will cleanup the pods and external IP's'"
#az account set --subscription "Microsoft Azure Internal Consumption"
kubectl delete service mysql-lamp
kubectl delete service php
kubectl delete deployment mysql-lamp-deployment
kubectl delete deployment php-dbconnect
