# Lab 1.2 - Lösung: Git einrichten und ersten Commit erstellen

## Aufgabe 1: Git-Autor konfigurieren

```bash
git config --global user.name "Vorname Nachname"
git config --global user.email "name@example.com"
```

Alternative für nur dieses eine Repository (nach Schritt 2 innerhalb des Ordners ausführen): dieselben Befehle ohne `--global`.

## Aufgabe 2: Ordner anlegen und Repository initialisieren

```bash
mkdir teamsite
cd teamsite
git init
```

Erwartete Ausgabe (sinngemäß): `Initialized empty Git repository in .../teamsite/.git/`.

## Aufgabe 3: Startdateien kopieren

Die vier Dateien `index.html`, `styles.css`, `script.js`, `notes-todo.txt` aus `project/starter/` (oder aus dem Fallback-Abschnitt der Übung) in den `teamsite`-Ordner kopieren.

## Aufgabe 4: Stagen und Status prüfen

```bash
git add .
git status
```

Erwartete Ausgabe: vier Dateien unter "Changes to be committed", keine weiteren offenen Änderungen.

## Aufgabe 5: Commit erstellen

```bash
git commit -m "Erste Version der Kodschul Team Site"
```

## Aufgabe 6: Ergebnis prüfen

```bash
git log
git log --stat
```

`git log` zeigt genau einen Commit mit dem konfigurierten Autor-Namen und der Nachricht "Erste Version der Kodschul Team Site". `git log --stat` listet alle vier Dateien mit ihrer jeweiligen Zeilenzahl unter diesem Commit.

## Erweiterung (Beispielantwort)

`git log --stat` zeigt für jede Datei eine Zeile wie `index.html | 15 +++++++++++++++`, wobei die Zahl der `+`-Zeichen die Anzahl hinzugefügter Zeilen widerspiegelt - bei einem ersten Commit sind alle Zeilen Hinzufügungen.

## Häufige Stolperfalle

Fehlt die Konfiguration aus Aufgabe 1 vollständig, bricht `git commit` je nach Git-Version mit einer Fehlermeldung ("Please tell me who you are") ab, oder erzeugt einen Commit mit unbrauchbarem Platzhalter-Autor. In beiden Fällen: Konfiguration nachholen und den Commit mit `git commit --amend --reset-author` korrigieren (dieser Befehl wird in Modul 2 vertieft).
