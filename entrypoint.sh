#!/bin/sh

set -e

# env variable base64 to file
echo "${k8s_certificate}" | base64 -d > ca.crt
kubectl config set-cluster do-fra1-k8-go-api --server=${k8s_server} --certificate-authority=ca.crt
kubectl config set-context do-fra1-k8-go-api --cluster=do-fra1-k8-go-api --user=do-fra1-k8-go-api-admin
kubectl config use-context do-fra1-k8-go-api
kubectl config set-credentials do-fra1-k8-go-api-admin --token=ffc316723d0c9b30d8a684206b0eda30176e7ff0c5878b607d2ba6ae50f9221c

# echo ${PLUGIN_TEST_VAR}

# kubectl version --client
kubectl config view
kubectl cluster-info --namespace=default
kubectl apply -f deployment.yml
