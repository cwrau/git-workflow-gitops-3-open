---
theme: default
layout: default
---

# Lab 6b.1: Rebase und sicheres Pushen

Einen Feature-Branch auf den aktuellen `main` aufsetzen, den Verlauf per interaktivem Rebase aufräumen und den Branch mit `--force-with-lease` pushen.

**Leitfragen:**

<details>
<summary>Worin unterscheiden sich `merge` und `rebase` in der Historie?</summary>

`merge` verbindet zwei Verläufe durch einen Merge-Commit, `rebase` setzt die Commits des Branches nacheinander auf eine neue Basis und erzeugt eine lineare Historie ohne Merge-Commit.

</details>

<details>
<summary>Warum bekommen die Commits nach einem Rebase neue Hashes?</summary>

Ein Commit-Hash enthält auch den Elternteil. Wechselt die Basis, ändert sich der Elternteil, und aus dem alten wird ein neuer Commit mit gleichem Inhalt.

</details>

<details>
<summary>Warum braucht ein bereits gepushter Branch nach dem Rebase `--force-with-lease`, und was schützt es?</summary>

Der lokale Verlauf ist nicht mehr nachfolgend zum Stand auf dem Remote, ein normaler Push wird abgelehnt. `--force-with-lease` überschreibt den Remote-Branch nur, wenn dort nichts Neues liegt, das man noch nicht gesehen hat. Ein bloßes `--force` überschreibt auch fremde Commits.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git rebase <basis>` | setzt die Commits des aktuellen Branches auf eine neue Basis auf |
| `git rebase -i` | interaktiver Rebase: Commits umsortieren, zusammenfassen, umbenennen oder löschen |
| `fixup` | fasst einen Commit mit dem vorherigen zusammen und verwirft seine Nachricht |
| `--force-with-lease` | überschreibt den Remote nur, wenn dort nichts Neues liegt |

## Merge vs. Rebase

| | Merge | Rebase |
| --- | --- | --- |
| Historie | zeigt, wann Verläufe zusammenkamen | linear, als wäre alles nacheinander entstanden |
| Commits | bleiben unverändert | werden neu erzeugt (neue Hashes) |
| Geeignet für | geteilte Branches | eigene, noch nicht geteilte Branches |

## Ablauf für dieses Lab

```bash
git rebase main
git rebase -i HEAD~3        # in der Liste bei den "wip"-Commits pick durch fixup ersetzen
git push                    # abgelehnt (non-fast-forward)
git push --force-with-lease
```

- Der interaktive Rebase öffnet eine Liste im Editor, die Reihenfolge ist von alt nach neu.
- Nach dem Rebase ist der Verlauf lokal neu geschrieben, auf dem Remote liegt noch der alte Stand.

> **Merksatz:** Rebase schreibt Historie neu: nur auf eigenen, noch nicht geteilten Branches, und beim Push `--force-with-lease` statt `--force`.

## Fazit

- `rebase` setzt Commits auf eine neue Basis auf und erzeugt eine lineare Historie.
- `rebase -i` fasst Commits zusammen, benennt sie um oder entfernt sie.
- Nach einem Rebase auf einem gepushten Branch ist `--force-with-lease` nötig.

Die Übung setzt einen Feature-Branch auf `main` auf, fasst "wip"-Commits zusammen und pusht den Branch.
