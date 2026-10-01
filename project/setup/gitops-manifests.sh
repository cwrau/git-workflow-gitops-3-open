#!/bin/bash
# Kopiert project/gitops aus dem Handout in das Repository teamsite und pusht es.
set -euo pipefail

src="$(cd "$(dirname "$0")/.." && pwd)/gitops"
dest="$HOME/teamsite"

if [ ! -d "$dest/.git" ]; then
  echo "$dest ist kein Git-Repository. Zuerst teamsite-repo.sh ausführen." >&2
  exit 1
fi

mkdir -p "$dest/project"
cp -r "$src" "$dest/project/"

cd "$dest"
git add project/gitops
git diff --cached --quiet || git commit -m "GitOps-Manifeste ergänzen"
git push

echo
echo "Fertig: project/gitops liegt in $dest und ist gepusht."
