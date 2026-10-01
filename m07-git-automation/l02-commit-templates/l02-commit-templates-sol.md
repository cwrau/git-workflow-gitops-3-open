# Lab 7.2 - Lösung: Commit-Vorlage einrichten

## Aufgabe 1: Vorlage anlegen

`.gitmessage.txt`:

```text
# Kurzbeschreibung (max. 50 Zeichen)

# Warum ist diese Änderung nötig?

# Wie wurde sie getestet/geprüft?
```

## Aufgabe 2: Aktivieren

```bash
git config commit.template .gitmessage.txt
```

## Aufgabe 3: Editorgestützter Commit (Beispielantwort)

```text
Absatz zur nächsten Team-Veranstaltung ergänzen

Teilnehmende sollen das Datum direkt auf der Startseite finden,
ohne eine separate Ankündigung suchen zu müssen.

Manuell im Browser geprüft: Absatz erscheint unterhalb der
bestehenden Ankündigung, Layout bleibt unverändert.
```

## Aufgabe 4: `-m`-Commit

```bash
git add index.html
git commit -m "Layout-Detail anpassen"
```

Mit `-m` öffnet sich kein Editor, die Vorlage kommt nicht zum Einsatz: Die Nachricht enthält ausschließlich die kurze Zusammenfassung ohne Begründung oder Prüfnachweis.

## Erweiterung (Beispielantwort)

```bash
git config --global commit.template ~/.gitmessage-global.txt
```

Im `teamsite`-Repository greift weiterhin die lokal gesetzte `.gitmessage.txt` (lokale Konfiguration hat Vorrang vor globaler); ein neu angelegtes Repository ohne eigene lokale Einstellung verwendet dagegen automatisch die globale Vorlage.
