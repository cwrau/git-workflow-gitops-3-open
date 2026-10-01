---
theme: default
layout: default
---

# Lab 9.2: Push- vs. Pull-Bereitstellung vergleichen und lokalen GitOps-Kontrollmechanismus einrichten

Den Unterschied zwischen Push- und Pull-basierter Bereitstellung anhand des bisherigen GitHub-Actions-Workflows und eines neu eingerichteten GitOps-Kontrollmechanismus (Argo CD) nachvollziehen.

**Leitfragen:**

<details>
<summary>Was unterscheidet eine Push-basierte von einer Pull-basierten Bereitstellung?</summary>

Push-basiert: eine Pipeline (z. B. GitHub Actions) verbindet sich aktiv zum Zielsystem und stößt die Änderung an. Pull-basiert: ein Kontrollmechanismus im Zielsystem selbst beobachtet ein Git-Repository und gleicht den Zustand eigenständig ab.

</details>

<details>
<summary>Warum gilt Pull-basierte Bereitstellung als sicherer hinsichtlich Zugangsdaten?</summary>

Das Zielsystem benötigt keine nach außen gerichteten Zugangsdaten zu einer externen Pipeline; stattdessen verbindet sich der Kontrollmechanismus selbst, mit Berechtigungen ausschließlich innerhalb des eigenen Clusters.

</details>

<details>
<summary>Was bedeutet "Self-Healing" bei einem GitOps-Kontrollmechanismus?</summary>

Weicht der tatsächliche Zustand vom im Git-Repository beschriebenen Zustand ab (z. B. durch eine manuelle Änderung am Cluster), gleicht der Kontrollmechanismus dies eigenständig wieder an.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Push-basierte Bereitstellung | eine Pipeline verbindet sich aktiv zum Zielsystem und überträgt die Änderung |
| Pull-basierte Bereitstellung | ein Kontrollmechanismus im Zielsystem beobachtet ein Git-Repository und gleicht ab |
| GitOps | Ansatz, bei dem ein Git-Repository die einzige verbindliche Quelle für den gewünschten Zielzustand ist |
| Argo CD und Flux | verbreitete, Pull-basierte GitOps-Werkzeuge für Kubernetes; im Kurs dient Argo CD als Beispiel |
| Self-Healing | automatisches Zurücksetzen von Abweichungen auf den in Git beschriebenen Zustand |

## Push vs. Pull im Vergleich

| Aspekt | Push (Modul 7/8, GitHub Actions) | Pull (dieses Lab, Argo CD) |
| --- | --- | --- |
| Wer initiiert die Änderung? | die Pipeline | der Kontrollmechanismus im Zielsystem |
| Zugangsdaten Richtung Zielsystem | von außen nach innen nötig | nicht nötig, Kontrollmechanismus läuft bereits dort |
| Reaktion auf manuelle Abweichung | keine automatische Korrektur | automatische Korrektur (Self-Healing) |

## Ablauf für dieses Lab

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -f project/gitops-bootstrap/argocd-application.yaml
```

Die genaue Installationsanleitung und Oberfläche von Argo CD sind vor Kursbeginn gegen die aktuell installierte Version zu prüfen; die grundlegenden Konzepte (Application-Objekt, automatisierte Synchronisation) sind über Versionen hinweg stabil geblieben.

- Ohne eingerichtetes `syncPolicy.automated` erfordert Argo CD eine manuelle Bestätigung je Änderung - für dieses Lab ist automatisierte Synchronisation vorgesehen.
- Ein lokaler Cluster (kind/Minikube) simuliert das Zielsystem vollständig lokal, ohne echte Produktionsinfrastruktur zu berühren.

> **Merksatz:** Bei GitOps ist das Git-Repository die einzige Wahrheit - eine manuelle Änderung am Cluster ist eine Abweichung, kein neuer Zielzustand.

## Fazit

- Push-Bereitstellung initiiert eine externe Pipeline, Pull-Bereitstellung ein interner Kontrollmechanismus.
- Argo CD gleicht den Cluster-Zustand kontinuierlich an das im Git-Repository beschriebene Ziel an.
- Self-Healing macht manuelle, undokumentierte Änderungen am Cluster wirkungslos.

Die Übung richtet Argo CD lokal ein und verbindet es mit den Manifesten aus `project/gitops/`.
