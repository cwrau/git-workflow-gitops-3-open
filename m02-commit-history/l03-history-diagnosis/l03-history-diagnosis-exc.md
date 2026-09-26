# Lab 2.3 - Übung: Fehlerhafte Commit-Historie diagnostizieren

Diese Übung setzt zunächst zwei absichtlich unsaubere Commits im Referenzprojekt und bereinigt sie anschließend.

## Ausgangslage

Das `teamsite`-Repository im Stand nach Lab 2.2 (sechs Commits, sauberes Arbeitsverzeichnis).

## Aufgaben

1. Zwei absichtlich unsaubere Commits erzeugen:

   ```bash
   # app.js: eine Zeile "console.log('debug', greeting);" nach der bestehenden Logik ergaenzen
   git add app.js
   git commit -m "wip"

   echo "temp" > scratch.tmp
   git add scratch.tmp
   git commit -m "asdf"
   ```

2. Mit `git log --oneline` die beiden unklaren Commits identifizieren.
3. Mit `git show HEAD~1` und `git show HEAD` den tatsächlichen Inhalt beider Commits klären und in 1-2 Sätzen je Commit notieren, was passiert ist.
4. Beide Commits mit `git reset --soft HEAD~2` zurücknehmen.
5. Den Debug-Rückstand (`console.log`-Zeile) aus `app.js` entfernen und `scratch.tmp` löschen.
6. Die verbleibende, sinnvolle Änderung (falls vorhanden) mit einer klaren Nachricht in einem Commit speichern; ist nach dem Aufräumen keine sinnvolle Änderung mehr übrig, mit `git status` bestätigen, dass das Arbeitsverzeichnis wieder dem Stand vor Aufgabe 1 entspricht.

## Beobachtbarer Checkpoint

`git log --oneline` zeigt keine Commits mit den Nachrichten "wip" oder "asdf" mehr; `app.js` enthält keinen `console.log`-Aufruf; `scratch.tmp` existiert nicht.

## Abschlusskriterien

- Historie ist frei von den beiden unsauberen Commits.
- `app.js` entspricht wieder dem funktionalen Stand ohne Debug-Ausgabe.
- `scratch.tmp` ist weder im Arbeitsverzeichnis noch in der Historie vorhanden.

## Erweiterung (optional)

Vor dem Zurücknehmen mit `git diff HEAD~2 HEAD` den kombinierten Diff beider unsauberen Commits in einem Schritt ansehen und mit den beiden Einzel-Diffs aus Aufgabe 3 vergleichen.

## Fallback

Bei Unsicherheit, ob nach dem Aufräumen noch eine sinnvolle Änderung übrig bleibt: `git diff` vor dem finalen Commit prüfen; ist die Ausgabe leer, ist kein weiterer Commit nötig, und der Stand entspricht wieder Lab 2.2.
