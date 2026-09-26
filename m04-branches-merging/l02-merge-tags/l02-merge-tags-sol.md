# Lab 4.2 - Lösung: Branches taggen, löschen und konfliktfrei zusammenführen

## Aufgabe 1: Hover-Farbe

```bash
git switch feature/nav-highlight
```

```css
nav a:hover {
  color: #ffd166;
}
```

```bash
git add styles.css
git commit -m "Hover-Farbe fuer Navigationslinks ergaenzen"
```

## Aufgabe 2: Fußzeilentext

```bash
git switch feature/footer-tweak
```

```html
<p>&copy; 2026 - Alle Rechte vorbehalten.</p>
```

```bash
git add index.html
git commit -m "Fusszeilentext praezisieren"
```

## Aufgabe 3: Zusammenführen

```bash
git switch main
git merge feature/nav-highlight
git merge feature/footer-tweak
```

Beide Merges laufen ohne Konfliktmeldung durch, da unterschiedliche Dateien betroffen sind.

## Aufgabe 4-5: Markieren und aufräumen

```bash
git tag v0.1
git branch -d feature/nav-highlight feature/footer-tweak
```

## Aufgabe 6: Prüfen

```bash
git log --oneline --graph
git tag
```

`main` enthält beide neuen Commits; `git tag` listet `v0.1`.

## Erweiterung (Beispielantwort)

```bash
git show v0.1
```

Zeigt denselben Commit wie `git log -1` auf `main` zum Zeitpunkt der Markierung - `v0.1` bewegt sich auch dann nicht mit, wenn `main` später weitere Commits erhält.

## Grenzfall: Fast-Forward vs. Merge-Commit

Da `main` seit der Erstellung der beiden Feature-Branches keine eigenen Commits erhalten hatte, verlaufen beide Merges als Fast-Forward - `git log --graph` zeigt daher eine lineare Historie ohne zusätzlichen Merge-Commit. Hätte `main` zwischenzeitlich eigene Commits erhalten, würde mindestens einer der beiden Merges einen echten Merge-Commit mit zwei Elternteilen erzeugen.
