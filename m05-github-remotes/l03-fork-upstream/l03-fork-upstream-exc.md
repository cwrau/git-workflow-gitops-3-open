# Lab 5.3 - Übung: Fork erstellen und mit einem Upstream-Repository arbeiten

Diese Übung arbeitet paarweise: eine Person stellt das "Original-Repository" (Upstream), die andere forkt es - alternativ mit zwei eigenen GitHub-Konten oder einem vom Trainer bereitgestellten Original-Repository.

## Ausgangslage

Ein bestehendes GitHub-Repository "teamsite" (aus Lab 5.2), auf das Lese-/Fork-Zugriff besteht.

## Aufgaben

1. Über die GitHub-Weboberfläche einen Fork des Repositorys unter dem eigenen Konto erstellen.
2. Den eigenen Fork lokal klonen.
3. Im geklonten Repository einen zusätzlichen Remote `upstream` einrichten, der auf das Original-Repository zeigt.
4. Mit `git remote -v` bestätigen, dass sowohl `origin` (eigener Fork) als auch `upstream` (Original) korrekt eingetragen sind.
5. Im Original-Repository (durch die andere Kursperson oder den Trainer) wird zwischenzeitlich ein neuer Commit auf `main` erzeugt (z. B. eine weitere Ergänzung in `README.md`).
6. Im eigenen Fork `git fetch upstream` ausführen und den neuen Commit mit `git merge upstream/main` übernehmen.
7. Den aktualisierten Stand mit `git push origin main` in den eigenen Fork übertragen.

## Beobachtbarer Checkpoint

Nach Aufgabe 7 enthält sowohl der lokale Klon als auch der eigene Fork auf GitHub den neuen Commit aus dem Original-Repository.

## Abschlusskriterien

- `git remote -v` zeigt zwei unterschiedliche Ziel-URLs für `origin` und `upstream`.
- Der neue Commit aus dem Original-Repository ist nach Aufgabe 6 lokal auf `main` sichtbar.
- Der eigene Fork auf GitHub zeigt nach Aufgabe 7 denselben Stand wie das lokale `main`.

## Erweiterung (optional)

Einen eigenen Commit im Fork erzeugen und über einen Pull Request an das Original-Repository vorschlagen (Vertiefung folgt in Modul 6).

## Fallback

Ohne zweite Kursperson oder zweites Konto: der Trainer stellt ein Original-Repository mit einem vorbereiteten zusätzlichen Commit bereit, gegen den Aufgabe 5-7 einzeln durchgeführt werden.
