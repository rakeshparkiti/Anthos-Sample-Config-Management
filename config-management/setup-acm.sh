#!/bin/bash

# This quick script onboards clusters to Anthos Config Management

# Cluster One Details
export CLUSTER_KUBECONFIG=$HOME/.kube/destiny.context
kubectl apply -f - <<EOF
# config-management.yaml

apiVersion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata:
  name: config-management
spec:
  # clusterName is required and must be unique among all managed clusters
  clusterName: destiny
  git:
    syncRepo: git@github.com:rakeshparkiti/OverallOrg.git
    syncBranch: master
    secretType: ssh
    policyDir: "BU1"
EOF


# Cluster Two Details 
: <<COMMENTED'
export CLUSTER_KUBECONFIG=$HOME/.kube/<Mention the cluster kubeconfig>.context 
kubectl apply -f - <<EOF
# config-management.yaml

apiVersion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata:
  name: config-management
spec:
  # clusterName is required and must be unique among all managed clusters
  clusterName: <Mention Cluster Name>
  git:
    syncRepo: git@github.com:rakeshparkiti/OverallOrg.git #You can Address Other Repo also
    syncBranch: master
    secretType: ssh
    policyDir: "<Mention the Dir"
EOF
COMMENTED'