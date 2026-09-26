# Lab 4.3 - Übung: Merge-Konflikt herbeiführen und auflösen

Diese Übung provoziert bewusst einen Merge-Konflikt im `teamsite`-Repository und löst ihn auf.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Lab 4.2, auf `main`, sauberes Arbeitsverzeichnis.

## Aufgaben

1. Einen neuen Branch `feature/portal-title` anlegen, darin die Überschrift `<h1>Kodschul Team Site</h1>` in `index.html` zu `<h1>Kodschul Team Portal</h1>` ändern und committen.
2. Zurück auf `main` wechseln, dieselbe Überschriftenzeile stattdessen zu `<h1>Kodschul Team Site - Uebersicht</h1>` ändern und committen.
3. `feature/portal-title` in `main` mergen und den entstehenden Konflikt mit `git status` bestätigen.
4. Die Konfliktstelle in `index.html` öffnen, die drei Konfliktmarkierungen identifizieren und eine bewusste Entscheidung treffen (z. B. eine der beiden Formulierungen übernehmen oder beide sinnvoll kombinieren, z. B. "Kodschul Team Portal - Uebersicht").
5. Die Konfliktmarkierungen vollständig entfernen, die Datei stagen und den Merge mit einer erklärenden Commit-Nachricht abschließen.
6. In 1-2 Sätzen dokumentieren, welche Entscheidung getroffen wurde und warum.
7. Den nicht mehr benötigten Branch `feature/portal-title` löschen.

## Beobachtbarer Checkpoint

`git status` meldet nach Aufgabe 5 ein sauberes Arbeitsverzeichnis; `index.html` enthält keine Konfliktmarkierungen mehr; `git log --oneline --graph` zeigt einen Merge-Commit mit zwei Elternteilen.

## Abschlusskriterien

- Die Konfliktstelle enthält eine einzige, bewusst gewählte Überschrift ohne verbleibende Markierungen.
- Die Commit-Nachricht des Merge-Commits erklärt kurz die getroffene Entscheidung.
- Der Branch `feature/portal-title` ist gelöscht.

## Erweiterung (optional)

Vor der Konfliktauflösung `git diff` innerhalb der Konfliktdatei ausprobieren, um zu beobachten, wie sich die Konfliktmarkierungen von einem gewöhnlichen Diff unterscheiden.

## Fallback: Merge abbrechen

Bei Unsicherheit während der Konfliktauflösung: `git merge --abort` stellt den Stand von `main` vor dem Merge-Versuch vollständig wieder her, ohne dass Änderungen verloren gehen; Aufgabe 3 kann danach erneut begonnen werden.
