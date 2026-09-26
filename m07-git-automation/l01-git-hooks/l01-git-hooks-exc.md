# Lab 7.1 - Übung: Lokalen Git-Hook einrichten

Diese Übung arbeitet im `teamsite`-Repository (Stand nach Tag 2: `output/project/checkpoints/after-day2/`).

## Ausgangslage

Das `teamsite`-Repository, sauberes Arbeitsverzeichnis, auf `main`.

## Aufgaben

1. Eine ausführbare Datei `.git/hooks/pre-commit` anlegen, die alle `.js`-Dateien im Repository nach dem Text `console.log` durchsucht und den Commit mit Exit-Code `1` ablehnt, falls ein Treffer gefunden wird; ohne Treffer soll der Hook mit Exit-Code `0` enden.
2. Den Hook mit `chmod +x .git/hooks/pre-commit` ausführbar machen.
3. In `app.js` testweise eine `console.log`-Zeile ergänzen und versuchen, sie zu committen; den abgelehnten Commit dokumentieren (Ausgabe des Hooks notieren).
4. Die `console.log`-Zeile wieder entfernen und erneut versuchen zu committen; den erfolgreichen Commit bestätigen.
5. Mit `git log -1` bestätigen, dass kein Commit mit der `console.log`-Zeile in der Historie gelandet ist.

## Beobachtbarer Checkpoint

Der Commit-Versuch aus Aufgabe 3 schlägt sichtbar fehl (Hook-Ausgabe plus abgebrochener Commit); der Commit-Versuch aus Aufgabe 4 gelingt.

## Abschlusskriterien

- Der Hook lehnt einen Commit mit `console.log` in einer `.js`-Datei zuverlässig ab.
- Der Hook lässt einen Commit ohne `console.log` unverändert durch.
- Kein `console.log`-Rückstand befindet sich in der finalen Historie.

## Erweiterung (optional)

Den Hook um eine zweite Prüfung ergänzen (z. B. Ablehnung, falls eine Datei die Zeichenfolge "TODO" enthält) und mit einem passenden Testfall bestätigen.

## Fallback

Funktioniert der Hook auf der eigenen Plattform nicht wie erwartet (z. B. Zeilenenden-Problem unter Windows ohne WSL): den Hook probeweise direkt mit `sh .git/hooks/pre-commit` ausführen, um die Skriptlogik unabhängig vom Git-Aufruf zu prüfen, und bei Bedarf `#!/usr/bin/env sh` als Shebang verwenden.
