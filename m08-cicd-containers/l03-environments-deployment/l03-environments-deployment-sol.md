# Lab 8.3 - Lösung: Branchspezifische Aufgaben und Umgebungen konfigurieren

## Aufgabe 1-3: Erweiterter Workflow

```yaml
jobs:
  test:
    # ... unveraendert aus Lab 8.2 ...

  deploy-staging:
    needs: test
    if: github.ref == 'refs/heads/staging'
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/checkout@v4
      - name: Simulierte Bereitstellung nach Staging
        run: echo "Bereitstellung nach Staging simuliert fuer $(git rev-parse --short HEAD)"
```

```bash
git add .github/workflows/lint.yml
git commit -m "Branchabhaengigen Staging-Job ergaenzen"
git push
```

## Aufgabe 4: Lauf auf `main`

Unter "Actions" zeigt der Lauf auf `main`: `test` erfolgreich, `deploy-staging` mit Status "skipped", da die `if:`-Bedingung nicht erfüllt ist.

## Aufgabe 5: Lauf auf `staging`

```bash
git switch -c staging
git push -u origin staging
```

Der ausgelöste Lauf auf `staging` zeigt `test` erfolgreich und danach `deploy-staging` ebenfalls erfolgreich, mit der simulierten Bereitstellungsausgabe im Log.

## Aufgabe 6: Vergleich

```bash
git log -1 --oneline
```

Der im Workflow-Log ausgegebene Commit-Hash (`git rev-parse --short HEAD` innerhalb des Runners) entspricht exakt dem lokal per `git log -1` ermittelten Hash desselben Commits - der Runner arbeitet auf einem Checkout genau dieses Standes.

## Erweiterung (Beispielantwort)

```yaml
    if: github.ref == 'refs/heads/staging' && github.event_name == 'push'
```

Damit läuft `deploy-staging` selbst dann nicht, wenn ein Pull Request zufällig gegen den Branch `staging` gerichtet ist - nur ein tatsächlicher Push auf `staging` löst die simulierte Bereitstellung aus.

## Einordnung für Modul 9

Diese simulierte "Bereitstellung" per `echo`-Ausgabe demonstriert branchabhängiges Workflow-Verhalten, ersetzt aber keine echte Bereitstellung. Eine tatsächliche, Git-gesteuerte Bereitstellung folgt in Modul 9 über einen GitOps-Ansatz, nicht über einen direkten Deployment-Step im Workflow.
