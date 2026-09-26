---
theme: default
layout: default
---

# Lab 5.3: Fork erstellen und mit einem Upstream-Repository arbeiten

Ein Fork eines Repositorys anlegen, lokal klonen, eine Änderung vornehmen und den eigenen Fork mit zwischenzeitlichen Änderungen des Original-Repositorys (Upstream) synchronisieren.

**Leitfragen:**

<details>
<summary>Was ist ein Fork?</summary>

Eine vollständige Kopie eines GitHub-Repositorys unter dem eigenen Konto, technisch unabhängig vom Original, aber mit gemeinsamer Historie zum Zeitpunkt der Erstellung.

</details>

<details>
<summary>Was bezeichnet "Upstream" in diesem Zusammenhang?</summary>

Das ursprüngliche Repository, von dem der eigene Fork abstammt - als zusätzlicher Remote-Name neben `origin` (dem eigenen Fork) eingerichtet.

</details>

<details>
<summary>Warum genügt `git pull` allein nicht, um Änderungen aus dem Original-Repository zu erhalten?</summary>

`git pull` bezieht sich standardmäßig auf `origin` (den eigenen Fork); Änderungen aus dem Original müssen explizit über den zusätzlichen `upstream`-Remote geholt werden.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Fork | eigene, unabhängige Kopie eines Repositorys unter dem eigenen Konto |
| `origin` | in einem Fork-Workflow üblicherweise der eigene Fork |
| `upstream` | das ursprüngliche Repository, von dem geforkt wurde |
| `git remote add upstream <url>` | richtet den zusätzlichen Verweis auf das Original-Repository ein |

## Zwei Remotes im Vergleich

| Remote-Name | Zeigt auf | Typische Nutzung |
| --- | --- | --- |
| `origin` | eigener Fork | eigene Branches pushen |
| `upstream` | Original-Repository | Änderungen anderer Personen holen |

## Ablauf für dieses Lab

```bash
# Fork ueber die GitHub-Weboberflaeche erstellen, danach:
git clone https://github.com/<eigenes-konto>/teamsite.git
cd teamsite
git remote add upstream https://github.com/<original-konto>/teamsite.git

git fetch upstream
git merge upstream/main

git push origin main
```

- Ohne einen eingerichteten `upstream`-Remote bleibt der eigene Fork dauerhaft auf dem Stand der Erstellung, selbst wenn sich das Original-Repository weiterentwickelt.
- `git fetch upstream` allein verändert `main` nicht - erst `merge` (oder `rebase`) übernimmt die neuen Commits tatsächlich.

> **Merksatz:** `origin` ist "mein Fork", `upstream` ist "das Original" - beide Namen sind reine Konvention, keine technische Vorgabe.

## Fazit

- Ein Fork ist eine eigenständige Kopie mit gemeinsamer Ausgangshistorie.
- `upstream` hält die Verbindung zum Original-Repository aufrecht.
- Synchronisation erfordert einen expliziten `fetch upstream` plus `merge`, nicht nur `git pull`.

Die Übung richtet Fork und Upstream ein und synchronisiert eine zwischenzeitliche Änderung des Original-Repositorys.
