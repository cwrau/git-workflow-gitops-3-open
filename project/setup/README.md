# Vorbereitung für Tag 3 (Windows, Git Bash)

Alle Befehle laufen in Git Bash, ausgehend vom Home-Verzeichnis (`~`). Die Skripte sparen das Abtippen; die Blöcke lassen sich kopieren.

## 0. Aktuellen Stand des Handouts holen

Das Handout aus Tag 1 und 2 bleibt unverändert liegen. Der Stand für Tag 3 kommt in einen eigenen Ordner `handout`:

```bash
cd ~
git clone https://github.com/cwrau/git-workflow-gitops-3-open handout
```

## 1. Werkzeuge: kind und kubectl

```bash
bash ~/handout/project/setup/install-tools.sh
source ~/.bashrc
```

Das Skript installiert `kind` und `kubectl` per `winget`, ergänzt den Pfad in `~/.bashrc` (kein Abmelden nötig) und zeigt die Versionen an. Läuft `docker version` nicht, startet Docker nicht, und Modul 8 und 9 funktionieren nicht.

Danach einmal testen, vor Lab 9.2:

```bash
kind create cluster
kubectl get nodes
```

## 2. Repository teamsite (vor Lab 7.1)

Auf GitHub ein leeres, öffentliches Repository `teamsite` anlegen, dann:

```bash
bash ~/handout/project/setup/teamsite-repo.sh <github-konto>
cd ~/teamsite
```

Das Skript kopiert den Stand nach Tag 2 (`project/checkpoints/after-day2/`) nach `~/teamsite`, legt dort ein Repository an und pusht nach `main`. Alle Übungen von Tag 3 laufen in `~/teamsite`.

## 3. Argo CD und GitOps-Manifeste (Lab 9.2)

Argo CD installieren (mit `kind`-Cluster aus Schritt 1) und die Manifeste in das Repository `teamsite` übernehmen:

```bash
bash ~/handout/project/setup/install-argocd.sh
bash ~/handout/project/setup/gitops-manifests.sh
```

`install-argocd.sh` legt den Namespace `argocd` an, installiert Argo CD mit `--server-side --force-conflicts` (nötig wegen der großen ApplicationSet-CRD) und wartet, bis alle Deployments verfügbar sind. Mit `ARGOCD_VERSION=<tag> bash …` lässt sich eine feste Version statt `stable` pinnen. `gitops-manifests.sh` kopiert `project/gitops` nach `~/teamsite`, committet und pusht.

Dieselben Schritte von Hand:

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

cd ~/teamsite
mkdir -p project
cp -r ~/handout/project/gitops project/gitops
git add project/gitops
git commit -m "GitOps-Manifeste ergänzen"
git push
```

Application anwenden: `~/handout/project/gitops-bootstrap/argocd-application.yaml` öffnen, `repoURL` auf `https://github.com/<github-konto>/teamsite.git` setzen und anwenden:

```bash
kubectl apply -f ~/handout/project/gitops-bootstrap/argocd-application.yaml
kubectl get applications -n argocd
```

## 4. Kopiervorlagen für Tag 3

Alles zum Selbstschreiben steht auf den Folien; diese Dateien sparen das Abtippen. Ausgeführt im Repository `~/teamsite`:

```bash
cd ~/teamsite
```

Lab 7.1, Hook:

```bash
cp ~/handout/project/setup/snippets/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

Lab 7.2, Commit-Vorlage:

```bash
cp ~/handout/project/setup/snippets/gitmessage.txt .gitmessage.txt
git config commit.template .gitmessage.txt
```

Lab 7.3, 8.2 und 8.3, Workflow (jeweils der Stand des Labs):

```bash
mkdir -p .github/workflows
cp ~/handout/project/setup/snippets/lint-7.3.yaml .github/workflows/lint.yaml
# Lab 8.2:
cp ~/handout/project/setup/snippets/lint-8.2.yaml .github/workflows/lint.yaml
# Lab 8.3:
cp ~/handout/project/setup/snippets/lint-8.3.yaml .github/workflows/lint.yaml
```

Die Dateien haben LF-Zeilenenden (`.gitattributes`), damit der Hook unter Windows läuft.

Lab 6b.1 und 6b.2, Vorbereitung der Übungen:

```bash
bash ~/handout/project/setup/snippets/rebase-vorbereiten.sh
bash ~/handout/project/setup/snippets/bisect-vorbereiten.sh
```

`rebase-vorbereiten.sh` läuft in `~/teamsite` und legt den Branch `feature/notizen` an, `bisect-vorbereiten.sh` erzeugt das Repository `~/bisect-demo`.
