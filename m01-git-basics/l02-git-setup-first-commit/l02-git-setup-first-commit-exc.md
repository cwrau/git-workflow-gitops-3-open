# Lab 1.2 - Übung: Git einrichten und ersten Commit erstellen

Diese Übung legt das gemeinsame Referenzprojekt, die Kodschul Team Site, lokal an und erzeugt dessen ersten Commit.

## Ausgangslage

Ein leerer, neuer lokaler Ordner sowie Zugriff auf die Startdateien unter `project/starter/` (`index.html`, `styles.css`, `script.js`, `notes-todo.txt`). Falls der Ordnerzugriff nicht möglich ist, stehen die vier Dateien vollständig weiter unten in diesem Dokument.

## Aufgaben

1. Git-Autor konfigurieren (`git config --global user.name`/`user.email`, oder lokal für dieses Repository).
2. Einen neuen lokalen Ordner `teamsite` anlegen und darin `git init` ausführen.
3. Die vier Startdateien (`index.html`, `styles.css`, `script.js`, `notes-todo.txt`) aus `project/starter/` in den Ordner kopieren.
4. Alle Dateien mit `git add` stagen und den Status mit `git status` prüfen.
5. Einen Commit mit einer klaren, kurzen Nachricht erstellen (z. B. "Erste Version der Kodschul Team Site").
6. Mit `git log` und `git log --stat` das Ergebnis prüfen.

## Beobachtbarer Checkpoint

`git log` zeigt genau einen Commit mit korrektem Autor-Namen; `git status` meldet ein sauberes Arbeitsverzeichnis ohne offene Änderungen.

## Abschlusskriterien

- Genau ein Commit existiert, der alle vier Startdateien enthält.
- Der Commit-Autor entspricht der eigenen, konfigurierten Identität.
- Die Commit-Nachricht beschreibt in einem kurzen Satz, was der Commit enthält.

## Erweiterung (optional)

`git log --stat` verwenden, um zu prüfen, wie viele Zeilen jede der vier Dateien zum ersten Commit beigetragen hat.

## Fallback: Startdateien ohne Ordnerzugriff

**`index.html`**

```html
<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8" />
  <title>Kodschul Team Site</title>
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <header>
    <h1>Kodschul Team Site</h1>
    <nav>
      <a href="index.html">Start</a>
    </nav>
  </header>
  <main>
    <p id="greeting">Willkommen auf der Team-Seite.</p>
  </main>
  <script src="script.js"></script>
</body>
</html>
```

**`styles.css`**

```css
body {
  font-family: sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f4f4f4;
  color: #222;
}

header {
  background-color: #1c3d5a;
  color: #fff;
  padding: 1rem 2rem;
}

nav a {
  color: #fff;
  margin-right: 1rem;
  text-decoration: none;
}

main {
  padding: 2rem;
}
```

**`script.js`**

```js
const greeting = document.getElementById("greeting");
const hour = new Date().getHours();

if (hour < 12) {
  greeting.textContent = "Guten Morgen! Willkommen auf der Team-Seite.";
} else if (hour < 18) {
  greeting.textContent = "Guten Tag! Willkommen auf der Team-Seite.";
} else {
  greeting.textContent = "Guten Abend! Willkommen auf der Team-Seite.";
}
```

**`notes-todo.txt`**

```text
Entwurfsnotiz (nicht fuer die veroeffentlichte Seite):
- Team-Fotos ergaenzen
- Kontakt-Seite verlinken
- Farben mit Marketing abstimmen
```
