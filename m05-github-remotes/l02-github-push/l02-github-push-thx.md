---
theme: default
layout: default
---

# Lab 5.2: Repository mit GitHub verbinden und Remote-Branches verwalten

Das lokale Repository zusätzlich mit einem echten GitHub-Repository verbinden, Commits übertragen und einen Remote-Branch anlegen und wieder entfernen.

**Leitfragen:**

<details>
<summary>Was ändert sich praktisch, wenn `origin` auf GitHub statt auf ein lokales bare Repository zeigt?</summary>

Die Befehle bleiben identisch; hinzu kommt Authentifizierung (z. B. über SSH-Schlüssel oder ein Personal Access Token) und eine Weboberfläche zur Ansicht der Historie.

</details>

<details>
<summary>Wie entsteht ein neuer Branch auf GitHub?</summary>

Durch `git push origin <branch>` von einem lokal existierenden Branch aus - GitHub legt daraufhin denselben Branch-Namen im Remote-Repository an.

</details>

<details>
<summary>Wie wird ein Remote-Branch wieder entfernt?</summary>

Mit `git push origin --delete <branch>`; der lokale Branch bleibt davon unberührt und muss bei Bedarf separat gelöscht werden.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| GitHub-Repository | ein von GitHub gehostetes Git-Repository mit Weboberfläche und Kollaborationsfunktionen |
| `git clone <url>` | erstellt eine lokale Kopie eines Remote-Repositorys inklusive Tracking-Branch |
| `git push origin --delete <branch>` | entfernt einen Branch auf dem Remote, ohne den lokalen Branch zu löschen |
| Remote-Branch-Referenz | lokale Kopie des Remote-Standes, z. B. `origin/main`, aktualisiert durch `fetch`/`pull` |

## Lokales bare Repository vs. GitHub

| Aspekt | Lokales bare Repository (Lab 5.1) | GitHub |
| --- | --- | --- |
| Zugriffskontrolle | keine | Benutzerkonto, Berechtigungen |
| Weboberfläche | keine | Ja (Historie, Dateien, Pull Requests) |
| Zusammenarbeit mehrerer Personen | technisch möglich, unpraktisch | vorgesehener Regelfall |

## Ablauf für dieses Lab

```bash
git remote set-url origin https://github.com/<konto>/teamsite.git
git push -u origin main

git switch -c feature/social-links
git push -u origin feature/social-links

git push origin --delete feature/social-links
git branch -d feature/social-links
```

- `git remote set-url` ersetzt die bestehende Remote-URL, ohne den Namen `origin` zu ändern - alle bisherigen Befehle funktionieren unverändert weiter.
- Ein auf GitHub sichtbarer, aber lokal gelöschter Branch bleibt bestehen, bis er auch remote gelöscht wird, und umgekehrt.

> **Merksatz:** Ein Branch existiert lokal und remote unabhängig voneinander - Löschen an einer Stelle wirkt sich nicht automatisch auf die andere aus.

## Fazit

- Die grundlegenden Remote-Befehle ändern sich nicht, wenn `origin` von lokal auf GitHub wechselt.
- Ein neuer Branch entsteht auf GitHub erst durch einen expliziten `push`.
- Lokales und Remote-Löschen eines Branches sind zwei getrennte Schritte.

Die Übung verbindet das Referenzprojekt mit einem echten GitHub-Repository und verwaltet dort einen zusätzlichen Branch.
