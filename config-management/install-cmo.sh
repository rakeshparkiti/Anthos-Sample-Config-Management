#!/bin/bash

# This installs Anthos Config Management CRD on clusters

# Declare No. of Cluster KUBECONFIG file name and place it in default
# directory of $HOME/.kube/ with appropiate cluster name example: <cluster_name>.context"
declare -a ClusterArray=("cis-dev-config" "cis-prod-config" "destiny" )
 
# Read the ClusterArray items of apply the config management operator on each list items
for val in "${ClusterArray[@]}"; do
  printf "\n\nCluster: $val \n"
  export KUBECONFIG=$HOME/.kube/$val.context
  #echo $KUBECONFIG
  kubectl apply -f ./config-management-operator.yaml
done
