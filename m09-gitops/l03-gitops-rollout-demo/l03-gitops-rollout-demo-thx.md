---
theme: default
layout: default
---

# Lab 9.3: End-to-End-GitOps-Fluss demonstrieren

Eine Änderung im Referenzprojekt vorbereiten, per Git-Commit ausrollen lassen und den vollständigen Weg von Commit bis laufender Änderung nachweisen - der Abschluss des Kurses.

**Leitfragen:**

<details>
<summary>Welche Stationen durchläuft eine Änderung in diesem GitOps-Fluss?</summary>

Änderung im Manifest, Commit, Push, automatische Erkennung durch Argo CD, automatischer Abgleich im Cluster, beobachtbare Auswirkung im laufenden Pod.

</details>

<details>
<summary>Wie lässt sich nachweisen, dass genau dieser Commit im Cluster angekommen ist?</summary>

Argo CD speichert den synchronisierten Commit im Application-Status. `kubectl get application teamsite-gitops -n argocd -o jsonpath='{.status.sync.revision}'` liefert den Hash, er muss mit `git rev-parse HEAD` übereinstimmen. Ein gleicher Text im Pod allein beweist das nicht, denn er könnte auch per `kubectl apply` gesetzt worden sein.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| End-to-End-Nachweis | lückenlose Demonstration von der Quelländerung bis zur beobachtbaren Auswirkung |
| Rollout | das Anwenden einer neuen Konfiguration auf laufende Pods |

## Stationen des Nachweises

| Schritt | Werkzeug | Sichtbares Ergebnis |
| --- | --- | --- |
| 1. Änderung committen | `git commit` | neuer Commit in der Historie |
| 2. Änderung veröffentlichen | `git push` | Commit auf GitHub sichtbar |
| 3. Automatische Erkennung | Argo CD | Application wechselt kurzzeitig zu "OutOfSync", danach wieder "Synced" |
| 4. Laufende Auswirkung | `kubectl`/`curl` | neuer Begrüßungstext im laufenden Pod |

## Ablauf für dieses Lab

```bash
# kustomization.yaml: GREETING_MESSAGE anpassen
git add project/gitops/kustomization.yaml
git commit -m "Begrüßungstext für die GitOps-Demo aktualisieren"
git push

kubectl get applications -n argocd -w
kubectl rollout status deployment/site-greeter -n teamsite-gitops
kubectl get pods -n teamsite-gitops

kubectl port-forward svc/site-greeter -n teamsite-gitops 8080:80
curl localhost:8080
```

- Eine geänderte ConfigMap startet laufende Pods nicht neu, Umgebungsvariablen werden nur beim Containerstart gelesen. Hier erzeugt der `configMapGenerator` in `kustomization.yaml` deshalb bei jeder Änderung eine ConfigMap mit neuem Hash-Suffix im Namen. Das Deployment verweist dann auf einen neuen Namen, die Pod-Spezifikation ändert sich und Kubernetes ersetzt den alten Pod.
- Je nach konfiguriertem Synchronisationsintervall kann zwischen Push und sichtbarer Änderung im Cluster eine kurze Wartezeit liegen.

> **Merksatz:** Der End-to-End-Nachweis ist erst vollständig, wenn die beobachtbare Auswirkung im Cluster tatsächlich mit dem Git-Commit übereinstimmt - eine Vermutung reicht nicht.

## Fazit

- Der gesamte Kurs mündet in einem einzigen, durchgängigen Nachweis: Commit führt zu beobachtbarer Auswirkung, ohne manuellen Bereitstellungsschritt.
- Argo CD schließt den Kreis zwischen lokaler Commit-Historie (Modul 1-3), Zusammenarbeit (Modul 4-6) und Automatisierung (Modul 7-8).
- Ein sauberer End-to-End-Nachweis verbindet Git-Historie, Kontrollmechanismus-Status und tatsächliches Laufzeitverhalten.

Die Übung schließt den Kurs mit einem vollständigen, selbst durchgeführten und dokumentierten GitOps-Rollout ab.
