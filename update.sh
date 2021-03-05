#!/bin/bash
rm -rf manifests/upstream
curl -L https://github.com/prometheus-operator/kube-prometheus/archive/main.zip > kube-prometheus.zip
unzip -o  kube-prometheus.zip
mkdir -p manifests/upstream
cp -r kube-prometheus-main/manifests/ manifests/upstream/manifests
rm -rf kube-prometheus.zip kube-prometheus-main
cd manifests/upstream
kustomize init
kustomize edit add resource manifests/setup/*.yaml
kustomize edit add resource manifests/*.yaml
cd ../..
