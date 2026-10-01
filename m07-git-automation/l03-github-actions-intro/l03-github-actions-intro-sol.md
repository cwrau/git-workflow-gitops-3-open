# Lab 7.3 - Lösung: Ersten GitHub-Actions-Workflow anlegen

## Aufgabe 1-2: Workflow-Datei anlegen

`.github/workflows/lint.yaml`:

```yaml
name: Lint HTML
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: HTML-Dateien auflisten
        run: find . -name "*.html" -print
```

```bash
git add .github/workflows/lint.yaml
git commit -m "Ersten Lint-Workflow anlegen"
git push
```

## Aufgabe 3: Lauf prüfen

Unter GitHub "Actions" erscheint ein Lauf "Lint HTML" mit grünem Haken; die Ausgabe des Steps "HTML-Dateien auflisten" listet `index.html` und `team.html`.

## Aufgabe 4-5: GitHub Pages aktivieren

Unter "Settings -> Pages": Quelle auf Branch `main`, Ordner `/ (root)` setzen. Nach wenigen Minuten ist die Seite unter der von GitHub angezeigten URL (Format `https://<konto>.github.io/teamsite/`) erreichbar und zeigt den aktuellen Inhalt von `index.html`.

## Erweiterung (Beispielantwort)

```yaml
      - name: Anzahl HTML-Dateien ausgeben
        run: find . -name "*.html" | wc -l
```

Als zusätzlicher Step innerhalb desselben Jobs, nach dem bestehenden "HTML-Dateien auflisten"-Step.

## Hinweis zur GitHub-Pages-Verzögerung

Die tatsächliche Bereitstellungsdauer nach Aktivierung von GitHub Pages hängt vom aktuellen Auslastungszustand der GitHub-Infrastruktur ab und ist nicht exakt vorhersagbar; ein Neuladen nach wenigen Minuten ist die übliche Praxis, bevor von einem Problem ausgegangen wird.
