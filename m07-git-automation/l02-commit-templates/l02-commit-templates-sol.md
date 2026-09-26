# Lab 7.2 - Lösung: Commit-Vorlage einrichten

## Aufgabe 1: Vorlage anlegen

`.gitmessage.txt`:

```text
# Kurzbeschreibung (max. 50 Zeichen)

# Warum ist diese Aenderung noetig?

# Wie wurde sie getestet/geprueft?
```

## Aufgabe 2: Aktivieren

```bash
git config commit.template .gitmessage.txt
```

## Aufgabe 3: Editorgestützter Commit (Beispielantwort)

```text
Absatz zur naechsten Team-Veranstaltung ergaenzen

Teilnehmende sollen das Datum direkt auf der Startseite finden,
ohne eine separate Ankuendigung suchen zu muessen.

Manuell im Browser geprueft: Absatz erscheint unterhalb der
bestehenden Ankuendigung, Layout bleibt unveraendert.
```

## Aufgabe 4: `-m`-Commit

```bash
git add index.html
git commit -m "Layout-Detail anpassen"
```

## Aufgabe 5: Vergleich

```bash
git log -2
```

Der editorgestützte Commit aus Aufgabe 3 enthält drei klar getrennte Informationsblöcke (was, warum, wie geprüft); der `-m`-Commit aus Aufgabe 4 enthält ausschließlich eine kurze Zusammenfassung ohne Begründung oder Prüfnachweis - für eine spätere Nachvollziehbarkeit liefert die Vorlage deutlich mehr Kontext.

## Erweiterung (Beispielantwort)

```bash
git config --global commit.template ~/.gitmessage-global.txt
```

Im `teamsite`-Repository greift weiterhin die lokal gesetzte `.gitmessage.txt` (lokale Konfiguration hat Vorrang vor globaler); ein neu angelegtes Repository ohne eigene lokale Einstellung verwendet dagegen automatisch die globale Vorlage.
