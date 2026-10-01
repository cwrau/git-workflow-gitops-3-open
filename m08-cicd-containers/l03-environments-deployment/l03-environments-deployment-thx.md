---
theme: default
layout: default
---

# Lab 8.3: Branchspezifische Aufgaben und Umgebungen konfigurieren

Den Workflow so erweitern, dass ein zusätzlicher Job nur für einen bestimmten Branch läuft und eine benannte Umgebung (Staging) verwendet.

**Leitfragen:**

<details>
<summary>Wie lässt sich ein Job auf einen bestimmten Branch beschränken?</summary>

Über eine `if:`-Bedingung auf `github.ref`, z. B. `if: github.ref == 'refs/heads/staging'`.

</details>

<details>
<summary>Wofür eignet sich eine GitHub-Environment-Angabe (`environment:`) in einem Job?</summary>

Um umgebungsspezifische Regeln (z. B. erforderliche Freigaben oder umgebungsspezifische Secrets) an einen Job zu binden, ohne den Workflow-Code selbst zu verzweigen.

</details>

<details>
<summary>Warum ist eine explizite Bedingung sicherer als "einfach beide Branches gleich behandeln"?</summary>

Weil ein produktionsnaher Schritt (z. B. eine simulierte Bereitstellung) nicht versehentlich bei jedem beliebigen Branch ausgeführt werden soll.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `if:` (Job-Bedingung) | schränkt die Ausführung eines Jobs oder Steps auf bestimmte Bedingungen ein |
| `github.ref` | vollständige Referenz des aktuellen Branches/Tags im Workflow-Kontext |
| `environment:` | benannte GitHub-Umgebung mit eigenen Regeln und Secrets |

## Ablauf für dieses Lab

```yaml
  deploy-staging:
    needs: test
    if: github.ref == 'refs/heads/staging'
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - name: Simulierte Bereitstellung nach Staging
        run: echo "Bereitstellung nach Staging simuliert für $(git rev-parse --short HEAD)"
```

- `needs: test` sorgt dafür, dass der neue Job erst nach erfolgreichem Abschluss des bestehenden Test-Jobs startet.
- Ein Job mit nicht erfüllter `if:`-Bedingung erscheint in der Läufer-Übersicht als "skipped", nicht als fehlgeschlagen.

> **Merksatz:** Eine `if:`-Bedingung entscheidet vor der Ausführung, nicht danach - ein übersprungener Job verbraucht keine Laufzeit.

## Fazit

- `if:`-Bedingungen erlauben branchabhängiges Verhalten innerhalb derselben Workflow-Datei.
- `environment:` bindet umgebungsspezifische Regeln an einen Job, ohne den Code zu verzweigen.
- `needs:` legt eine Reihenfolge zwischen Jobs fest.

Die Übung ergänzt einen zusätzlichen, branchabhängigen Job für eine simulierte Staging-Bereitstellung.
