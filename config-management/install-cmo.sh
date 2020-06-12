#!/bin/bash

# This installs Anthos Config Management CRD on clusters

# First Cluster
export CLUSTER_KUBECONFIG=$HOME/.kube/destiny.context
kubectl apply -f ./config-management-operator.yaml

# Second Cluster
#export KUBECONFIG=$HOME/.kube/othercluster-kubeconfig 
#kubectl apply -f ./config-management-operator.yaml
