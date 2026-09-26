---
theme: default
layout: default
---

# Lab 6.2: Cherry-Picking und Squashing an einer präparierten Historie

Einen einzelnen Commit gezielt aus einem anderen Branch übernehmen und mehrere Commits nachträglich zu einem zusammenfassen - an einer eigens dafür vorbereiteten Übungshistorie.

**Leitfragen:**

<details>
<summary>Was macht `git cherry-pick <commit>`?</summary>

Es überträgt genau die Änderung eines einzelnen Commits als neuen Commit auf den aktuellen Branch, unabhängig von dessen sonstiger Historie.

</details>

<details>
<summary>Worin unterscheidet sich Squashing von `git commit --amend`?</summary>

`--amend` ersetzt genau einen Commit; Squashing fasst mehrere aufeinanderfolgende Commits zu einem einzigen zusammen, etwa über `git reset --soft` und einen neuen gemeinsamen Commit.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git cherry-pick <commit>` | überträgt genau einen Commit auf den aktuellen Branch |
| Squashing | Zusammenfassen mehrerer Commits zu einem |
| Übungshistorie | eigens für diese Übung angelegtes, vom Referenzprojekt unabhängiges Repository |

## Cherry-Pick vs. Merge

| Aktion | Übernommene Commits | Typischer Anwendungsfall |
| --- | --- | --- |
| `git merge <branch>` | alle Commits des Branches | vollständige Feature-Integration |
| `git cherry-pick <commit>` | genau ein ausgewählter Commit | isolierte Korrektur ohne restliche Branch-Historie |

## Ablauf für dieses Lab

```bash
git switch fix-branch
git cherry-pick <hash-des-relevanten-commits>

git switch main
git reset --soft HEAD~3
git commit -m "Drei Zwischenschritte zu einer Aenderung zusammenfassen"
```

- Ein Cherry-Pick kann ebenfalls einen Konflikt auslösen, wenn die übernommene Änderung von anderen, bereits vorhandenen Änderungen abhängt.
- Squashing per `reset --soft` funktioniert zuverlässig nur für lokale, noch nicht geteilte Commits.

> **Merksatz:** Cherry-Pick übernimmt eine Änderung, keinen Branch - die restliche Historie des Quell-Branches bleibt außen vor.

## Fazit

- Cherry-Pick überträgt gezielt einen einzelnen Commit, unabhängig von dessen Branch-Kontext.
- Squashing reduziert mehrere kleine Zwischenschritte zu einem aussagekräftigen Commit.
- Beide Techniken verändern Historie und sind vor allem für noch nicht geteilte Commits unproblematisch.

Die Übung arbeitet an einer eigens vorbereiteten Übungshistorie, nicht am Referenzprojekt.
