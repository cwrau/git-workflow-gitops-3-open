# Lab 7.1 - Lösung: Lokalen Git-Hook einrichten

## Aufgabe 1-2: Hook anlegen

`.git/hooks/pre-commit`:

```sh
#!/bin/sh
if grep -r "console.log" --include="*.js" .; then
  echo "Commit abgelehnt: console.log gefunden."
  exit 1
fi
exit 0
```

```bash
chmod +x .git/hooks/pre-commit
```

## Aufgabe 3: Fehlschlagenden Commit provozieren

```bash
# app.js: eine Zeile "console.log('test');" ergänzen
git add app.js
git commit -m "Test-Commit mit console.log"
```

Erwartete Ausgabe: der Hook gibt "Commit abgelehnt: console.log gefunden." aus, der Commit wird nicht erstellt; `git log -1` zeigt weiterhin den vorherigen Commit.

## Aufgabe 4: Erfolgreicher Commit

```bash
# console.log-Zeile wieder entfernen
git add app.js
git commit -m "app.js unverändert lassen (Hook-Test)"
```

Der Hook findet keinen Treffer, gibt keine Ausgabe aus und der Commit wird normal erstellt.

## Erweiterung (Beispielantwort)

```sh
#!/bin/sh
if grep -r "console.log" --include="*.js" .; then
  echo "Commit abgelehnt: console.log gefunden."
  exit 1
fi
if grep -rn "TODO" --include="*.js" --include="*.html" .; then
  echo "Commit abgelehnt: TODO-Kommentar gefunden."
  exit 1
fi
exit 0
```

Ein Testfall mit einem `<!-- TODO: prüfen -->`-Kommentar in `index.html` wird durch die zweite Prüfung ebenfalls abgelehnt.

## Grenzen dieses Hooks

Der Hook prüft nur Dateien im aktuellen Arbeitsverzeichnis, unabhängig vom Staging-Status - eine gestagte, aber im Arbeitsverzeichnis bereits wieder entfernte `console.log`-Zeile würde fälschlich nicht erkannt. Für eine präzisere Prüfung nur gestageter Änderungen wäre `git diff --cached` statt `grep -r .` die genauere Grundlage.
