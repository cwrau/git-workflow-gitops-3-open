# Lab 2.3 - Lösung: Fehlerhafte Commit-Historie diagnostizieren

## Aufgabe 1: Unsaubere Commits erzeugen

Wie in der Übung beschrieben: ein `console.log`-Aufruf in `app.js` (Commit "wip") und eine Datei `scratch.tmp` (Commit "asdf").

## Aufgabe 2-3: Diagnose

```bash
git log --oneline
git show HEAD~1
git show HEAD
```

- `HEAD~1` ("wip"): fügt der Datei `app.js` eine zusätzliche `console.log`-Zeile zu Diagnosezwecken hinzu - kein funktionaler Wert für die veröffentlichte Seite.
- `HEAD` ("asdf"): legt eine neue Datei `scratch.tmp` mit dem Inhalt "temp" an - eine Testdatei ohne Bezug zur Site.

## Aufgabe 4-6: Bereinigen

```bash
git reset --soft HEAD~2
```

`git status` zeigt danach `app.js` als geändert (gestaged) und `scratch.tmp` als neue Datei (gestaged).

```bash
# console.log-Zeile aus app.js wieder entfernen
rm scratch.tmp
git add app.js
git status
```

Nach dem Entfernen des Debug-Rückstands entspricht `app.js` wieder exakt dem Stand vor Aufgabe 1; `scratch.tmp` ist gelöscht und nicht mehr gestaged. `git status` meldet ein sauberes Arbeitsverzeichnis ohne offene Änderungen - ein zusätzlicher Commit ist in diesem Fall nicht nötig, da keine gewollte Änderung übrig bleibt.

## Erweiterung (Beispielantwort)

`git diff HEAD~2 HEAD` zeigt beide Änderungen (die `console.log`-Zeile und die neue Datei `scratch.tmp`) in einem gemeinsamen Diff - inhaltlich identisch zur Summe der beiden Einzel-Diffs aus Aufgabe 3, nur ohne die Trennung nach einzelnen Commits.

## Limitierung

Dieses Vorgehen mit `reset --soft` funktioniert nur für Commits, die lokal geblieben sind. Wären "wip" und "asdf" bereits an ein gemeinsames Repository gepusht worden, würde ihr Zurücknehmen die Historie anderer Personen widersprüchlich machen (Thema Modul 5/6).
