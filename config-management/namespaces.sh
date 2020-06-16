#!/bin/bash

# Declare No. of Cluster KUBECONFIG file name and place it in default
# directory of $HOME/.kube/ with appropiate cluster name example: <cluster_name>.context"
declare -a ClusterArray=("cis-dev-config" "cis-prod-config" "destiny" )

# checkin the nomos status sync with Git Repo.
for val in "${ClusterArray[@]}"; do
  printf "\n\nCluster: $val \n"
  export KUBECONFIG=$HOME/.kube/$val.context
  kubectl get ns
  kubectl delete ns nginx bank-app sock-shop 
  #kubectl get deployments,pods,svc 
done
