# Lab 2.2 - Übung: Fehler mit `commit --amend` und `reset` beheben

Diese Übung arbeitet im Repository der Kodschul Team Site (Stand nach Modul 1: `project/checkpoints/after-m1/`).

## Ausgangslage

Das `teamsite`-Repository mit vier Commits aus Modul 1, sauberem Arbeitsverzeichnis.

## Aufgaben

1. In `team.html` einen weiteren Listenpunkt für ein viertes Teammitglied ergänzen (z. B. "Team-Mitglied D - Qualitätssicherung").
2. Die Änderung committen, dabei absichtlich eine unpräzise Nachricht verwenden (z. B. "update").
3. Die Nachricht mit `git commit --amend` auf eine aussagekräftige Beschreibung korrigieren, ohne einen neuen Commit zu erzeugen.
4. In `index.html` das Copyright-Jahr im Fußbereich ergänzen (z. B. `<p>&copy; 2026</p>` vor `</main>` einfügen) und direkt committen, dabei versehentlich vergessen, dass auch `styles.css` eine kleine Anpassung (z. B. eine zusätzliche Regel für die neue Fußzeile) enthalten sollte.
5. Den Commit aus Aufgabe 4 mit `git reset --soft HEAD~1` zurücknehmen, die passende CSS-Regel ergänzen, beide Dateien stagen und in einem sauberen Commit zusammenfassen.
6. Mit `git log --oneline` die finale Historie prüfen.

## Beobachtbarer Checkpoint

`git log --oneline` zeigt sechs Commits insgesamt; keiner trägt die Nachricht "update"; der Commit zur Fußzeile enthält sowohl die HTML- als auch die CSS-Änderung.

## Abschlusskriterien

- Die Team-Bio-Ergänzung ist als ein Commit mit aussagekräftiger Nachricht vorhanden, nicht als "update".
- Fußzeilen-HTML und zugehöriges CSS sind im selben Commit enthalten.
- `git status` meldet ein sauberes Arbeitsverzeichnis.

## Erweiterung (optional)

Mit `git reset --mixed HEAD~1` (statt `--soft`) denselben letzten Commit versuchsweise zurücknehmen und beobachten, dass die Änderungen danach ungestaged, aber weiterhin vorhanden sind - anschließend erneut stagen und committen.

## Fallback

Ohne Zugriff auf den eigenen Verlauf aus Modul 1: mit `project/checkpoints/after-m1/` neu beginnen und dort ein frisches Repository mit einem einzigen Ausgangscommit anlegen, bevor Aufgabe 1 beginnt.
