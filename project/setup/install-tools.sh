#!/bin/bash
# Installiert kind und kubectl per winget und macht sie in Git Bash verfügbar.
set -euo pipefail

links="$(cygpath "$LOCALAPPDATA")/Microsoft/WinGet/Links"
line='export PATH="$PATH:$(cygpath "$LOCALAPPDATA")/Microsoft/WinGet/Links"'

export PATH="$PATH:$links"

for pair in kind:Kubernetes.kind kubectl:Kubernetes.kubectl; do
  tool="${pair%%:*}"
  id="${pair##*:}"
  if command -v "$tool" >/dev/null 2>&1; then
    echo "$tool ist bereits vorhanden"
  else
    winget install --id "$id" --exact --accept-source-agreements --accept-package-agreements
  fi
done

touch ~/.bashrc
grep -qxF "$line" ~/.bashrc || echo "$line" >> ~/.bashrc

docker version --format 'Docker Server: {{.Server.Version}}' || echo "Docker antwortet nicht"
kind version
kubectl version --client

echo
echo "Fertig. In bereits offenen Git-Bash-Fenstern einmal ausführen: source ~/.bashrc"
