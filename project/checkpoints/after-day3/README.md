# Checkpoint: Stand nach Tag 3 (Modul 7-9, Kursabschluss)

Ab Modul 7 erweitert sich das Referenzprojekt um Dateien und externe Zustände, die sich nicht mehr vollständig als statischer Dateiordner abbilden lassen (GitHub-Actions-Läufe, ein lokaler Kubernetes-Cluster, ein Argo-CD-Kontrollmechanismus). Dieser Ordner enthält deshalb nur die zusätzlichen, tatsächlich versionierten Dateien.

## Zusätzlich zum Stand nach Tag 2

| Datei/Pfad | Herkunft |
| --- | --- |
| `.git/hooks/pre-commit` (nicht versioniert, lokal je Teilnehmendem) | Modul 7, Lab 7.1 |
| `.gitmessage.txt` | Modul 7, Lab 7.2 |
| `.github/workflows/lint.yml` | Module 7-8, schrittweise erweitert (siehe beigefügte finale Fassung) |
| `output/project/gitops/*.yaml` | Modul 9, unverändert seit ihrer Erstellung |

## Nicht als Datei abbildbar

- Der Status des lokalen Kubernetes-Clusters und der Argo-CD-Application `teamsite-gitops` (Modul 9).
- Die tatsächlichen GitHub-Actions-Laufhistorien (Module 7-8), einsehbar unter "Actions" im jeweiligen GitHub-Repository.

Bei Rückstand ab Modul 7: mit `output/project/checkpoints/after-day2/` und der hier beigefügten `.github/workflows/lint.yml` neu einsteigen; der Kubernetes-/Argo-CD-Teil (Modul 9) benötigt in diesem Fall die Live- oder Aufzeichnungs-Demonstration des Trainers als Ersatz (siehe Lab 9.2/9.3, Abschnitt "Fallback").
