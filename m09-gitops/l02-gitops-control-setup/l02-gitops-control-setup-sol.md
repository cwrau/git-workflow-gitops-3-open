# Lab 9.2 - Lösung: Push- vs. Pull-Bereitstellung vergleichen und lokalen GitOps-Kontrollmechanismus einrichten

## Aufgabe 1: Vergleich (Beispielantwort)

Der bisherige GitHub-Actions-Workflow verbindet sich aktiv zu einem Zielsystem (z. B. über einen Deployment-Step) und überträgt die Änderung - er "pusht". Der Argo-CD-Ansatz dreht das um: ein im Cluster laufender Kontrollmechanismus beobachtet fortlaufend das Git-Repository und "zieht" sich Änderungen selbstständig, sobald sie erkannt werden, ohne dass der Cluster von außen erreichbar sein muss.

## Aufgabe 2: Argo CD installieren

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Aufgabe 3-4: Manifeste und Application einrichten

```bash
git add project/gitops/
git commit -m "GitOps-Manifeste ergänzen"
git push
```

`argocd-application.yaml`, Feld `repoURL`, mit der tatsächlichen HTTPS- oder SSH-URL des eigenen `teamsite`-Repositorys ausfüllen, danach:

```bash
kubectl apply -f project/gitops-bootstrap/argocd-application.yaml
```

## Aufgabe 5-6: Status prüfen

```bash
kubectl get applications -n argocd
kubectl get pods -n teamsite-gitops
```

Erwartete Ausgabe: `teamsite-gitops` mit `SYNC STATUS: Synced`, `HEALTH STATUS: Healthy`; ein Pod mit Präfix `site-greeter-` im Status `Running`.

## Aufgabe 7: Self-Healing beobachten

```bash
kubectl scale deployment site-greeter -n teamsite-gitops --replicas=2
kubectl get pods -n teamsite-gitops
# kurz warten
kubectl get pods -n teamsite-gitops
```

Unmittelbar nach dem Skalierungsbefehl erscheinen zwei Pods; nach kurzer Zeit (abhängig vom konfigurierten Synchronisationsintervall) reduziert Argo CD die Anzahl automatisch wieder auf den in `deployment.yaml` beschriebenen Zielwert von 1.

## Aufgabe 8: Dienst aufrufen

```bash
kubectl port-forward svc/site-greeter -n teamsite-gitops 8080:80
curl localhost:8080
```

Erwartete Ausgabe: der in `kustomization.yaml` hinterlegte Begrüßungstext.

## Hinweis zur Versionsabhängigkeit

Der exakte Installationsbefehl sowie CLI-Ausgaben können sich zwischen Argo-CD-Versionen geringfügig unterscheiden; das grundlegende Konzept (Application-Objekt, automatisierte Synchronisation, Self-Healing) ist über die letzten Versionen hinweg stabil geblieben.
