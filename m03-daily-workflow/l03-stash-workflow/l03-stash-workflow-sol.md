# Lab 3.3 - Lösung: Unfertige Änderungen mit `git stash` sichern

## Aufgabe 1-2: Unfertige Änderung stashen

```bash
# index.html: <section><p>TODO: Ankuendigung ergaenzen</p></section> vor </main> einfuegen
git stash
git status
```

Erwartete Ausgabe: "nothing to commit, working tree clean" - die unfertige Änderung ist gesichert, aber nicht mehr im Arbeitsverzeichnis sichtbar.

## Aufgabe 3: Dringende Korrektur

```bash
# styles.css: Farbwert auf #1c3d5a korrigieren
git add styles.css
git commit -m "Farbwert im Header korrigieren"
```

## Aufgabe 4: Stash-Liste prüfen

```bash
git stash list
```

Erwartete Ausgabe: genau ein Eintrag, z. B. `stash@{0}: WIP on main: ...`.

## Aufgabe 5: Wiederherstellen

```bash
git stash pop
git diff
```

`git diff` zeigt exakt die `<section>`-Änderung aus Aufgabe 1, unverändert gegenüber dem Stand vor dem Stash.

## Aufgabe 6: Fertigstellen

```bash
# Platzhaltertext ersetzen, z. B. "Neuer Blogbeitrag zur Testautomatisierung online."
git add index.html
git commit -m "Ankuendigungsbereich auf der Startseite ergaenzen"
```

## Abschließende Prüfung

```bash
git stash list   # leer
git log --oneline -2
```

Die letzten beiden Commits zeigen "Ankuendigungsbereich auf der Startseite ergaenzen" und "Farbwert im Header korrigieren" als getrennte, unabhängige Änderungen.

## Erweiterung (Beispielantwort)

```bash
git stash        # erste unfertige Aenderung
# weitere unfertige Aenderung vornehmen
git stash        # zweite unfertige Aenderung
git stash list   # zeigt stash@{0} (neueste) und stash@{1} (aeltere)
git stash pop stash@{1}
```

`stash@{1}` wird explizit adressiert und dadurch vor `stash@{0}` wiederhergestellt - ohne die Angabe würde `git stash pop` immer zuerst den neuesten Eintrag (`stash@{0}`) verwenden.

## Häufige Stolperfalle

Bleibt nach mehreren Arbeitssitzungen ein Stash-Eintrag unbeachtet liegen, geht die darin enthaltene Änderung nicht automatisch verloren, wird aber leicht vergessen. `git stash list` regelmäßig zu prüfen, verhindert das Anhäufen vergessener Zwischenstände.
