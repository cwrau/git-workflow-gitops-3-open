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
kubectl rollout status deployment/site-greeter -n teamsite-gitops
kubectl get pods -n teamsite-gitops
```

Ein neuer Pod mit aktuellerem "AGE"-Wert ersetzt den vorherigen.

```bash
kubectl port-forward svc/site-greeter -n teamsite-gitops 8080:80
curl localhost:8080
```

Erwartete Ausgabe: der in Aufgabe 1 gewählte neue Text.

## Erweiterung (Beispielantwort)

Eine zweite, eigenständig wiederholte Änderung (ohne erneutes Nachlesen) bestätigt, dass der Ablauf verinnerlicht wurde: Manifest ändern, committen, pushen, Synchronisationsstatus beobachten, Ergebnis über `curl` verifizieren - exakt dieselben fünf Schritte wie beim ersten Durchlauf.

## Abschließender Hinweis

Dieses Lab demonstriert den GitOps-Mechanismus an einem bewusst kleinen, repräsentativen Workload (`http-echo`), nicht an der vollständigen Kodschul Team Site selbst - das zugrunde liegende Prinzip (Git als einzige verbindliche Quelle für den Zielzustand) ist unabhängig von der Größe der tatsächlichen Anwendung identisch.
