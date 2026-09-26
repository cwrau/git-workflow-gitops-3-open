---
theme: default
layout: default
---

# Lab 9.1: Deklarative Infrastruktur und Secrets einordnen

Beispiele für deklarative Infrastruktur und für den Umgang mit Secrets bewerten, bevor der lokale GitOps-Kontrollmechanismus eingerichtet wird.

**Leitfragen:**

<details>
<summary>Was unterscheidet deklarative von imperativer Infrastrukturverwaltung?</summary>

Deklarativ beschreibt den gewünschten Endzustand ("es sollen drei Replicas laufen"); imperativ beschreibt die auszuführenden Schritte ("starte einen weiteren Container").

</details>

<details>
<summary>Warum gehören echte Secrets nicht direkt in ein Kubernetes-Manifest im Git-Repository?</summary>

Ein Git-Repository ist vollständig historisiert und oft mehreren Personen zugänglich - ein einmal committeter Secret-Wert bleibt in der Historie auffindbar, selbst nach späterem Entfernen.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Deklarative Infrastruktur | Beschreibung des gewünschten Zielzustands statt einzelner Ausführungsschritte |
| ConfigMap | Kubernetes-Objekt für nicht-geheime Konfigurationswerte |
| Secret (Kubernetes) | Kubernetes-Objekt für sensible Werte, getrennt von regulären Manifesten |
| Secret-Management-Tool | externes Werkzeug (z. B. Sealed Secrets, externe Vaults), das Secrets verschlüsselt im Git-Repository ablegbar macht |

## Einordnungsbeispiele

| Beispiel | Einordnung |
| --- | --- |
| Eine YAML-Datei legt fest: "3 Replicas, Image-Version 1.2" | deklarative Infrastruktur |
| Ein Shell-Skript ruft nacheinander `docker run` dreimal auf | imperative Ausführung |
| Ein API-Schlüssel steht im Klartext in einer committeten `deployment.yaml` | unsicheres Secret-Handling |
| Ein API-Schlüssel wird über ein separates, nicht versioniertes Secret-Objekt eingebunden | angemessenes Secret-Handling |

Die in diesem Kurs verwendeten Manifeste (`output/project/gitops/`) enthalten ausschließlich nicht-geheime Konfigurationswerte (z. B. eine Begrüßungsnachricht) - echte Secrets sind hier bewusst nicht Teil der Übung.

- Eine ConfigMap ist für nicht-geheime Werte gedacht; ein Kubernetes-Secret ist lediglich Base64-kodiert, nicht verschlüsselt, und daher allein kein ausreichender Schutz.
- Für produktiv genutzte Secrets sind zusätzliche Werkzeuge (z. B. verschlüsselte Secret-Objekte oder externe Vaults) üblich.

> **Merksatz:** Ein Git-Repository ist ein Gedächtnis, kein Tresor - was einmal committet wurde, bleibt auffindbar.

## Fazit

- Deklarative Infrastruktur beschreibt den Zielzustand, nicht die Einzelschritte dorthin.
- ConfigMaps eignen sich für nicht-geheime Konfiguration, nicht für Secrets.
- Echte Secrets benötigen ein separates, nicht im Klartext versioniertes Handling.

Die Übung ordnet vier Beispiele als deklarativ/imperativ bzw. angemessenes/unsicheres Secret-Handling ein.
