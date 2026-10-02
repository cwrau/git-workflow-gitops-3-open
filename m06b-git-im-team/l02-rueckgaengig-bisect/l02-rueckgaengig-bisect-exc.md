# Lab 6b.2 - Übung: Rückgängig machen und Fehler finden

Diese Übung arbeitet in einem eigenen, vorbereiteten Repository `~/bisect-demo`.

## Ausgangslage

Kein bestehendes Repository nötig. Die Vorbereitung legt `~/bisect-demo` an.

## Aufgaben

1. Die Vorbereitung ausführen: `bash ~/handout/project/setup/snippets/bisect-vorbereiten.sh` und mit `cd ~/bisect-demo` in das Repository wechseln.
2. `log.txt` mit `echo "kaputt" > log.txt` überschreiben und mit `git restore log.txt` wiederherstellen.
3. Mit `git revert --no-edit HEAD` den letzten Commit zurücknehmen und in `git log --oneline` den neuen Revert-Commit sehen.
4. Absichtlich mit `git reset --hard HEAD~2` zwei Commits "verlieren", in `git reflog` den früheren Stand finden und mit `git reset --hard HEAD@{1}` wiederherstellen.
5. Mit `git bisect` den Commit finden, in dem `status.txt` auf "FEHLER" wechselt: `git bisect start`, `git bisect bad`, `git bisect good $(git rev-list --max-parents=0 HEAD)`, dann `git bisect run sh pruefen.sh` und zuletzt `git bisect reset`.
6. Dasselbe Ergebnis mit `git blame status.txt` und `git log -S"FEHLER" --oneline` bestätigen.

## Beobachtbarer Checkpoint

`git bisect run` nennt den ersten schlechten Commit "feat: Eintrag 8". `git blame` und `git log -S` zeigen denselben Commit.

## Abschlusskriterien

- `log.txt` ist nach Aufgabe 2 wiederhergestellt.
- Nach Aufgabe 4 steht `HEAD` wieder auf dem Stand vor dem `reset --hard`.
- Alle drei Wege in Aufgabe 5 und 6 nennen denselben Commit.

## Erweiterung (optional)

`git bisect` ohne `run` manuell durchführen: bei jedem Schritt `cat status.txt` ansehen und `git bisect good` oder `git bisect bad` eingeben.

## Fallback

Ohne Zugriff auf die Vorbereitung: ein eigenes Repository mit zehn Commits anlegen, in einem Commit den Inhalt von `status.txt` auf "Status: FEHLER" ändern und eine Datei `pruefen.sh` mit `grep -q "Status: OK" status.txt` anlegen.
