# Lab 6b.1 - Übung: Rebase und sicheres Pushen

Diese Übung arbeitet im Repository `~/teamsite` (siehe `project/setup/README.md`, Abschnitt 2) mit einem vorbereiteten Feature-Branch.

## Ausgangslage

Das Repository `teamsite` auf GitHub, `main` ist gepusht, das Arbeitsverzeichnis ist sauber.

## Aufgaben

1. Mit `cd ~/teamsite` in das Repository wechseln und die Vorbereitung ausführen: `bash ~/handout/project/setup/snippets/rebase-vorbereiten.sh`. Sie legt den Branch `feature/notizen` mit drei Commits an, gibt `main` einen weiteren Commit und pusht beides.
2. Mit `git log --oneline --graph --all` ansehen, dass `feature/notizen` auf dem alten Stand von `main` aufbaut.
3. Auf `feature/notizen` den Branch mit `git rebase main` auf den aktuellen `main` aufsetzen und den Graphen erneut ansehen.
4. Mit `git rebase -i HEAD~3` die beiden "wip"-Commits in den ersten Commit einfügen: in der Liste bei den Zeilen 2 und 3 `pick` durch `fixup` ersetzen, speichern, schließen.
5. `git push` ausführen und die Ablehnung (non-fast-forward) beobachten, dann `git push --force-with-lease` ausführen.
6. Mit `git switch main` zurück auf `main` wechseln, die folgenden Labs laufen dort.

## Beobachtbarer Checkpoint

`git log --oneline --graph --all` zeigt einen linearen Verlauf: `main` mit dem Neuigkeits-Commit, darüber ein einziger Commit "feat: Notizen ergänzen". Der Branch liegt unverändert auf GitHub.

## Abschlusskriterien

- Der Branch baut auf dem aktuellen `main` auf.
- Aus drei Commits ist einer geworden.
- Der Push mit `--force-with-lease` ist erfolgreich, der normale Push wurde zuvor abgelehnt.

## Erweiterung (optional)

Den Branch erneut vorbereiten, aber vor Aufgabe 3 in `neuigkeit.md` auf `main` und `notizen.md` Änderungen an derselben Zeile machen. Den entstehenden Konflikt beim Rebase auflösen (`git add`, `git rebase --continue`).

## Fallback

Öffnet sich der Editor nicht oder ist `vim` ungewohnt: Aufgabe 4 ohne Editor ausführen mit `GIT_SEQUENCE_EDITOR="sed -i '2,3s/^pick/fixup/'" git rebase -i HEAD~3`. Alternativ vorab `git config --global core.editor nano` setzen.
