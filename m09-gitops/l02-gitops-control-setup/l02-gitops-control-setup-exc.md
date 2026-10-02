# Lab 9.2 - Übung: Push- vs. Pull-Bereitstellung vergleichen und lokalen GitOps-Kontrollmechanismus einrichten

Diese Übung setzt ein lokales Einzelknoten-Kubernetes (kind oder Minikube) voraus. Ist dieses bei einzelnen Teilnehmenden nicht verfügbar, gilt der Fallback am Ende dieser Übung.

## Ausgangslage

Ein lauffähiges lokales Kubernetes (kind oder Minikube), `kubectl` konfiguriert und erreichbar; das `teamsite`-Repository mit den Manifesten unter `project/gitops/`.

## Aufgaben

1. In 2-3 Sätzen den Unterschied zwischen dem bisherigen GitHub-Actions-Workflow (Modul 7/8, Push-basiert) und dem in diesem Lab einzurichtenden Argo-CD-Ansatz (Pull-basiert) in eigenen Worten beschreiben.
2. Argo CD im lokalen Cluster installieren (Namespace `argocd` anlegen, offizielles Installationsmanifest anwenden). Skript: `bash ~/handout/project/setup/install-argocd.sh`.
3. Die Manifeste `namespace.yaml`, `kustomization.yaml`, `deployment.yaml` und `service.yaml` aus `project/gitops/` in das eigene Repository committen (sofern noch nicht vorhanden) und pushen. Skript: `bash ~/handout/project/setup/gitops-manifests.sh`.
4. `project/gitops-bootstrap/argocd-application.yaml` mit der tatsächlichen Repository-URL des eigenen `teamsite`-Repositorys ausfüllen und im Cluster anwenden. `spec.source.path` muss dabei auf den Ordner zeigen, in dem die Manifeste im eigenen Repository liegen.
5. Mit `kubectl get applications -n argocd` bestätigen, dass die Argo-CD-Application `teamsite-gitops` existiert und synchronisiert ist.
6. Mit `kubectl get pods -n teamsite-gitops` bestätigen, dass der Pod `site-greeter` läuft.
7. Testweise die Anzahl der Replicas direkt im Cluster manuell auf 2 erhöhen (`kubectl scale deployment site-greeter -n teamsite-gitops --replicas=2`) und nach kurzer Zeit erneut prüfen, ob Argo CD die Änderung durch Self-Healing wieder auf 1 zurücksetzt.
8. Mit `kubectl port-forward svc/site-greeter -n teamsite-gitops 8080:80` den Dienst lokal erreichbar machen und mit `curl localhost:8080` die aktuelle Begrüßungsnachricht abrufen.

## Beobachtbarer Checkpoint

`kubectl get applications -n argocd` zeigt `teamsite-gitops` mit Status "Synced" und "Healthy"; `kubectl get pods -n teamsite-gitops` zeigt genau einen laufenden Pod, auch nach dem manuellen Skalierungsversuch aus Aufgabe 7; `curl localhost:8080` liefert die Begrüßungsnachricht.

## Abschlusskriterien

- Argo CD ist im lokalen Cluster installiert und erreichbar.
- Die Application `teamsite-gitops` bezieht sich korrekt auf das eigene Repository und den Pfad `project/gitops`.
- Der manuelle Skalierungsversuch aus Aufgabe 7 wird durch Self-Healing wieder auf den in Git beschriebenen Zustand zurückgesetzt.

## Fallback: ohne lokales Kubernetes

Funktioniert die lokale Kubernetes-Installation nicht zuverlässig: der Trainer demonstriert Aufgabe 2-7 live oder anhand einer Aufzeichnung; die eigene Bearbeitung beschränkt sich auf Aufgabe 1 sowie das Lesen und Nachvollziehen der vier Manifeste unter `project/gitops/` in eigenen Worten (Frage: "Was würde bei einer Änderung von `GREETING_MESSAGE` passieren?").
