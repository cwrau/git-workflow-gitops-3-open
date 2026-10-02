#!/bin/bash
# Bereitet Lab 6b.2 vor: Repository ~/bisect-demo mit zwölf Commits, in einem davon steckt ein Fehler.
# Aufruf: bash ~/handout/project/setup/snippets/bisect-vorbereiten.sh
set -euo pipefail

dir="$HOME/bisect-demo"
if [ -e "$dir" ]; then
  echo "$dir existiert bereits, Abbruch." >&2
  exit 1
fi

mkdir "$dir"
cd "$dir"
git init -q -b main

printf '#!/bin/sh\ngrep -q "Status: OK" status.txt\n' > pruefen.sh
echo "Status: OK" > status.txt
git add .
git commit -q -m "chore: Ausgangsstand"

for i in 2 3 4 5 6 7 8 9 10 11 12; do
  echo "Eintrag $i" >> log.txt
  if [ "$i" = 8 ]; then
    echo "Status: FEHLER" > status.txt
  fi
  git add -A
  git commit -q -m "feat: Eintrag $i"
done

echo "Fertig: $dir"
git log --oneline | head -5
echo
echo "Weiter mit: cd ~/bisect-demo"
