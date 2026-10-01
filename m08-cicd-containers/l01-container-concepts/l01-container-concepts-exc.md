# Lab 8.1 - Übung: Docker-Grundbegriffe anhand ausgeführter Befehle zuordnen

Diese Übung nutzt eine lokale Docker-Installation, unabhängig vom `teamsite`-Repository.

## Ausgangslage

Eine funktionsfähige lokale Docker-Installation (`docker --version` liefert eine Versionsnummer).

## Aufgaben

1. `docker --version` ausführen und die Ausgabe notieren.
2. `docker pull alpine:3.22` ausführen und beobachten, welche Schritte (Layer-Download) in der Ausgabe erscheinen.
3. `docker images` ausführen und bestätigen, dass `alpine` in der lokalen Image-Liste erscheint.
4. `docker run alpine:3.22 echo "Hallo aus dem Container"` ausführen und die Ausgabe notieren.
5. `docker ps -a` ausführen und den soeben beendeten Container in der Liste identifizieren.

## Beobachtbares Ergebnis

`docker images` listet `alpine`; `docker ps -a` zeigt den beendeten Container mit Status "Exited".

## Abschlusskriterien

- Der Unterschied zwischen `docker images` (Image) und `docker ps -a` (Container) ist an der Ausgabe erklärbar.
- `docker pull` lädt aus der Registry, nicht aus dem lokalen Image.

## Erweiterung (optional)

`docker run alpine:3.22 echo "Zweiter Lauf"` ein zweites Mal ausführen und mit `docker ps -a` bestätigen, dass nun zwei unterschiedliche, beendete Container aus demselben Image existieren.

## Fallback

Ohne lokale Docker-Installation: die in der Lösung dokumentierten Beispiel-Ausgaben anstelle tatsächlich selbst ausgeführter Befehle verwenden.
