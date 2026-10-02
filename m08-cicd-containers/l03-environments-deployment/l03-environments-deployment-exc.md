# Lab 8.3 - Übung: Branchspezifische Aufgaben und Umgebungen konfigurieren

Diese Übung erweitert `.github/workflows/lint.yaml` um einen zusätzlichen, branchabhängigen Job.

## Ausgangslage

Das `teamsite`-Repository mit dem erweiterten Workflow aus Lab 8.2, auf `main`.

## Aufgaben

1. Unter GitHub "Settings -> Environments" eine Umgebung `staging` anlegen.
2. Im Workflow einen zweiten Job `deploy-staging` ergänzen, der von `test` abhängt (`needs: test`), nur auf dem Branch `staging` läuft und die Umgebung `staging` verwendet. Im Trigger `push` zusätzlich den Branch `staging` aufnehmen, sonst startet dort kein Workflow. Stand zum Kopieren: `~/handout/project/setup/snippets/lint-8.3.yaml`.
3. Im neuen Job einen Step ergänzen, der eine simulierte Bereitstellung ausgibt (z. B. den aktuellen Commit-Hash in einer Textausgabe).
4. Die Änderung committen und nach `main` pushen; unter "Actions" bestätigen, dass `deploy-staging` als "skipped" markiert ist, da `main` nicht `staging` ist.
5. Einen neuen Branch `staging` anlegen, den aktuellen Stand von `main` dorthin pushen, und unter "Actions" bestätigen, dass `deploy-staging` diesmal tatsächlich ausgeführt wird.

## Beobachtbarer Checkpoint

Ein Workflow-Lauf auf `main` zeigt `deploy-staging` als "skipped"; ein Workflow-Lauf auf `staging` zeigt `deploy-staging` als erfolgreich ausgeführt mit sichtbarer Commit-Hash-Ausgabe.

## Abschlusskriterien

- `deploy-staging` läuft ausschließlich auf dem Branch `staging`, nicht auf `main`.
- Der Job ist korrekt von `test` abhängig (`needs: test`).
- Die Umgebung `staging` ist in den Repository-Einstellungen angelegt und im Job eingetragen.

## Erweiterung (optional)

Eine zusätzliche Bedingung ergänzen, die `deploy-staging` zusätzlich verhindert, wenn der auslösende Trigger ein Pull Request statt eines direkten Push ist (z. B. `if: github.ref == 'refs/heads/staging' && github.event_name == 'push'`).

## Fallback

Ohne Berechtigung, eine GitHub-Environment anzulegen: die `environment: staging`-Zeile aus dem Job entfernen und die Übung auf die branchabhängige `if:`-Bedingung sowie `needs:` beschränken - der Kern der Übung (branchabhängiges Verhalten) bleibt davon unberührt.
