#!/bin/bash
RESET="\e[0m"
INPUT="\e[7m"
BOLD="\e[4m"
YELLOW="\033[38;5;11m"
RED="\033[0;31m"

echo "This script deploys MYSQL.  Depending on size of disk it can take up to 10 mins to format the disk upon first provisioning for STD storage."
echo ".delete existing mysql-deployment"
kubectl delete deployment mysql-lamp-deployment

echo "-------------------------"
echo "Deploy the MySQL connection secrets"
kubectl create -f k8s-secret.yml

echo "-------------------------"
echo "Deploy the Persistent Volume claim and MySQL Service"
echo ".deploy MYSQL Server PVC"
kubectl create -f deploy-mysql.yml
echo "-------------------------"

echo "Deployment complete for mysql pod.  Please check the status below."
echo "........................................"
echo ".to bash into individual pods - kubectl exec -p <podname> -i -t -- bash -il"
echo ".to check deployment status - kubectl describe po <podname>"
echo "........................................"
echo "RUN STEP 2 once the SERVICES ARE ACTIVE and NFS Server is running"
echo "For Example:   kubectl get services"
echo " NAME         CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE"

echo " -----------------------------------------"
echo "Current status:" 
kubectl get services
echo ""
echo ""
echo "........................................"
echo "For Example:   kubectl get pods"
echo " NAME                                     READY     STATUS    RESTARTS   AGE"

echo " -----------------------------------------"
echo "Current status:"
kubectl get pods
echo ""
echo "To get location of VHD's for MYSQL and NFS:"
kubectl get pvc
echo "kubectl describe <paste PVC HERE>"
echo "To bash into pod:"
echo "kubectl exec -it <POD NAME HERE> bash"
