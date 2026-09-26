---
theme: default
layout: default
---

# Lab 8.2: Workflow um Tests, Caching und Service-Container erweitern

Den bestehenden GitHub-Actions-Workflow um einen echten Testschritt, Abhängigkeits-Caching und einen Service-Container erweitern.

**Leitfragen:**

<details>
<summary>Wofür eignet sich Caching in einem Workflow?</summary>

Um wiederkehrende, aufwendige Schritte (z. B. das Herunterladen von Abhängigkeiten) zwischen Workflow-Läufen wiederzuverwenden, statt sie jedes Mal komplett neu auszuführen.

</details>

<details>
<summary>Was ist ein Service-Container in GitHub Actions?</summary>

Ein zusätzlicher, parallel zum Job laufender Container (z. B. eine Datenbank), der während der Steps über einen festen Hostnamen erreichbar ist.

</details>

<details>
<summary>Warum lohnt sich ein echter Test-Step gegenüber dem reinen `find`-Befehl aus Modul 7?</summary>

Ein echter Test prüft tatsächliches Verhalten (z. B. Vorhandensein bestimmter Inhalte) statt nur die Existenz von Dateien aufzulisten.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `actions/cache` | offizielle Action zum Zwischenspeichern von Verzeichnissen zwischen Workflow-Läufen |
| Service-Container | zusätzlicher Container, der parallel zum Job läuft und über Hostnamen erreichbar ist |
| Cache-Key | eindeutiger Schlüssel, der bestimmt, wann ein Cache-Eintrag wiederverwendet werden darf |

## Ablauf für dieses Lab

```yaml
name: Test und Lint
on:
  push:
    branches: [main]
  pull_request:

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
      - name: Pruefen, ob Startseite existiert
        run: test -f index.html
      - name: Pruefen, ob Titel im HTML vorkommt
        run: grep -q "<title>" index.html
      - name: Service-Container erreichbar pruefen
        run: curl -sf http://localhost:8080/get
```

- Ein Service-Container ist im gleichen Job über `localhost:<port>` erreichbar, sofern die Port-Zuordnung wie im Beispiel angegeben ist.
- Ein Cache-Key, der sich nie ändert, kann veraltete Inhalte liefern - üblich ist, projektspezifische Angaben (z. B. eine Prüfsumme einer Abhängigkeitsdatei) in den Key einzubeziehen.

> **Merksatz:** Ein Service-Container läuft neben dem Job, nicht als Teil davon - er wird über Netzwerk, nicht über Dateisystem angesprochen.

## Fazit

- Echte Test-Steps prüfen Inhalt und Verhalten, nicht nur Dateiexistenz.
- Caching spart wiederkehrende Ladezeit über mehrere Workflow-Läufe hinweg.
- Service-Container stellen zusätzliche Dienste bereit, ohne den eigentlichen Job-Container zu verändern.

Die Übung erweitert den bestehenden Workflow um echte Prüfungen, Caching und einen erreichbaren Service-Container.
