# Lab 6.1 - Übung: Pull Request erstellen und Review bearbeiten

Diese Übung arbeitet paarweise (Review durch die zweite Kursperson) oder mit dem Trainer als Reviewer.

## Ausgangslage

Das `teamsite`-Repository, verbunden mit dem eigenen GitHub-Repository (Stand nach Modul 5), auf `main`, sauberes Arbeitsverzeichnis.

## Aufgaben

1. Einen neuen Branch `feature/team-photo-note` anlegen, in `team.html` einen kurzen Hinweis ergänzen, dass Team-Fotos zu einem späteren Zeitpunkt folgen, committen und pushen.
2. Auf GitHub einen Pull Request von `feature/team-photo-note` gegen `main` eröffnen, mit Titel und einer 2-3-sätzigen Beschreibung (was, warum, wie prüfen).
3. Die zweite Kursperson oder den Trainer als Reviewer zuweisen und mindestens einen Kommentar oder eine Korrektur einholen.
4. Den Kommentar durch eine weitere Änderung auf demselben Branch beantworten, committen und erneut pushen.
5. Den Pull Request mit "Squash and Merge" abschließen und den Branch auf GitHub löschen.
6. Lokal auf `main` wechseln, `git pull` ausführen und den lokalen Branch löschen.

## Beobachtbarer Checkpoint

Der Pull Request ist auf GitHub als "Merged" markiert; `main` enthält die Änderung als genau einen zusätzlichen Commit.

## Abschlusskriterien

- Die PR-Beschreibung ist ohne Rückfrage verständlich.
- Mindestens ein Review-Kommentar wurde tatsächlich bearbeitet, nicht nur ignoriert.
- Der Branch ist nach dem Merge sowohl lokal als auch auf GitHub gelöscht.

## Erweiterung (optional)

Denselben Ablauf ein zweites Mal mit "Rebase and Merge" statt "Squash and Merge" durchführen und die resultierende `main`-Historie (`git log --oneline`) vergleichen.

## Fallback

Ohne zweite Reviewer-Person: der Trainer übernimmt das Review; im Gegenzug review-t die eigene Person einen vom Trainer vorbereiteten Pull Request.
