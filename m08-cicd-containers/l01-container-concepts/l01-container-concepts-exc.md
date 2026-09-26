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
6. Eine Tabelle erstellen: Befehl, beobachtete Ausgabe (kurz zusammengefasst), zugeordneter Begriff (Image, Container oder Registry).

## Beobachtbares Ergebnis

Eine ausgefüllte Tabelle mit vier Zeilen (je einer pro Befehl aus Aufgabe 2-5), die die tatsächlich beobachtete Ausgabe korrekt einem der drei Begriffe zuordnet.

## Abschlusskriterien

- Jede der vier Zeilen nennt einen konkreten, tatsächlich beobachteten Ausgabe-Bestandteil, keine allgemeine Beschreibung.
- Der Unterschied zwischen `docker images` (Image) und `docker ps -a` (Container) ist in der Zuordnung korrekt erkennbar.
- `docker pull` ist korrekt der Registry zugeordnet, nicht dem Image selbst.

## Erweiterung (optional)

`docker run alpine:3.22 echo "Zweiter Lauf"` ein zweites Mal ausführen und mit `docker ps -a` bestätigen, dass nun zwei unterschiedliche, beendete Container aus demselben Image existieren.

## Fallback

Ohne lokale Docker-Installation: die in der Lösung dokumentierten Beispiel-Ausgaben als Grundlage für die Zuordnungstabelle verwenden, anstelle tatsächlich selbst ausgeführter Befehle.
