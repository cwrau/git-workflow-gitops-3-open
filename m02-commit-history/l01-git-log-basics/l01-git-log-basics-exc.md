# Lab 2.1 - Übung: Commit-Historie lesen und Revisionen abkürzen

Diese Übung nutzt ein eigenständiges Übungs-Repository, nicht die Kodschul Team Site.

## Ausgangslage

Ein leerer, neuer lokaler Ordner `history-lab`.

## Aufgaben

1. Repository anlegen und vier Commits erzeugen:

   ```bash
   mkdir history-lab && cd history-lab
   git init
   echo "Entwurf" > notes.md && git add notes.md && git commit -m "Erste Notiz anlegen"
   echo "Entwurf, Version 2" > notes.md && git add notes.md && git commit -m "Notiz ueberarbeiten"
   echo "Freigegeben" > notes.md && git add notes.md && git commit -m "Notiz freigeben"
   echo "Freigegeben, Korrektur" > notes.md && git add notes.md && git commit -m "Tippfehler korrigieren"
   ```

2. Mit `git log` die vollständige Historie ansehen, mit `git log --oneline` die kompakte Variante.
3. Mit `git show HEAD~2` den dritt-neuesten Commit im Detail ansehen und notieren, welcher Inhalt dort eingeführt wurde.
4. Mit `git log HEAD~3..HEAD~1` genau die mittleren zwei Commits auflisten.
5. Eine kurze Tabelle erstellen: Commit-Position (`HEAD`, `HEAD~1`, `HEAD~2`, `HEAD~3`), gekürzter Hash, Commit-Nachricht, Inhalt von `notes.md` zu diesem Zeitpunkt.

## Beobachtbarer Checkpoint

Die Tabelle aus Aufgabe 5 enthält für alle vier Commits einen korrekten, aus der tatsächlichen `git log`/`git show`-Ausgabe abgelesenen Hash und Inhalt.

## Abschlusskriterien

- Alle vier Commits sind in der Tabelle korrekt der richtigen `HEAD~n`-Position zugeordnet.
- Der mit `git show HEAD~2` untersuchte Diff ist in eigenen Worten korrekt beschrieben.
- `git log HEAD~3..HEAD~1` listet genau zwei Commits.

## Erweiterung (optional)

Mit `git log --oneline --graph` die Historie zusätzlich als einfaches Liniendiagramm darstellen und mit der linearen `git log --oneline`-Ausgabe vergleichen.

## Fallback

Bei Unsicherheit beim Abtippen der Befehlskette aus Aufgabe 1: die vier Befehlszeilen einzeln, nacheinander ausführen und nach jedem Schritt mit `git log --oneline` den Zwischenstand prüfen.
