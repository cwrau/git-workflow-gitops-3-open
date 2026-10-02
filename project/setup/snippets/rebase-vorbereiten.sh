#!/bin/bash
# Bereitet Lab 6b.1 vor: Feature-Branch mit drei Commits, main bekommt einen weiteren Commit.
# Aufruf im Repository teamsite: bash ~/handout/project/setup/snippets/rebase-vorbereiten.sh
set -euo pipefail

cd "$HOME/teamsite"

if git show-ref --verify --quiet refs/heads/feature/notizen; then
  echo "Branch feature/notizen existiert bereits, Abbruch." >&2
  exit 1
fi

git switch main
git pull --ff-only

git switch -c feature/notizen
echo "Notiz 1" >> notizen.md
git add notizen.md
git commit -m "feat: Notizen ergänzen"
echo "Notiz 2" >> notizen.md
git add notizen.md
git commit -m "wip: Notiz 2"
echo "Notiz 3" >> notizen.md
git add notizen.md
git commit -m "wip: Notiz 3"
git push -u origin feature/notizen

git switch main
echo "Neuigkeit auf main" > neuigkeit.md
git add neuigkeit.md
git commit -m "feat: Neuigkeit ergänzen"
git push

git switch feature/notizen
echo
git log --oneline --graph --all
