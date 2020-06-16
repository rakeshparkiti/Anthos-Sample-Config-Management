#!/bin/bash

# Deleting git-secret on Clusters

# Declare No. of Cluster KUBECONFIG file name and place it in default
# directory of $HOME/.kube/ with appropiate cluster name example: <cluster_name>.context"
declare -a ClusterArray=("cis-dev-config" "cis-prod-config" "destiny" )

# Read the ClusterArray items of apply the config management operator on each list items
for val in "${ClusterArray[@]}"; do
  printf "\n\nCluster: $val \n"
  export KUBECONFIG=$HOME/.kube/$val.context
  #echo $KUBECONFIG
  kubectl delete secret git-creds \
  --namespace=config-management-system \
  #cat #HOME/.kube/id_rsa.nomos.pub
done
