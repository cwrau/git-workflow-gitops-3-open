# Lab 1.3 - Lösung: Commit-Historie um Datei-Operationen erweitern

## Aufgabe 1: Umbenennen

```bash
git mv script.js app.js
```

In `index.html` die Zeile `<script src="script.js"></script>` zu `<script src="app.js"></script>` ändern.

```bash
git add index.html
git commit -m "app.js statt script.js als Namenskonvention nutzen"
```

## Aufgabe 2: Team-Seite hinzufügen

`team.html` mit dem in der Übung angegebenen Inhalt anlegen. In `index.html` die Navigation um `<a href="team.html">Team</a>` ergänzen.

```bash
git add team.html index.html
git commit -m "Team-Seite hinzufuegen"
```

## Aufgabe 3: Aufräumen

```bash
git rm notes-todo.txt
git commit -m "Entwurfsnotiz entfernen"
```

## Aufgabe 4 und 5: Historie und Status prüfen

```bash
git log --oneline
```

Erwartete Ausgabe (Reihenfolge neueste zuerst, Hashes exemplarisch):

```text
d4e5f6a Entwurfsnotiz entfernen
c3d4e5f Team-Seite hinzufuegen
b2c3d4e app.js statt script.js als Namenskonvention nutzen
a1b2c3d Erste Version der Kodschul Team Site
```

```bash
git status
```

Erwartete Ausgabe: "nothing to commit, working tree clean".

## Endstand der Dateien

Der finale Stand entspricht `project/checkpoints/after-m1/`: `index.html` (mit `app.js`-Referenz und Team-Link), `styles.css`, `app.js`, `team.html`. `script.js` und `notes-todo.txt` existieren nicht mehr.

## Erweiterung (Beispielantwort)

```markdown
# Kodschul Team Site

Kleine statische Team-Seite mit Startseite und Team-Übersicht.
```

```bash
git add README.md
git commit -m "README hinzufuegen"
```

## Häufige Stolperfalle

Werden alle drei Änderungen (Umbenennen, neue Seite, Löschen) versehentlich in einem einzigen Commit zusammengefasst, lässt sich später keine der drei Änderungen isoliert zurücknehmen. Bereits gestagte, aber noch nicht commitete Änderungen lassen sich mit `git restore --staged <datei>` einzeln wieder aus dem Staging-Bereich nehmen, um sie in getrennte Commits aufzuteilen.
