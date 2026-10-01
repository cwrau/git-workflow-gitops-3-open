#!/bin/bash
# Installiert Argo CD im aktuellen Kubernetes-Cluster (kind) und wartet, bis die Deployments laufen.
# Optional: feste Version pinnen, z. B. ARGOCD_VERSION=v3.2.0 bash install-argocd.sh
set -euo pipefail

version="${ARGOCD_VERSION:-stable}"
url="https://raw.githubusercontent.com/argoproj/argo-cd/${version}/manifests/install.yaml"

kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd --server-side --force-conflicts -f "$url"
kubectl wait --for=condition=Available deployment --all -n argocd --timeout=300s

echo
echo "Argo CD läuft. Weiter mit gitops-manifests.sh und der Application (README, Abschnitt 3)."
