# Lab 4.1 - Lösung: Branches erstellen, wechseln und vergleichen

## Aufgabe 1-2: Branches anlegen und prüfen

```bash
git branch feature/nav-highlight
git branch feature/footer-tweak
git branch -v
```

Erwartete Ausgabe: alle drei Branches (`main`, `feature/nav-highlight`, `feature/footer-tweak`) zeigen denselben Commit-Hash und dieselbe Nachricht.

## Aufgabe 3: Wechseln

```bash
git switch feature/nav-highlight
git branch   # * feature/nav-highlight

git switch feature/footer-tweak
git branch   # * feature/footer-tweak

git switch main
git branch   # * main
```

## Aufgabe 4: Gemeinsame Visualisierung

```bash
git log --oneline --graph --all
```

Erwartete Ausgabe: eine einzige Zeile pro vorhandenem Commit, mit allen drei Branch-Namen in Klammern hinter demselben Commit-Hash.

## Aufgabe 5: Erklärung

Die Grafik zeigt keine Verzweigung, weil noch kein Branch einen eigenen Commit erhalten hat - alle drei Zeiger verweisen weiterhin auf denselben Commit. Eine sichtbare Verzweigung entsteht erst, sobald mindestens ein Branch einen Commit erhält, den die anderen nicht haben (Thema Lab 4.2).

## Erweiterung (Beispielantwort)

```bash
git switch -c feature/social-links
git branch   # * feature/social-links
```

`git switch -c` kombiniert `git branch feature/social-links` und `git switch feature/social-links` in einem Aufruf und wechselt direkt in den neuen Branch.
