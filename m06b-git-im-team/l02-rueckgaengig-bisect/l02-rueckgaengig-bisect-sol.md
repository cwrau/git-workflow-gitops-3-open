# Lab 6b.2 - Lösung: Rückgängig machen und Fehler finden

## Aufgabe 1: Vorbereitung

```bash
bash ~/handout/project/setup/snippets/bisect-vorbereiten.sh
cd ~/bisect-demo
```

## Aufgabe 2: Datei wiederherstellen

```bash
echo "kaputt" > log.txt
git status --short
git restore log.txt
```

Nach `git restore` enthält `log.txt` wieder die Einträge, `git status` ist sauber.

## Aufgabe 3: Commit zurücknehmen

```bash
git revert --no-edit HEAD
git log --oneline | head -3
```

Der neue Commit "Revert "feat: Eintrag 12"" steht oben, der ursprüngliche Commit bleibt in der Historie.

## Aufgabe 4: Mit reflog wiederherstellen

```bash
git reset --hard HEAD~2
git reflog | head -4
git reset --hard HEAD@{1}
```

Der Reflog zeigt die Position vor dem `reset`. `HEAD@{1}` führt dorthin zurück.

## Aufgabe 5: Fehler mit bisect finden

```bash
git bisect start
git bisect bad
git bisect good $(git rev-list --max-parents=0 HEAD)
git bisect run sh pruefen.sh
git bisect reset
```

Ausgabe: `... is the first bad commit`, gefolgt von "feat: Eintrag 8". `pruefen.sh` endet mit Exit-Code `1`, sobald `status.txt` nicht mehr "Status: OK" enthält.

## Aufgabe 6: blame und log -S

```bash
git blame status.txt
git log -S"FEHLER" --oneline
```

Beide nennen "feat: Eintrag 8".

## Erweiterung (Beispielantwort)

Beim manuellen Bisect gibt es nach `git bisect good <erster commit>` und `git bisect bad` einen Commit in der Mitte. Dort `cat status.txt` ansehen und `git bisect good` oder `git bisect bad` eingeben, bis Git den ersten schlechten Commit nennt. Danach `git bisect reset`.
