# GitOps-Manifeste für Modul 9

Diese Manifeste bilden einen bewusst kleinen, repräsentativen Workload ab (nicht die vollständige Kodschul Team Site), um den GitOps-Mechanismus (Git-Commit löst automatische Bereitstellung aus) nachvollziehbar zu demonstrieren, ohne einen eigenen Container-Image-Build/Registry-Workflow vorauszusetzen.

## Enthaltene Manifeste

| Datei | Zweck |
| --- | --- |
| `namespace.yaml` | eigener Namespace `teamsite-gitops` |
| `kustomization.yaml` | listet die Manifeste auf und erzeugt per `configMapGenerator` die ConfigMap mit der konfigurierbaren Begrüßungsnachricht; jede Änderung ergibt einen neuen ConfigMap-Namen (Hash) und löst damit einen Pod-Neustart aus |
| `deployment.yaml` | ein Pod mit dem Demo-Image `hashicorp/http-echo`, das die Begrüßungsnachricht ausliefert |
| `service.yaml` | Erreichbarkeit des Pods innerhalb des lokalen Clusters |

Die Argo-CD-`Application`-Definition liegt bewusst nicht in diesem Ordner, sondern in `project/gitops-bootstrap/argocd-application.yaml`: Dieser Ordner hier ist genau der Sync-Pfad, den Argo CD überwacht, und soll ausschließlich die tatsächlichen Workload-Manifeste enthalten.

## Verwendetes Image

`hashicorp/http-echo:1.0` ist ein etabliertes, minimales öffentliches Docker-Hub-Image (HashiCorp, aktiv gepflegt), das einen konfigurierten Text über HTTP ausliefert - geeignet, um Konfigurationsänderungen sichtbar zu machen, ohne einen eigenen Image-Build zu benötigen.

## Hinweis zur Aktualität

Exakte Argo-CD-Installationsschritte und Oberflächendetails werden vor Kursbeginn gegen die aktuell installierte Argo-CD-Version geprüft und bei Bedarf aktualisiert.
