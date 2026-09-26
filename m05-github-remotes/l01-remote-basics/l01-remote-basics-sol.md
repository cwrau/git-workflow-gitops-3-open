# Lab 5.1 - Lösung: Remote-Grundlagen mit einem lokalen Remote-Repository

## Aufgabe 1-3: Bare Repository einrichten

```bash
git init --bare ../teamsite-remote.git
git remote add origin ../teamsite-remote.git
git push -u origin main
git branch -vv
```

Erwartete Ausgabe von `git branch -vv`: `* main <hash> [origin/main] <letzte commit-nachricht>`.

## Aufgabe 4: Unabhängiger Commit

```bash
echo "# Kodschul Team Site" > README.md
git add README.md
git commit -m "README hinzufuegen"
```

## Aufgabe 5: Unterschied prüfen

```bash
git fetch origin
git log origin/main..main
```

Erwartete Ausgabe: genau ein Commit (die README-Ergänzung) - dieser existiert lokal, aber noch nicht auf `origin/main`.

## Aufgabe 6: Push und erneute Prüfung

```bash
git push
git log origin/main..main
```

Nach dem Push ist die Ausgabe von `git log origin/main..main` leer - lokaler und Remote-Stand sind identisch.

## Erweiterung (Beispielantwort)

```bash
git --git-dir=../teamsite-remote.git log --oneline
```

Zeigt dieselbe Commit-Historie wie im lokalen `teamsite`-Repository - das bare Repository enthält denselben Datenbestand, nur ohne eigenes Arbeitsverzeichnis.

## Einordnung für GitHub (Ausblick)

Ein bare Repository lokal und ein Repository auf GitHub unterscheiden sich für die hier verwendeten Befehle (`remote add`, `fetch`, `push`, `pull`) nicht grundsätzlich - GitHub ergänzt zusätzlich Authentifizierung, eine Weboberfläche und Kollaborationsfunktionen wie Pull Requests.
