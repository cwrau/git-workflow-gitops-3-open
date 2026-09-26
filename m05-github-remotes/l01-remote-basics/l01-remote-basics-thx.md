---
theme: default
layout: default
---

# Lab 5.1: Remote-Grundlagen mit einem lokalen Remote-Repository

Ein zweites, lokales "Remote"-Repository anlegen, um Fetch, Pull und Push sowie Tracking-Branches ohne externen Dienst zu erproben.

**Leitfragen:**

<details>
<summary>Was ist ein "Remote" aus Git-Sicht?</summary>

Ein weiteres Repository, das über einen Namen (üblicherweise `origin`) und einen Pfad oder eine URL referenziert wird - technisch unabhängig davon, ob es lokal oder auf einem Server liegt.

</details>

<details>
<summary>Worin unterscheiden sich `git fetch` und `git pull`?</summary>

`git fetch` lädt neue Commits vom Remote herunter, ohne den aktuellen Branch zu verändern; `git pull` führt zusätzlich automatisch einen Merge (oder Rebase) in den aktuellen Branch durch.

</details>

<details>
<summary>Was ist ein Tracking-Branch?</summary>

Ein lokaler Branch, der einem Remote-Branch zugeordnet ist, sodass `git push`/`git pull` ohne weitere Angaben wissen, welches Gegenstück gemeint ist.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Remote | ein weiteres, referenziertes Repository (z. B. `origin`) |
| `git remote add <name> <pfad>` | verknüpft das lokale Repository mit einem Remote |
| `git fetch` | lädt neue Commits vom Remote, ohne lokale Branches zu verändern |
| `git pull` | Fetch plus automatischer Merge in den aktuellen Branch |
| `git push -u origin <branch>` | überträgt Commits und richtet den Tracking-Branch ein |

## Fetch vs. Pull

| Befehl | Lädt herunter | Verändert aktuellen Branch |
| --- | --- | --- |
| `git fetch` | ja | nein |
| `git pull` | ja | ja (Merge/Rebase) |

Ein bare Repository (`git init --bare`) enthält nur die Git-Historie ohne Arbeitsverzeichnis - genau das, was ein Remote-Repository technisch benötigt, unabhängig davon, ob es lokal oder bei GitHub liegt.

## Ablauf für dieses Lab

```bash
git init --bare ../teamsite-remote.git
git remote add origin ../teamsite-remote.git
git push -u origin main

git remote -v
git branch -vv
```

- `-u` bei `git push` richtet den Tracking-Branch einmalig ein; danach genügen `git push`/`git pull` ohne weitere Angaben.
- `git remote -v` zeigt sowohl die Fetch- als auch die Push-URL desselben Remotes.

> **Merksatz:** Ein Remote ist zunächst nur ein benannter Verweis - ob dahinter ein lokaler Ordner oder GitHub steht, ändert die grundlegende Mechanik nicht.

## Fazit

- Ein Remote ist ein benannter Verweis auf ein weiteres Repository, lokal oder entfernt.
- `fetch` lädt nur herunter, `pull` lädt zusätzlich und mergt automatisch.
- Ein eingerichteter Tracking-Branch macht `push`/`pull` ohne wiederholte Zielangabe möglich.

Die Übung richtet ein lokales Remote-Repository ein und beobachtet Fetch, Push und Tracking-Branches.
