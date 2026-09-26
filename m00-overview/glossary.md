# Glossar: Git-Workflow und GitOps

| Term / Abkürzung | Plattform / Bereich | Wann verwendet | Primäre Nutzer:innen | Vorkommen |
| --- | --- | --- | --- | --- |
| `~/.gitconfig` | Git-Konfiguration | globale Benutzereinstellungen (Aliase, Identität) | alle Teilnehmenden | Modul 1, 3 |
| Argo CD | GitOps-Werkzeug | Pull-basierte, automatisierte Bereitstellung aus Git | alle Teilnehmenden | Modul 9 |
| Arbeitsverzeichnis | Git-Grundmodell | aktuelle Dateien auf der Festplatte | alle Teilnehmenden | Modul 1 |
| Atomarer Commit | Commit-Praxis | ein Commit enthält genau eine logische Änderung | alle Teilnehmenden | Modul 1, 4 |
| Audit-Trail | Change Management | Nachvollziehbarkeit von Wer/Wann/Was | alle Teilnehmenden | Modul 1 |
| Branch | Git | benannter, beweglicher Zeiger auf einen Commit | alle Teilnehmenden | Modul 4 |
| Branch-Namenskonvention | Team-Praxis | einheitliche Präfixe wie `feature/`, `fix/` | alle Teilnehmenden | Modul 6 |
| Build-Artefakt | Projektpflege | generierte, nicht zu versionierende Ausgabedatei | alle Teilnehmenden | Modul 3 |
| Cache-Key | GitHub Actions | bestimmt Wiederverwendbarkeit eines Caches | alle Teilnehmenden | Modul 8 |
| Change Management | Grundprinzip | kontrollierter Umgang mit Änderungen | alle Teilnehmenden | Modul 1 |
| Cluster (Kubernetes) | Kubernetes | Verbund aus Knoten, auf dem Pods laufen; im Kurs ein lokales Einzelknoten-Cluster (kind/Minikube) | alle Teilnehmenden | Modul 9 |
| Commit | Git | gespeicherter, beschrifteter Schnappschuss | alle Teilnehmenden | Modul 1-9 |
| Commit-Hash (SHA) | Git | eindeutige Kennung eines Commits | alle Teilnehmenden | Modul 2 |
| Commit-Range (`A..B`) | Git | alle Commits zwischen zwei Referenzen | alle Teilnehmenden | Modul 2 |
| Commit-Vorlage | Git-Konfiguration | vorausgefüllte Struktur für neue Commit-Nachrichten | alle Teilnehmenden | Modul 7 |
| ConfigMap | Kubernetes | nicht-geheime Konfigurationswerte | alle Teilnehmenden | Modul 9 |
| Container | Docker | laufende oder beendete Instanz eines Images | alle Teilnehmenden | Modul 8, 9 |
| Debug-Rückstand | Codequalität | versehentlich committeter Diagnosecode | alle Teilnehmenden | Modul 2 |
| Deklarative Infrastruktur | IaC/GitOps | Beschreibung des Zielzustands statt der Einzelschritte | alle Teilnehmenden | Modul 9 |
| Deployment (Kubernetes) | Kubernetes | beschreibt den gewünschten Soll-Zustand einer Pod-Gruppe (z. B. Replica-Anzahl, Image) | alle Teilnehmenden | Modul 9 |
| Docker | Container-Runtime | erstellt und betreibt Images/Container lokal und in GitHub Actions | alle Teilnehmenden | Modul 8, 9 |
| End-to-End-Nachweis | GitOps | lückenlose Demonstration von Commit bis Auswirkung | alle Teilnehmenden | Modul 9 |
| `environment:` | GitHub Actions | bindet Job an eine benannte Umgebung (z. B. Staging) | alle Teilnehmenden | Modul 8 |
| Exit-Code | Git-Hooks | Rückgabewert eines Skripts, entscheidet über Abbruch | alle Teilnehmenden | Modul 7 |
| Fast-Forward-Merge | Git | Merge ohne eigenen Merge-Commit | alle Teilnehmenden | Modul 4 |
| Fork | GitHub | eigenständige Kopie eines Repositorys unter eigenem Konto | alle Teilnehmenden | Modul 5 |
| `.gitignore` | Git | schließt Pfade von der Versionierung aus | alle Teilnehmenden | Modul 3 |
| `git add` | Git-CLI | verschiebt Änderungen in den Staging-Bereich | alle Teilnehmenden | Modul 1 |
| `git branch` | Git-CLI | listet, erstellt oder löscht Branches | alle Teilnehmenden | Modul 4 |
| `git cherry-pick` | Git-CLI | überträgt einen einzelnen Commit auf den aktuellen Branch | alle Teilnehmenden | Modul 6 |
| `git clone` | Git-CLI | erstellt eine lokale Kopie eines Remote-Repositorys | alle Teilnehmenden | Modul 5 |
| `git commit --amend` | Git-CLI | ersetzt den letzten Commit statt einen neuen anzuhängen | alle Teilnehmenden | Modul 2 |
| `git config` | Git-CLI | setzt Konfigurationswerte (Identität, Aliase, Vorlage) | alle Teilnehmenden | Modul 1, 3, 7 |
| `git fetch` | Git-CLI | lädt neue Commits vom Remote, ohne Branch zu verändern | alle Teilnehmenden | Modul 5 |
| `git init` | Git-CLI | initialisiert ein neues, leeres Repository | alle Teilnehmenden | Modul 1 |
| `git log` (`--oneline`, `--graph`, `-p`) | Git-CLI | zeigt die Commit-Historie in verschiedenen Formaten | alle Teilnehmenden | Modul 1, 2, 4 |
| `git merge` | Git-CLI | führt die Commits eines Branches zusammen | alle Teilnehmenden | Modul 4 |
| `git merge --abort` | Git-CLI | bricht einen konfliktbehafteten Merge vollständig ab | alle Teilnehmenden | Modul 4 |
| `git mv` | Git-CLI | benennt eine versionierte Datei um und stagt die Änderung | alle Teilnehmenden | Modul 1 |
| `git pull` | Git-CLI | Fetch plus automatischer Merge in den aktuellen Branch | alle Teilnehmenden | Modul 5 |
| `git push -u` | Git-CLI | überträgt Commits und richtet Tracking-Branch ein | alle Teilnehmenden | Modul 5 |
| `git remote add` | Git-CLI | verknüpft das Repository mit einem weiteren Repository | alle Teilnehmenden | Modul 5 |
| `git remote add upstream` | Git-CLI | richtet den Verweis auf das Original-Repository eines Forks ein | alle Teilnehmenden | Modul 5 |
| `git reset` (`--soft`/`--mixed`/`--hard`) | Git-CLI | nimmt Commits zurück, mit unterschiedlicher Wirkung auf Staging/Arbeitsverzeichnis | alle Teilnehmenden | Modul 2, 6 |
| `git rm` | Git-CLI | entfernt eine versionierte Datei | alle Teilnehmenden | Modul 1 |
| `git rm --cached` | Git-CLI | entfernt eine Datei aus der Versionskontrolle, behält sie lokal | alle Teilnehmenden | Modul 3 |
| `git show` | Git-CLI | zeigt Metadaten und Diff eines einzelnen Commits | alle Teilnehmenden | Modul 2 |
| `git stash` (`list`/`pop`/`apply`) | Git-CLI | sichert unfertige Änderungen temporär | alle Teilnehmenden | Modul 3 |
| `git switch` / `git checkout` | Git-CLI | wechselt den Stand des Arbeitsverzeichnisses zwischen Branches | alle Teilnehmenden | Modul 4 |
| `git tag` | Git-CLI | markiert einen Commit dauerhaft mit einem Namen | alle Teilnehmenden | Modul 4 |
| Git-Alias | Git-Konfiguration | Kurzform für einen längeren Git-Befehl | alle Teilnehmenden | Modul 3 |
| Git-Hook | Git | automatisch ausgeführtes Skript an einem Ablaufpunkt | alle Teilnehmenden | Modul 7 |
| `github.ref` | GitHub Actions | vollständige Referenz des aktuellen Branches/Tags | alle Teilnehmenden | Modul 8 |
| kind / Minikube | Kubernetes | Werkzeuge für ein lokales Einzelknoten-Kubernetes ohne Cloud-Anbieter | alle Teilnehmenden | Modul 9 |
| GitHub Pages | GitHub | Veröffentlichung statischer Inhalte direkt aus dem Repository | alle Teilnehmenden | Modul 7 |
| GitHub-Repository | GitHub | gehostetes Git-Repository mit Weboberfläche | alle Teilnehmenden | Modul 5 |
| GitOps | Konzept | Git-Repository als einzige verbindliche Quelle für den Zielzustand | alle Teilnehmenden | Modul 9 |
| `HEAD` | Git | Referenz auf den aktuell ausgecheckten Commit | alle Teilnehmenden | Modul 2 |
| `HEAD~n` | Git | Commit `n` Schritte vor `HEAD` | alle Teilnehmenden | Modul 2 |
| `if:` (Job-Bedingung) | GitHub Actions | schränkt Ausführung eines Jobs/Steps ein | alle Teilnehmenden | Modul 8 |
| Image | Docker | unveränderliche Vorlage für einen Container | alle Teilnehmenden | Modul 8 |
| Job | GitHub Actions | Gruppe von Steps, die auf einem Runner läuft | alle Teilnehmenden | Modul 7, 8 |
| Konfliktmarkierung | Git | `<<<<<<<`/`=======`/`>>>>>>>` in einer Konfliktdatei | alle Teilnehmenden | Modul 4 |
| `kubectl` | Kubernetes | Kommandozeilenwerkzeug zur Interaktion mit einem Kubernetes-Cluster | alle Teilnehmenden | Modul 9 |
| Kubernetes | Orchestrierung | verwaltet Container-Workloads deklarativ über einen Cluster | alle Teilnehmenden | Modul 8, 9 |
| Merge Commit | Git/GitHub | behält alle Einzel-Commits, ergänzt Merge-Commit | alle Teilnehmenden | Modul 6 |
| Merge-Konflikt | Git | nicht automatisch kombinierbare, konkurrierende Änderung | alle Teilnehmenden | Modul 4 |
| Merge-Strategie | Team-Praxis | Standardvorgehen für Pull Requests (Squash/Merge/Rebase) | alle Teilnehmenden | Modul 6 |
| Namespace (Kubernetes) | Kubernetes | logische Unterteilung eines Clusters, z. B. `teamsite-gitops` oder `argocd` | alle Teilnehmenden | Modul 9 |
| `needs:` | GitHub Actions | legt Ausführungsreihenfolge zwischen Jobs fest | alle Teilnehmenden | Modul 8 |
| Orchestrierung | Kubernetes | automatisiertes Verwalten mehrerer Container | alle Teilnehmenden | Modul 8, 9 |
| Pod | Kubernetes | kleinste ausführbare Einheit in Kubernetes, enthält einen oder mehrere Container | alle Teilnehmenden | Modul 9 |
| pre-commit (Hook) | Git | Hook, der vor der Commit-Erstellung läuft | alle Teilnehmenden | Modul 7 |
| Pull Request (PR) | GitHub | Vorschlag, einen Branch in einen anderen zu übernehmen | alle Teilnehmenden | Modul 6 |
| Pull-basierte Bereitstellung | GitOps | Kontrollmechanismus im Zielsystem gleicht selbst ab | alle Teilnehmenden | Modul 9 |
| Push-basierte Bereitstellung | CI/CD | Pipeline verbindet sich aktiv zum Zielsystem | alle Teilnehmenden | Modul 9 |
| Rebase and Merge | GitHub | Branch-Commits erscheinen linear ohne Merge-Commit | alle Teilnehmenden | Modul 6 |
| Registry | Docker | Speicherort für Images (Standard: Docker Hub) | alle Teilnehmenden | Modul 8 |
| Remote | Git | benannter Verweis auf ein weiteres Repository | alle Teilnehmenden | Modul 5 |
| Repository | Git | Ort, an dem die gesamte Projekt-Historie liegt | alle Teilnehmenden | Modul 1 |
| Review-Kommentar | GitHub | gezielte Anmerkung zu einem Pull Request | alle Teilnehmenden | Modul 6 |
| Rollout | GitOps/Kubernetes | Anwenden einer neuen Konfiguration auf laufende Pods | alle Teilnehmenden | Modul 9 |
| Runner | GitHub Actions | virtuelle Umgebung, in der ein Job ausgeführt wird | alle Teilnehmenden | Modul 7 |
| Secret (Kubernetes) | Kubernetes | Objekt für sensible Werte, Base64-kodiert (nicht verschlüsselt) | alle Teilnehmenden | Modul 9 |
| Secret-Management-Tool | Sicherheit | externes Werkzeug für verschlüsselte Secrets in Git | alle Teilnehmenden | Modul 9 |
| Self-Healing | GitOps | automatisches Zurücksetzen von Abweichungen auf den Git-Zustand | alle Teilnehmenden | Modul 9 |
| Service-Container | GitHub Actions | zusätzlicher, parallel laufender Container im Job | alle Teilnehmenden | Modul 8 |
| Squash and Merge | GitHub | fasst alle Branch-Commits zu einem zusammen | alle Teilnehmenden | Modul 6 |
| Squashing | Git-Praxis | Zusammenfassen mehrerer Commits zu einem | alle Teilnehmenden | Modul 6 |
| Staging-Bereich (Index) | Git | Zwischenschritt vor dem Commit | alle Teilnehmenden | Modul 1 |
| Tagging-Strategie | Team-Praxis | Regel, wann und wie ein Stand markiert wird | alle Teilnehmenden | Modul 6 |
| Tracking-Branch | Git | lokaler Branch mit zugeordnetem Remote-Gegenstück | alle Teilnehmenden | Modul 5 |
| Trigger (`on:`) | GitHub Actions | Ereignis, das einen Workflow-Lauf auslöst | alle Teilnehmenden | Modul 7 |
| Upstream | Git/GitHub | Original-Repository, von dem ein Fork abstammt | alle Teilnehmenden | Modul 5 |
| Versionskontrolle | Grundprinzip | System zur Nachvollziehbarkeit von Dateiänderungen über Zeit | alle Teilnehmenden | Modul 1 |
| Workflow-Datei | GitHub Actions | YAML-Datei unter `.github/workflows/` | alle Teilnehmenden | Modul 7, 8 |
| YAML | Konfigurationsformat | Format für Workflow-Dateien und Kubernetes-Manifeste | alle Teilnehmenden | Modul 7-9 |
