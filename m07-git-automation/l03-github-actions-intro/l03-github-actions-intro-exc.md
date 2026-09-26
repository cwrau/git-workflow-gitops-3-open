# Lab 7.3 - Übung: Ersten GitHub-Actions-Workflow anlegen

Diese Übung ergänzt das erste automatisierte Workflow und die erste öffentliche Veröffentlichung der Kodschul Team Site.

## Ausgangslage

Das `teamsite`-Repository, verbunden mit GitHub (Stand nach Modul 5/6), auf `main`, sauberes Arbeitsverzeichnis.

## Aufgaben

1. Den Ordner `.github/workflows/` anlegen und darin `lint.yml` mit dem in der Theorie gezeigten Inhalt erstellen.
2. `lint.yml` committen und nach `main` pushen.
3. Unter GitHub "Actions" bestätigen, dass der Workflow "Lint HTML" gelaufen ist und erfolgreich abgeschlossen wurde (grüner Haken).
4. Unter GitHub "Settings -> Pages" die Veröffentlichung aus dem `main`-Branch (Wurzelverzeichnis) aktivieren.
5. Nach einigen Minuten die zugewiesene GitHub-Pages-URL öffnen und bestätigen, dass die Startseite der Kodschul Team Site erreichbar ist.
6. In der Workflow-Datei den Trigger so erweitern, dass der Workflow zusätzlich bei jedem Pull Request läuft, falls das nicht bereits der Fall ist, und die Änderung committen.

## Beobachtbarer Checkpoint

GitHub "Actions" zeigt einen erfolgreichen Lauf von "Lint HTML"; die GitHub-Pages-URL zeigt die aktuelle Startseite der Kodschul Team Site.

## Abschlusskriterien

- `.github/workflows/lint.yml` ist committet und löst bei Push auf `main` einen Workflow-Lauf aus.
- Der Workflow-Lauf ist unter "Actions" als erfolgreich markiert.
- Die veröffentlichte GitHub-Pages-Seite zeigt den aktuellen Inhalt von `index.html`.

## Erweiterung (optional)

Einen zweiten, unabhängigen Step im selben Job ergänzen, der zusätzlich die Anzahl der `.html`-Dateien im Repository ausgibt (z. B. mit `find . -name "*.html" | wc -l`).

## Fallback

Ohne Berechtigung, GitHub Pages für das eigene Repository zu aktivieren: Aufgabe 4-5 überspringen und stattdessen den Workflow-Lauf aus Aufgabe 3 als alleinigen Nachweis der Automatisierung verwenden; die YAML-Struktur und der Lernwert für Modul 8 bleiben davon unberührt.
