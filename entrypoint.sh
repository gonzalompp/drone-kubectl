#!/bin/sh

set -e

# env variable base64 to file
echo "${PLUGIN_K8S_CERTIFICATE}" | base64 -d > ca.crt
kubectl config set-cluster default-cluster --server=${PLUGIN_K8S_SERVER} --certificate-authority=ca.crt
kubectl config set-context default-context --cluster=default-cluster --user=${PLUGIN_K8S_USER}
kubectl config use-context default-context
kubectl config set-credentials ${PLUGIN_K8S_USER} --token=${PLUGIN_K8S_TOKEN}