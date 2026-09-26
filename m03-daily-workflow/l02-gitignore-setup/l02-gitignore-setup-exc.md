# Lab 3.2 - Übung: Build-Artefakte mit `.gitignore` ausschließen

Diese Übung simuliert einen generierten Build-Ordner im `teamsite`-Repository und schließt ihn aus der Versionskontrolle aus.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Modul 2, sauberes Arbeitsverzeichnis.

## Aufgaben

1. Einen Ordner `build/` mit einer Datei `build/output.txt` (beliebiger Platzhalterinhalt) anlegen, um einen generierten Build-Ausgabe-Ordner zu simulieren.
2. Mit `git status` bestätigen, dass `build/` als "untracked" erscheint.
3. Eine Datei `.gitignore` anlegen und den Eintrag `build/` ergänzen.
4. Mit `git status` bestätigen, dass `build/` nicht mehr angezeigt wird.
5. `.gitignore` stagen und committen.
6. Testen, was passiert, wenn `build/` versehentlich bereits vorher committet worden wäre: probeweise `git add -f build/output.txt` ausführen (erzwingt das Hinzufügen trotz `.gitignore`), den Effekt beobachten, und die Datei anschließend mit `git rm --cached build/output.txt` wieder aus der Versionskontrolle entfernen, ohne sie lokal zu löschen.

## Beobachtbarer Checkpoint

`git status` zeigt nach Abschluss ein sauberes Arbeitsverzeichnis; `build/output.txt` existiert weiterhin lokal, ist aber nicht Teil der Versionskontrolle.

## Abschlusskriterien

- `.gitignore` enthält den Eintrag `build/` und ist selbst committet.
- `build/output.txt` erscheint in keinem `git status`-Aufruf mehr als "untracked" oder "staged".
- Die Datei ist nach Aufgabe 6 lokal weiterhin vorhanden.

## Erweiterung (optional)

Einen zusätzlichen `.gitignore`-Eintrag `*.tmp` ergänzen und mit einer selbst angelegten `scratch.tmp`-Datei testen, ob sie ebenfalls ignoriert wird.

## Fallback

Bei Unsicherheit bei Aufgabe 6: den Test überspringen und direkt mit einer nicht versionierten `build/output.txt` fortfahren - das Kernziel (funktionierende `.gitignore`-Regel) bleibt dadurch erreichbar.
