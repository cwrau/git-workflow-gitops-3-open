# Lab 5.1 - Übung: Remote-Grundlagen mit einem lokalen Remote-Repository

Diese Übung nutzt ein zweites, lokales Repository als Stand-in für einen entfernten Dienst - GitHub folgt in Lab 5.2.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Modul 4, auf `main`, sauberes Arbeitsverzeichnis.

## Aufgaben

1. Außerhalb von `teamsite` ein bare Repository anlegen: `git init --bare ../teamsite-remote.git`.
2. Das bare Repository als Remote unter dem Namen `origin` eintragen.
3. `main` mit `git push -u origin main` übertragen und mit `git branch -vv` bestätigen, dass ein Tracking-Branch eingerichtet wurde.
4. Einen kleinen, unabhängigen Commit direkt im lokalen `teamsite`-Repository erzeugen (z. B. eine weitere Kleinigkeit in `README.md` ergänzen oder anlegen), aber noch nicht pushen.
5. Mit `git fetch origin` bestätigen, dass sich am Remote nichts geändert hat (da noch nicht gepusht wurde), und den Unterschied zwischen dem lokalen Stand und `origin/main` mit `git log origin/main..main` anzeigen.
6. Den Commit aus Aufgabe 4 mit `git push` übertragen und erneut mit `git log origin/main..main` bestätigen, dass keine Differenz mehr besteht.

## Beobachtbarer Checkpoint

`git remote -v` zeigt `origin` mit Fetch- und Push-Pfad; `git branch -vv` zeigt `main` mit einem `[origin/main]`-Verweis; `git log origin/main..main` ist nach Aufgabe 6 leer.

## Abschlusskriterien

- Das bare Repository enthält nach Aufgabe 3 denselben Stand wie das lokale `main`.
- Der Unterschied aus Aufgabe 5 zeigt genau den einen, noch nicht gepushten Commit.
- Nach Aufgabe 6 sind lokaler und Remote-Stand identisch.

## Erweiterung (optional)

Im bare Repository-Pfad direkt (ohne das lokale `teamsite`-Repository) mit `git log` prüfen, dass dort tatsächlich dieselbe Historie ankommt wie lokal.

## Fallback

Ohne Berechtigung, Ordner außerhalb des Kursverzeichnisses anzulegen: das bare Repository als Unterordner desselben übergeordneten Kursordners anlegen (z. B. `../../scratch/teamsite-remote.git`) - der relative Pfad in `git remote add` entsprechend anpassen.
