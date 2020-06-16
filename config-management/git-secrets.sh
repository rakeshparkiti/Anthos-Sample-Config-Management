#!/bin/bash

# Creating an SSH Keys

ssh-keygen -t rsa -b 4096 \
-C "$GCLOUD_ACCOUNT" \
-N '' \
-f $HOME/.ssh/id_rsa.nomos

# Creating git-secret on Clusters

# Declare No. of Cluster KUBECONFIG file name and place it in default
# directory of $HOME/.kube/ with appropiate cluster name example: <cluster_name>.context"
declare -a ClusterArray=("cis-dev-config" "cis-prod-config" "destiny" )

# Read the ClusterArray items of apply the config management operator on each list items
for val in "${ClusterArray[@]}"; do
  printf "\n\nCluster: $val \n"
  export KUBECONFIG=$HOME/.kube/$val.context
  #echo $KUBECONFIG
  kubectl create secret generic git-creds \
  --namespace=config-management-system \
  --from-file=ssh=$HOME/.ssh/id_rsa.nomos
  #cat #HOME/.kube/id_rsa.nomos.pub
done
