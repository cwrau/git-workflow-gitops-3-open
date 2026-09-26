# Lab 3.3 - Übung: Unfertige Änderungen mit `git stash` sichern

Diese Übung simuliert einen Kontextwechsel während einer unfertigen Änderung im `teamsite`-Repository.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Lab 3.2, sauberes Arbeitsverzeichnis.

## Aufgaben

1. In `index.html` eine unfertige Änderung beginnen (z. B. einen neuen Abschnitt `<section>` mit dem Platzhaltertext "TODO: Ankündigung ergänzen" einfügen), aber nicht committen.
2. Die unfertige Änderung mit `git stash` beiseitelegen und mit `git status` bestätigen, dass das Arbeitsverzeichnis wieder sauber ist.
3. Eine unabhängige, dringende Korrektur vornehmen: in `styles.css` einen Tippfehler in einem Farbwert korrigieren (z. B. `#1c3d5a` prüfen und bei Bedarf einen bewusst eingebauten Fehler wie `#1c3d5` auf den korrekten Wert zurücksetzen) und diese Korrektur committen.
4. Mit `git stash list` bestätigen, dass die unfertige Änderung weiterhin gesichert ist.
5. Mit `git stash pop` die unfertige Änderung wiederherstellen und mit `git diff` bestätigen, dass exakt die ursprüngliche Änderung zurückkommt.
6. Die wiederhergestellte Änderung fertigstellen (Platzhaltertext durch einen kurzen, sinnvollen Ankündigungstext ersetzen) und committen.

## Beobachtbarer Checkpoint

`git stash list` ist nach Aufgabe 6 leer; `git log --oneline` enthält sowohl die Farbkorrektur als auch die fertiggestellte Ankündigung als zwei getrennte Commits.

## Abschlusskriterien

- Die dringende Farbkorrektur ist als eigener Commit vorhanden, unabhängig von der Ankündigung.
- Die Ankündigung ist vollständig (kein "TODO"-Platzhaltertext mehr) und committet.
- Kein Stash-Eintrag bleibt offen zurück.

## Erweiterung (optional)

Zwei unfertige Änderungen nacheinander stashen (`git stash` zweimal mit unterschiedlichen Änderungen) und anschließend gezielt mit `git stash pop stash@{1}` den älteren statt den neueren Eintrag zuerst wiederherstellen.

## Fallback

Tritt beim `git stash pop` ein Konflikt auf (z. B. weil dieselbe Zeile in Aufgabe 3 und Aufgabe 1 verändert wurde): den Konflikt in der betroffenen Datei manuell auflösen (Konfliktmarkierungen entfernen, gewünschten Inhalt behalten), dann `git add` und den Stash-Eintrag mit `git stash drop` entfernen, da `pop` bei einem Konflikt den Eintrag nicht automatisch löscht.
