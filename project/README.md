# Referenzprojekt: Kodschul Team Site

Kleine, anonymisierte statische Website, die durch den gesamten Kurs begleitet:

- Tag 1: lokale Commit-Historie aufbauen und bereinigen, täglichen Workflow einrichten.
- Tag 2: Branches, Merge, GitHub-Zusammenarbeit, Pull Requests.
- Tag 3: Automatisierung, CI/CD mit GitHub Actions, GitOps-Bereitstellung.

Die Seite besteht bewusst nur aus statischem HTML/CSS/JavaScript ohne Build-Werkzeuge oder Paketmanager, damit jede Kursperson unabhängig von der eigenen Haupttechnologie sofort mitarbeiten kann.

## Struktur

| Ordner | Zweck |
| --- | --- |
| `starter/` | Ausgangsdateien für Modul 1, Lab 2 (erster Commit) |
| `checkpoints/after-m1/` | Erwarteter Projektstand nach Abschluss von Modul 1 |

## Dateien der Site

| Datei | Zweck |
| --- | --- |
| `index.html` | Startseite mit Begrüßung |
| `styles.css` | gemeinsames Stylesheet |
| `app.js` (ab Lab 1.3; vorher `script.js`) | Begrüßungslogik je Tageszeit |
| `team.html` (ab Lab 1.3) | Team-Übersicht |

Spätere Module verweisen auf weitere Checkpoint-Ordner, sobald sie entstehen.
