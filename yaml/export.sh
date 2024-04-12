#!/bin/sh
for a in $(kubectl get deploy -n database |grep -v NAME |awk '{print $1}')
do
    kubectl get deploy $a -n database -o yaml  > "$a-deploy.yaml"
done
for a in $(kubectl get deploy -n assets-server |grep -v NAME |awk '{print $1}')
do
    kubectl get deploy $a -n assets-server -o yaml  > "$a-deploy.yaml"
done
for a in $(kubectl get deploy -n pay |grep -v NAME |awk '{print $1}')
do
    kubectl get deploy $a -n pay -o yaml  > "$a-deploy.yaml"
done
for a in $(kubectl get configmap -n pay |grep -v NAME |awk '{print $1}')
do
    kubectl get configmap $a -n pay -o yaml  > "$a-cofigmap.yaml"
done
for a in $(kubectl get configmap -n database |grep -v NAME |awk '{print $1}')
do
    kubectl get configmap $a -n database -o yaml  > "$a-configmap.yaml"
done
for a in $(kubectl get configmap -n assets-server |grep -v NAME |awk '{print $1}')
do
    kubectl get configmap $a -n assets-server -o yaml  > "$a-deploy.yaml"
done
