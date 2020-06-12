#!/bin/bash

# Creating an SSH Keys

ssh-keygen -t rsa -b 4096 \
-C "$GCLOUD_ACCOUNT" \
-N '' \
-f $HOME/.ssh/id_rsa.nomos

# Creating git-secret on Clusters

export CLUSTER_KUBECONFIG=$HOME/.kube/destiny.context
export CLUSTER_NAME=destiny
kubectx $CLUSTER_NAME
kubectl create secret generic git-creds \
--namespace=config-management-system \
--from-file=ssh=$HOME/.ssh/id_rsa.nomos


: <<COMMENTED'
kubectx config-remote
kubectl create secret generic git-creds \
--namespace=config-management-system \
--from-file=ssh=$HOME/.ssh/id_rsa.nomos

cat $HOME/.ssh/id_rsa.nomos.pub
COMMENTED'