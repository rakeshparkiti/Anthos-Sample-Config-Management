#!/bin/bash

# This quick script onboards clusters to Anthos Config Management

# Cluster One Details
export KUBECONFIG=$HOME/.kube/cis-dev-config.context 
kubectl apply -f - <<EOF
# config-management.yaml

apiVersion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata:
  name: config-management
spec:
  # clusterName is required and must be unique among all managed clusters
  clusterName: cis-dev-config
  git:
    syncRepo: git@github.com:rakeshparkiti/OverallOrg.git #You can Address Other Repo also
    syncBranch: master
    secretType: ssh
    policyDir: "BUs/BU1"
EOF

# Cluster Two Details 
export KUBECONFIG=$HOME/.kube/cis-prod-config.context
kubectl apply -f - <<EOF
# config-management.yaml

apiVersion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata:
  name: config-management
spec:
  # clusterName is required and must be unique among all managed clusters
  clusterName: cis-prod-config
  git:
    syncRepo: git@github.com:rakeshparkiti/OverallOrg.git
    syncBranch: master
    secretType: ssh
    policyDir: "BUs/BU1"
EOF

# Cluster Three Details 
export KUBECONFIG=$HOME/.kube/destiny.context
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
    policyDir: "OverallOrg-Common"
EOF
