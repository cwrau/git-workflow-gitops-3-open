# Lab 3.2 - Lösung: Build-Artefakte mit `.gitignore` ausschließen

## Aufgabe 1-2: Build-Ordner simulieren

```bash
mkdir build
echo "generierte Ausgabe" > build/output.txt
git status
```

Erwartete Ausgabe: `build/` erscheint unter "Untracked files".

## Aufgabe 3-5: `.gitignore` einrichten

```bash
echo "build/" > .gitignore
git status
```

`build/` erscheint nicht mehr in der Ausgabe.

```bash
git add .gitignore
git commit -m ".gitignore fuer Build-Ordner ergaenzen"
```

## Aufgabe 6: Nachträgliches Entfernen simulieren

```bash
git add -f build/output.txt
git status
```

`build/output.txt` erscheint trotz `.gitignore` als gestaged, da `-f` die Regel erzwungen überschreibt (simuliert den Fall "versehentlich bereits committet").

```bash
git rm --cached build/output.txt
git status
```

Die Datei ist nicht mehr gestaged und erscheint danach auch nicht mehr als "untracked", da `.gitignore` erneut greift. `ls build/` zeigt, dass `output.txt` lokal weiterhin existiert.

## Erweiterung (Beispielantwort)

```bash
echo "*.tmp" >> .gitignore
echo "test" > scratch.tmp
git status
```

`scratch.tmp` erscheint nicht in der Ausgabe - die Musterregel `*.tmp` greift unabhängig vom konkreten Dateinamen.

## Grenzen von `.gitignore`

Eine bereits vor der `.gitignore`-Regel *tatsächlich* committete Datei (ohne den erzwungenen `-f`-Testschritt) bleibt Teil der Historie, bis sie explizit mit `git rm --cached` entfernt und der Commit erneut gespeichert wird - `.gitignore` verhindert nur zukünftiges, nicht rückwirkendes Tracking.
