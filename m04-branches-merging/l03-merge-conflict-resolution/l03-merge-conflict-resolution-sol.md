# Lab 4.3 - Lösung: Merge-Konflikt herbeiführen und auflösen

## Aufgabe 1: Änderung auf Feature-Branch

```bash
git switch -c feature/portal-title
# index.html: <h1>Kodschul Team Site</h1> -> <h1>Kodschul Team Portal</h1>
git add index.html
git commit -m "Titel zu Team Portal aendern"
```

## Aufgabe 2: Konkurrierende Änderung auf `main`

```bash
git switch main
# index.html: <h1>Kodschul Team Site</h1> -> <h1>Kodschul Team Site - Uebersicht</h1>
git add index.html
git commit -m "Titel um Uebersicht ergaenzen"
```

## Aufgabe 3: Merge und Konflikt

```bash
git merge feature/portal-title
git status
```

`git status` zeigt `index.html` unter "Unmerged paths"; die Datei enthält die drei Konfliktmarkierungen aus der Theorie.

## Aufgabe 4-5: Auflösen

```html
<h1>Kodschul Team Portal - Uebersicht</h1>
```

```bash
git add index.html
git commit -m "Merge-Konflikt bei der Ueberschrift aufloesen: Portal- und Uebersicht-Formulierung kombinieren"
```

## Aufgabe 6: Dokumentation (Beispielantwort)

Beide Formulierungen enthielten einen eigenständigen, sinnvollen Zusatz zum ursprünglichen Titel; statt eine der beiden Varianten zu verwerfen, wurden sie zu "Kodschul Team Portal - Uebersicht" kombiniert, um keine der beiden ursprünglichen Absichten zu verlieren.

## Aufgabe 7: Aufräumen

```bash
git branch -d feature/portal-title
```

## Prüfung

```bash
git log --oneline --graph
```

Zeigt einen Merge-Commit mit zwei Elternteilen (den Commits von `main` und `feature/portal-title`) sowie der Nachricht aus Aufgabe 5.

## Erweiterung (Beispielantwort)

Ein `git diff` innerhalb einer Konfliktdatei zeigt vor der Bereinigung zusätzlich beide konkurrierenden Versionen mit speziellen Diff-Markierungen für Merge-Konflikte (`diff --cc`) statt eines einzelnen Vorher/Nachher-Vergleichs - das unterscheidet sich sichtbar von einem gewöhnlichen Zwei-Versionen-Diff.

## Häufige Stolperfalle

Werden nur einzelne Konfliktmarkierungen entfernt, aber nicht alle (z. B. `=======` versehentlich stehen gelassen), enthält die Datei danach fehlerhaftes HTML. `git diff` nach der Bereinigung, aber vor `git add`, zeigt zuverlässig, ob noch Markierungszeichen übrig sind.
