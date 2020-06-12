#!/bin/bash

# This quick script onboards clusters to Anthos Config Management

export KUBECONFIG=$HOME/.kube/destiny-kubeconfig 
kubectl delete -f - <<EOF
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
    secretType: none
    policyDir: "BU1"
EOF