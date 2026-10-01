# Lab 7.2 - Übung: Commit-Vorlage einrichten

Diese Übung nutzt weiterhin das `teamsite`-Repository.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Lab 7.1, sauberes Arbeitsverzeichnis.

## Aufgaben

1. Eine Datei `.gitmessage.txt` im Repository-Wurzelverzeichnis mit einer dreiteiligen Vorlage anlegen (Kurzbeschreibung, Grund, Testnachweis - siehe Beispiel in der Theorie).
2. Die Vorlage lokal für dieses Repository mit `git config commit.template .gitmessage.txt` aktivieren.
3. Eine kleine Änderung vornehmen (z. B. einen weiteren Absatz in `index.html` ergänzen) und mit `git commit` (ohne `-m`) einen Commit über den Editor erstellen, dabei alle drei Vorlagenabschnitte ausfüllen.
4. Eine zweite kleine Änderung vornehmen und stattdessen mit `git commit -m "..."` committen; beobachten, dass der Editor nicht öffnet und die Vorlage nicht verwendet wird.

## Beobachtbarer Checkpoint

Der Commit aus Aufgabe 3 enthält alle drei ausgefüllten Vorlagenabschnitte ohne verbleibende `#`-Kommentarzeilen; der Commit aus Aufgabe 4 enthält nur die kurze `-m`-Nachricht.

## Abschlusskriterien

- `.gitmessage.txt` ist committet und Teil des Repositorys.
- Der editorgestützte Commit folgt sichtbar der Vorlagenstruktur.
- Der `-m`-Commit aus Aufgabe 4 enthält keinen Vorlagentext.

## Erweiterung (optional)

Die Vorlage global (`--global` statt ohne Zusatz) für ein separates, testweise angelegtes Repository aktivieren und bestätigen, dass sie dort ebenfalls greift, während sie im `teamsite`-Repository weiterhin die lokale Version verwendet, falls dort eine eigene gesetzt wurde.

## Fallback

Ohne konfigurierten Standard-Editor für `git commit`: `git config --global core.editor "nano"` (oder ein anderer verfügbarer Editor) vorab setzen, bevor Aufgabe 3 begonnen wird.
