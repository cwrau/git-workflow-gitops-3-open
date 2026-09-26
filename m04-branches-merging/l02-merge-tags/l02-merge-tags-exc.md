# Lab 4.2 - Übung: Branches taggen, löschen und konfliktfrei zusammenführen

Diese Übung nutzt die beiden Branches aus Lab 4.1.

## Ausgangslage

Das `teamsite`-Repository mit den Branches `feature/nav-highlight` und `feature/footer-tweak`, beide noch ohne eigene Commits.

## Aufgaben

1. Auf `feature/nav-highlight` wechseln, in `styles.css` eine Hover-Farbe für Navigationslinks ergänzen (z. B. `nav a:hover { color: #ffd166; }`), committen.
2. Auf `feature/footer-tweak` wechseln, in `index.html` den Fußzeilentext um einen kurzen Zusatz ergänzen (z. B. "Alle Rechte vorbehalten." nach dem Copyright-Jahr), committen.
3. Auf `main` wechseln und beide Branches nacheinander mergen.
4. Den resultierenden Stand mit `git tag v0.1` markieren.
5. Beide gemergten Branches mit `git branch -d` löschen.
6. Mit `git log --oneline --graph` bestätigen, dass beide Änderungen in `main` enthalten sind, und mit `git tag` bestätigen, dass `v0.1` existiert.

## Beobachtbarer Checkpoint

`git branch` zeigt nach Aufgabe 5 nur noch `main`; `styles.css` enthält die Hover-Regel, `index.html` enthält den erweiterten Fußzeilentext; `git tag` listet `v0.1`.

## Abschlusskriterien

- Beide Merges erfolgten ohne Konfliktmeldung.
- Beide Feature-Branches sind gelöscht.
- `v0.1` zeigt auf denselben Commit wie der aktuelle Stand von `main`.

## Erweiterung (optional)

Mit `git show v0.1` prüfen, dass sich der Tag auf genau den erwarteten Commit bezieht, und mit `git log --oneline --graph --all` bestätigen, dass keine gelöschten Branch-Namen mehr in der Grafik erscheinen.

## Fallback

Meldet `git merge` unerwartet einen Konflikt (z. B. weil versehentlich dieselbe Zeile in beiden Branches verändert wurde): den Merge mit `git merge --abort` zurücknehmen, die betroffene Änderung auf einem der beiden Branches an eine andere Stelle verschieben und erneut versuchen.
