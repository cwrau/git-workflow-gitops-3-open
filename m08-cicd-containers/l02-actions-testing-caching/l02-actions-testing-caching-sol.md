# Lab 8.2 - Lösung: Workflow um Tests, Caching und Service-Container erweitern

## Aufgabe 1-4: Erweiterter Workflow

`.github/workflows/lint.yaml`:

```yaml
name: Test und Lint
on:
  push:
    branches:
      - main
  pull_request:

permissions:
  contents: read

jobs:
  test:
    runs-on: ubuntu-latest
    services:
      httpbin:
        image: mccutchen/go-httpbin:2.25.0
        ports:
          - 8080:8080
    steps:
      - uses: actions/checkout@v4
      - name: Cache Beispielverzeichnis
        uses: actions/cache@v4
        with:
          path: .cache
          key: teamsite-cache-v1
      - name: HTML-Dateien auflisten
        run: find . -name "*.html" -print
      - name: Prüfen, ob Startseite existiert
        run: test -f index.html
      - name: Prüfen, ob Titel im HTML vorkommt
        run: grep -q "<title>" index.html
      - name: Service-Container erreichbar prüfen
        run: curl -sf http://localhost:8080/get
```

```bash
git add .github/workflows/lint.yaml
git commit -m "Workflow um Tests, Caching und Service-Container erweitern"
git push
```

## Aufgabe 5: Lauf prüfen

Unter GitHub "Actions" zeigen alle fünf Steps einen grünen Haken; der Service-Container "httpbin" erscheint zusätzlich in der Lauf-Detailansicht als eigener, parallel laufender Container.

## Erweiterung (Beispielantwort)

```yaml
          key: teamsite-cache-${{ hashFiles('index.html') }}
```

Ändert sich der Inhalt von `index.html`, ändert sich auch der berechnete Hash und damit der Cache-Key - ein veralteter Cache-Eintrag wird dadurch automatisch nicht mehr verwendet, ohne den Key manuell anpassen zu müssen.

## Hinweis zu Service-Containern

Service-Container stehen ausschließlich während der Laufzeit des jeweiligen Jobs zur Verfügung und werden danach automatisch entfernt - sie eignen sich für Testabhängigkeiten, nicht für dauerhafte Infrastruktur.
