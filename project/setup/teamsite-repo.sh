#!/bin/bash
# Legt das Repository teamsite mit dem Stand nach Tag 2 an und pusht es nach GitHub.
# Aufruf: bash ~/handout/project/setup/teamsite-repo.sh <github-konto>
# Vorher auf GitHub ein leeres, öffentliches Repository "teamsite" anlegen.
set -euo pipefail

konto="${1:?Aufruf: bash ~/handout/project/setup/teamsite-repo.sh <github-konto>}"
src="$(cd "$(dirname "$0")/.." && pwd)/checkpoints/after-day2"
dest="$HOME/teamsite"

if [ -e "$dest" ]; then
  echo "$dest existiert bereits, Abbruch." >&2
  exit 1
fi

mkdir "$dest"
cp -r "$src"/. "$dest"/
cd "$dest"

git init -b main
git add .
git commit -m "Stand nach Tag 2"
git remote add origin "https://github.com/$konto/teamsite.git"
git push -u origin main

echo
echo "Fertig: $dest"
