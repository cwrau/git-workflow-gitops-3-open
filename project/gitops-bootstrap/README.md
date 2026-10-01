# Bootstrap: Argo-CD-Application-Definition

Diese `Application`-Ressource wird einmalig manuell angewendet (`kubectl apply -f project/gitops-bootstrap/argocd-application.yaml`) und danach nicht selbst von Argo CD verwaltet.

Sie liegt bewusst außerhalb von `project/gitops/`, damit ihr referenzierter Sync-Pfad (`spec.source.path: project/gitops`) nur die eigentlichen Workload-Manifeste (Namespace, ConfigMap, Deployment, Service) enthält - nicht die Application-Definition selbst. Läge diese Datei im selben Ordner, würde Argo CD versuchen, auch ihre eigene Application-Ressource als Teil des überwachten Zustands zu verwalten.
