---
theme: default
layout: default
---

# Lab 2.1: Commit-Historie lesen und Revisionen abkürzen

Eine bestehende Commit-Historie mit `git log` und `git show` untersuchen; Commits über abgekürzte Referenzen statt vollständiger Hashes ansprechen.

**Leitfragen:**

<details>
<summary>Wie unterscheiden sich `git log` und `git log --oneline`?</summary>

`git log` zeigt vollständige Angaben (Hash, Autor, Datum, Nachricht) je Commit; `git log --oneline` reduziert jeden Commit auf eine Zeile mit gekürztem Hash und Nachricht.

</details>

<details>
<summary>Was bedeutet `HEAD~2`?</summary>

Der Commit zwei Schritte vor dem aktuellen Stand (`HEAD`), entlang der Elternkette gezählt.

</details>

<details>
<summary>Was zeigt `git show <commit>` zusätzlich zu `git log`?</summary>

Den vollständigen Diff dieses einen Commits - welche Zeilen in welchen Dateien hinzugefügt oder entfernt wurden.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| SHA / Commit-Hash | eindeutige Kennung eines Commits, meist als gekürztes Präfix (7-8 Zeichen) verwendet |
| `HEAD` | Referenz auf den aktuell ausgecheckten Commit |
| `HEAD~n` | der Commit `n` Schritte vor `HEAD` |
| Commit-Range (`A..B`) | alle Commits zwischen zwei Referenzen |
| `git show` | zeigt Metadaten und Diff eines einzelnen Commits |

## Referenzen im Überblick

| Schreibweise | Bedeutung |
| --- | --- |
| `a1b2c3d` | vollständiger oder gekürzter Hash |
| `HEAD` | aktueller Commit |
| `HEAD~1`, `HEAD~2` | ein bzw. zwei Commits zurück |
| `HEAD~3..HEAD~1` | alle Commits in diesem Bereich, `HEAD~3` ausgeschlossen |

Diese Übung verändert nicht das gemeinsame Referenzprojekt (Kodschul Team Site); sie arbeitet in einem separaten, eigens dafür angelegten Übungs-Repository.

- Ein zu kurzer Hash-Präfix kann mehrdeutig werden, sobald ein Repository sehr viele Commits enthält; Git meldet das dann explizit.
- `git log <pfad>` beschränkt die Ausgabe auf Commits, die eine bestimmte Datei verändert haben.

> **Merksatz:** Abgekürzte Referenzen wie `HEAD~2` sind relativ zum aktuellen Stand - nach dem nächsten Commit verschiebt sich, worauf sie zeigen.

## Fazit

- `git log --oneline` liefert die kompakte Übersicht, `git show` den Detail-Diff eines Commits.
- `HEAD~n` und Commit-Ranges erlauben präzises Ansprechen einzelner Historienabschnitte, ohne Hashes abzutippen.
- Gekürzte Hashes reichen in der Praxis fast immer aus, um einen Commit eindeutig zu benennen.

Die Übung legt ein kleines Übungs-Repository an und beantwortet konkrete Fragen zu dessen Historie.
