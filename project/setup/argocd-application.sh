#!/bin/bash
# Trägt die URL von origin (Repository ~/teamsite) als repoURL in die Argo-CD-Application ein und wendet sie mit kubectl apply an.
# Nur ausgeben statt anwenden: DRY_RUN=1 bash ~/handout/project/setup/argocd-application.sh
set -euo pipefail

template="$(cd "$(dirname "$0")/.." && pwd)/gitops-bootstrap/argocd-application.yaml"
repo="$HOME/teamsite"

url="$(git -C "$repo" remote get-url origin)"
case "$url" in
  git@*:*)
    host_path="${url#git@}"
    url="https://${host_path/:/\/}"
    ;;
  ssh://git@*)
    url="https://${url#ssh://git@}"
    ;;
esac

manifest="$(sed "s#<repository-url>#${url}#" "$template")"
echo "repoURL: $url" >&2

if [ -n "${DRY_RUN:-}" ]; then
  printf '%s\n' "$manifest"
else
  printf '%s\n' "$manifest" | kubectl apply -f -
fi
