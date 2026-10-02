# Lab 9.3 - Lösung: End-to-End-GitOps-Fluss demonstrieren

## Aufgabe 1-2: Änderung vorbereiten

In `project/gitops/kustomization.yaml` den Literal im `configMapGenerator` ändern:

```yaml
configMapGenerator:
  - name: site-greeting
    namespace: teamsite-gitops
    literals:
      - GREETING_MESSAGE=Kodschul Git-Workflow und GitOps - Kurs abgeschlossen am <Kursdatum>
```

```bash
git add project/gitops/kustomization.yaml
git commit -m "Begrüßungstext für die GitOps-Demo aktualisieren"
git push
```

## Aufgabe 3-5: Synchronisation beobachten

```bash
kubectl get applications -n argocd -w
```

Erwartete Abfolge: `teamsite-gitops` wechselt kurzzeitig auf `OutOfSync`, danach automatisch zurück auf `Synced`, `Healthy`.

```bash
git rev-parse HEAD
kubectl get application teamsite-gitops -n argocd -o jsonpath='{.status.sync.revision}'
```

Beide Ausgaben zeigen denselben Commit-Hash: Argo CD hat genau diesen Stand synchronisiert.

```bash
kubectl rollout status deployment/site-greeter -n teamsite-gitops
kubectl get pods -n teamsite-gitops
```

Ein neuer Pod mit aktuellerem "AGE"-Wert ersetzt den vorherigen.

```bash
kubectl port-forward svc/site-greeter -n teamsite-gitops 8080:80
curl localhost:8080
```

Erwartete Ausgabe: der in Aufgabe 1 gewählte neue Text.

## Aufgabe 6: Nachweis-Protokoll (Beispiel)

```text
Commit: a1b2c3d "Begrüßungstext für die GitOps-Demo aktualisieren"
Synchronisiert: Argo CD zeigte "Synced" ca. 1 Minute nach dem Push
Beobachteter Text (curl): "Kodschul Git-Workflow und GitOps - Kurs abgeschlossen am <Kursdatum>"
```

## Aufgabe 7: Rückschau (Beispielantwort)

Modul 1-3 lieferten die Grundlage, überhaupt nachvollziehbare, saubere Commits zu erzeugen - ohne diese Basis wäre der finale Commit in Aufgabe 2 nicht anders als jede andere Änderung gewesen. Modul 4-6 ermöglichten es, diese Änderung im Team über Branches, Pull Requests und eine dokumentierte Strategie kontrolliert einzubringen, statt direkt und unkontrolliert auf `main` zu arbeiten. Modul 7-8 bauten die Automatisierung (Hooks, GitHub Actions) auf, die Qualität vor dem Merge sichert. Modul 9 schließlich verband denselben Mechanismus (ein Git-Commit als auslösendes Ereignis) mit einer tatsächlichen, automatisierten Bereitstellung - der gesamte Kurs mündet damit in genau diesem einen, durchgängig nachvollziehbaren Rollout.

## Erweiterung (Beispielantwort)

Eine zweite, eigenständig wiederholte Änderung (ohne erneutes Nachlesen) bestätigt, dass der Ablauf verinnerlicht wurde: Manifest ändern, committen, pushen, Synchronisationsstatus beobachten, Ergebnis über `curl` verifizieren - exakt dieselben fünf Schritte wie beim ersten Durchlauf.

## Abschließender Hinweis

Dieses Lab demonstriert den GitOps-Mechanismus an einem bewusst kleinen, repräsentativen Workload (`http-echo`), nicht an der vollständigen Kodschul Team Site selbst - das zugrunde liegende Prinzip (Git als einzige verbindliche Quelle für den Zielzustand) ist unabhängig von der Größe der tatsächlichen Anwendung identisch.
