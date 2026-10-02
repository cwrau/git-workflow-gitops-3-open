# Lab 8.3 - Lösung: Branchspezifische Aufgaben und Umgebungen konfigurieren

## Aufgabe 1-3: Erweiterter Workflow

```yaml
on:
  push:
    branches:
      - main
      - staging
  pull_request:

jobs:
  test:
    # ... unverändert aus Lab 8.2 ...

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

Der Trigger `push` enthält jetzt auch `staging`. Ohne diesen Eintrag startet auf dem Branch `staging` kein Workflow, und `deploy-staging` könnte dort nie laufen.

```bash
git add .github/workflows/lint.yaml
git commit -m "Branchabhängigen Staging-Job ergänzen"
git push
```

## Aufgabe 4: Lauf auf `main`

Unter "Actions" zeigt der Lauf auf `main`: `test` erfolgreich, `deploy-staging` mit Status "skipped", da die `if:`-Bedingung nicht erfüllt ist.

## Aufgabe 5: Lauf auf `staging`

```bash
git switch -c staging
git push -u origin staging
```

Der ausgelöste Lauf auf `staging` zeigt `test` erfolgreich und danach `deploy-staging` ebenfalls erfolgreich, mit der simulierten Bereitstellungsausgabe und dem Commit-Hash im Log.

## Erweiterung (Beispielantwort)

```yaml
    if: github.ref == 'refs/heads/staging' && github.event_name == 'push'
```

Damit läuft `deploy-staging` selbst dann nicht, wenn ein Pull Request zufällig gegen den Branch `staging` gerichtet ist - nur ein tatsächlicher Push auf `staging` löst die simulierte Bereitstellung aus.

## Einordnung für Modul 9

Diese simulierte "Bereitstellung" per `echo`-Ausgabe demonstriert branchabhängiges Workflow-Verhalten, ersetzt aber keine echte Bereitstellung. Eine tatsächliche, Git-gesteuerte Bereitstellung folgt in Modul 9 über einen GitOps-Ansatz, nicht über einen direkten Deployment-Step im Workflow.
