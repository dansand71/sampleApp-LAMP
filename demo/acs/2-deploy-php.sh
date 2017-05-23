#!/bin/bash
RESET="\e[0m"
INPUT="\e[7m"
BOLD="\e[4m"
YELLOW="\033[38;5;11m"
RED="\033[0;31m"

#az account set --subscription "Microsoft Azure Internal Consumption"
echo ".delete existing php-deployment"
kubectl delete deployment php-deployment



echo "Create php deployment."
kubectl create -f deploy-drupal.yml
echo "-------------------------"

echo "Initial deployment & expose the service"
kubectl expose deployments drupal-deployment --port=80 --target-port=80 --type=LoadBalancer --name=drupal
#kubectl delete service nfs #cleanup so we dont leave the NFS server exposed

echo "Deployment complete for drupal pods"

echo ".kubectl get services"
kubectl get services

echo ".kubectl get pods"
kubectl get pods

echo ".to bash into individual pods - kubectl exec -p <podname> -i -t -- bash -il"
echo ".to check deployment status - kubectl describe po <podname>"
echo " --------------------------------------------------------"
echo " ********************** IMPORTANT ***********************"
echo " --------------------------------------------------------"
echo " please delete the nfs server service endpoint once initial install is complete and confirmed."
echo "kubectl delete service nfs"
echo " --------------------------------------------------------"