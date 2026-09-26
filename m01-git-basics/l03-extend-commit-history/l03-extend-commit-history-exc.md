# Lab 1.3 - Übung: Commit-Historie um Datei-Operationen erweitern

Diese Übung baut auf dem Repository aus Lab 1.2 auf und erweitert dessen Commit-Historie um drei weitere, getrennte Commits.

## Ausgangslage

Das lokale `teamsite`-Repository aus Lab 1.2 mit genau einem Commit, der `index.html`, `styles.css`, `script.js` und `notes-todo.txt` enthält.

## Aufgaben

1. `script.js` mit `git mv` in `app.js` umbenennen und den `<script>`-Verweis in `index.html` von `script.js` auf `app.js` anpassen. Diese Änderung in einem eigenen Commit speichern.
2. Eine neue Datei `team.html` anlegen (Inhalt siehe unten) und in `index.html` einen zusätzlichen Navigationslink zu `team.html` ergänzen. Beide Änderungen in einem eigenen Commit speichern.
3. `notes-todo.txt` mit `git rm` entfernen und in einem eigenen Commit speichern.
4. Mit `git log --oneline` die vollständige Historie (vier Commits insgesamt) prüfen.
5. Mit `git status` bestätigen, dass keine offenen Änderungen mehr vorhanden sind.

## Inhalt von `team.html`

```html
<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8" />
  <title>Team - Kodschul Team Site</title>
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <header>
    <h1>Team</h1>
    <nav>
      <a href="index.html">Start</a>
      <a href="team.html">Team</a>
    </nav>
  </header>
  <main>
    <ul>
      <li>Team-Mitglied A - Backend</li>
      <li>Team-Mitglied B - Frontend</li>
      <li>Team-Mitglied C - Betrieb</li>
    </ul>
  </main>
</body>
</html>
```

## Beobachtbarer Checkpoint

`git log --oneline` zeigt genau vier Commits (Ersteinrichtung, Umbenennung, Team-Seite, Aufräumen); `git status` meldet ein sauberes Arbeitsverzeichnis.

## Abschlusskriterien

- `app.js` existiert, `script.js` existiert nicht mehr; `index.html` referenziert `app.js`.
- `team.html` existiert und ist von `index.html` aus über die Navigation erreichbar.
- `notes-todo.txt` existiert nicht mehr, weder im Arbeitsverzeichnis noch im letzten Commit.
- Die drei neuen Commits sind klar getrennt (nicht in einem einzigen Commit zusammengefasst).

## Erweiterung (optional)

Eine `README.md` mit einer kurzen Projektbeschreibung ergänzen und als fünften Commit speichern.

## Fallback: alternative Vorgehensweise ohne `git mv`

Falls `git mv` nicht zur Verfügung steht: Datei im Dateisystem umbenennen, danach `git add -A` ausführen. Git erkennt die inhaltliche Ähnlichkeit zwischen alter und neuer Datei häufig automatisch als Umbenennung (sichtbar z. B. mit `git status` oder `git log --stat`); das Endergebnis im Repository ist gleichwertig zu `git mv`.
