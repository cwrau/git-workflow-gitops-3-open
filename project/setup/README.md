# Vorbereitung für Tag 3 (Windows, Git Bash)

Alle Befehle laufen in Git Bash, im Ordner des geklonten Handouts. Die Skripte sparen das Abtippen; die Blöcke weiter unten lassen sich kopieren.

## 1. Werkzeuge: kind und kubectl

```bash
bash project/setup/install-tools.sh
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
bash project/setup/teamsite-repo.sh <github-konto>
cd ~/teamsite
```

Das Skript kopiert den Stand nach Tag 2 (`project/checkpoints/after-day2/`) nach `~/teamsite`, legt dort ein Repository an und pusht nach `main`. Alle Übungen von Tag 3 laufen in `~/teamsite`.

## 3. Argo CD und GitOps-Manifeste (Lab 9.2)

Argo CD installieren:

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Manifeste in das Repository `teamsite` übernehmen (`<handout>` ist der Ordner des geklonten Handouts):

```bash
cd ~/teamsite
mkdir -p project
cp -r <handout>/project/gitops project/gitops
git add project/gitops
git commit -m "GitOps-Manifeste ergänzen"
git push
```

Application anwenden: `<handout>/project/gitops-bootstrap/argocd-application.yaml` öffnen, `repoURL` auf `https://github.com/<github-konto>/teamsite.git` setzen und anwenden:

```bash
kubectl apply -f <handout>/project/gitops-bootstrap/argocd-application.yaml
kubectl get applications -n argocd
```
