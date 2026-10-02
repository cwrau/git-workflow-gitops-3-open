# Lab 9.3 - Übung: End-to-End-GitOps-Fluss demonstrieren

Diese Übung schließt den Kurs mit einem vollständigen, selbst durchgeführten Rollout ab.

## Ausgangslage

Der eingerichtete Argo-CD-Kontrollmechanismus aus Lab 9.2, mit synchronisierter Application `teamsite-gitops`.

## Aufgaben

1. Den Wert `GREETING_MESSAGE` in `project/gitops/kustomization.yaml` auf einen neuen, selbst gewählten Text ändern (z. B. mit dem eigenen Namen oder Kursdatum).
2. Die Änderung committen und pushen.
3. Mit `kubectl get applications -n argocd -w` beobachten, wie die Application kurzzeitig auf "OutOfSync" wechselt und danach automatisch wieder "Synced" wird. Den synchronisierten Commit (`kubectl get application teamsite-gitops -n argocd -o jsonpath='{.status.sync.revision}'`) mit `git rev-parse HEAD` vergleichen.
4. Mit `kubectl rollout status deployment/site-greeter -n teamsite-gitops` und `kubectl get pods -n teamsite-gitops` bestätigen, dass ein neuer Pod den vorherigen ersetzt hat.
5. Über `kubectl port-forward` und `curl` (oder einen Browser-Aufruf auf `localhost:8080`) bestätigen, dass der neue Begrüßungstext tatsächlich ausgeliefert wird.
6. Ein kurzes, zusammenhängendes Nachweis-Protokoll erstellen: Commit-Hash (`git log -1 --oneline`), Zeitpunkt der Synchronisation (aus dem Argo-CD-Status), beobachteter Text aus `curl`.
7. Rückblickend in 3-5 Sätzen den gesamten Weg von Lab 1.1 (Versionskontrolle einordnen) bis zu diesem End-to-End-Rollout zusammenfassen: welche Fähigkeiten aus welchen Modulen waren für diesen letzten Schritt tatsächlich nötig?

## Beobachtbarer Checkpoint

Das Nachweis-Protokoll aus Aufgabe 6 zeigt einen Commit-Hash, dessen zugehöriger Text tatsächlich über `curl` abrufbar ist - ohne dass ein manueller `kubectl apply`-Aufruf für diese Änderung nötig war.

## Abschlusskriterien

- Der über `curl` abgerufene Text entspricht exakt dem in Aufgabe 1 gewählten neuen Wert.
- Kein manueller `kubectl apply`/`kubectl edit`-Befehl wurde für diese spezifische Änderung verwendet.
- Die Rückschau aus Aufgabe 7 nennt konkrete Module, keine allgemeine Zusammenfassung.

## Erweiterung (optional)

Den Wert ein zweites Mal ändern und den gesamten Ablauf (Aufgabe 1-5) ohne erneutes Nachlesen der Anleitung wiederholen, um die Selbstständigkeit des Ablaufs zu bestätigen.

## Fallback: ohne lokales Kubernetes

Ohne funktionierenden lokalen Cluster: der Trainer führt den End-to-End-Rollout live oder anhand einer Aufzeichnung vor; die eigene Bearbeitung beschränkt sich auf Aufgabe 1 und 2 (Änderung im Manifest vorbereiten und committen) sowie Aufgabe 7 (Rückschau).
