---
theme: default
layout: default
---

# Lab 7.3: Ersten GitHub-Actions-Workflow anlegen

Einen einfachen Lint-Workflow als GitHub Action einrichten und die Kodschul Team Site zusätzlich über GitHub Pages veröffentlichen.

**Leitfragen:**

<details>
<summary>Woraus besteht eine GitHub-Actions-Workflow-Datei?</summary>

Aus Trigger (`on:`), einem oder mehreren Jobs, und je Job einer Abfolge von Steps, die auf einem von GitHub bereitgestellten Runner ausgeführt werden.

</details>

<details>
<summary>Wo wird festgelegt, bei welchen Ereignissen ein Workflow startet?</summary>

Über den `on:`-Abschnitt, z. B. bei jedem Push auf einen bestimmten Branch oder bei jedem Pull Request.

</details>

<details>
<summary>Was ermöglicht GitHub Pages für dieses Referenzprojekt?</summary>

Das direkte Veröffentlichen der statischen HTML/CSS/JS-Dateien des Repositorys als öffentlich erreichbare Website, ohne separaten Hosting-Dienst.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Workflow-Datei | YAML-Datei unter `.github/workflows/`, die einen automatisierten Ablauf beschreibt |
| Trigger (`on:`) | Ereignis, das einen Workflow-Lauf auslöst |
| Job | eine Gruppe von Steps, die auf einem Runner läuft |
| Runner | die virtuelle Umgebung, in der ein Job ausgeführt wird |
| GitHub Pages | GitHub-Funktion zur direkten Veröffentlichung statischer Inhalte eines Repositorys |

## Minimaler Lint-Workflow

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

## Ablauf für dieses Lab

1. Ordner `.github/workflows/` anlegen, darin `lint.yaml` mit obigem Inhalt.
2. Commit und Push nach `main` (oder über einen Pull Request).
3. Unter GitHub "Actions" den Workflow-Lauf beobachten.
4. Unter GitHub "Settings -> Pages" die Veröffentlichung aus dem `main`-Branch aktivieren.

- Ein Workflow, der nur mit `find`/`echo` arbeitet, führt noch keine echte Prüfung durch - er dient hier zunächst dem Kennenlernen von Trigger, Job und Step, bevor Modul 8 echte Tests ergänzt.
- GitHub Pages benötigt nach der Aktivierung einige Minuten, bis die Seite unter der zugewiesenen URL erreichbar ist.

> **Merksatz:** Ein Workflow läuft unabhängig vom eigenen Rechner - ein grüner Haken auf GitHub bestätigt das, nicht die lokale Kommandozeile.

## Fazit

- Eine Workflow-Datei beschreibt Trigger, Jobs und Steps in YAML.
- `.github/workflows/` ist der feste, von GitHub erwartete Ort für diese Dateien.
- GitHub Pages veröffentlicht die statische Site direkt aus dem Repository, ohne separates Hosting.

Die Übung legt einen ersten Lint-Workflow an und aktiviert GitHub Pages für die Kodschul Team Site.
