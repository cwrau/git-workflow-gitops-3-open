---
theme: default
layout: default
---

# Lab 2.3: Fehlerhafte Commit-Historie diagnostizieren

Zwei unsauber dokumentierte Commits im Referenzprojekt identifizieren, ihre tatsächlichen Änderungen verstehen und sie zu einem sauberen, aussagekräftigen Commit zusammenfassen.

**Leitfragen:**

<details>
<summary>Woran erkennt man einen unklaren Commit allein an der `git log`-Ausgabe?</summary>

An generischen Nachrichten wie "wip" oder "asdf" ohne erkennbaren Bezug zur tatsächlichen Änderung.

</details>

<details>
<summary>Wie lässt sich der tatsächliche Inhalt eines unklaren Commits klären?</summary>

Mit `git show <commit>`: der Diff zeigt die reale Änderung unabhängig von der Qualität der Nachricht.

</details>

<details>
<summary>Wann eignet sich `git reset --soft HEAD~2` zum Aufräumen mehrerer Commits?</summary>

Wenn mehrere aufeinanderfolgende, noch nicht geteilte Commits inhaltlich zu einer einzigen sinnvollen Änderung zusammengefasst werden sollen.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git diff` | zeigt Unterschiede zwischen Arbeitsverzeichnis, Staging-Bereich und/oder Commits |
| Debug-Rückstand | versehentlich committeter Code zu Diagnosezwecken (z. B. `console.log`), der nicht in die Historie gehört |
| Aufräum-Commit | ein Commit, der mehrere unsaubere Vorgänger-Commits durch einen klaren Endstand ersetzt |

## Diagnoseschritte

| Schritt | Werkzeug | Ergebnis |
| --- | --- | --- |
| 1 | `git log --oneline` | unklare Nachrichten identifizieren |
| 2 | `git show <commit>` je verdächtigem Commit | tatsächliche Änderung sichtbar machen |
| 3 | `git reset --soft HEAD~n` | betroffene Commits zurücknehmen, Inhalt bleibt gestaged |
| 4 | Bereinigen, neu stagen, ein Commit | saubere Historie mit einer Nachricht |

Das Referenzprojekt enthält nach den vorbereitenden Schritten zwei aufeinanderfolgende Commits mit den Nachrichten "wip" und "asdf" - beide zusammen ergeben eine sinnvolle, aber unsauber dokumentierte Änderung.

- `git reset --soft` funktioniert nur zuverlässig für Commits, die noch nicht an ein gemeinsames Repository gepusht wurden.
- Ein Debug-Rückstand wie `console.log` fällt beim `git show`-Diff sofort auf, wird aber leicht übersehen, wenn nur die Commit-Nachricht geprüft wird.

> **Merksatz:** Eine unklare Commit-Nachricht ist ein Hinweis, kein Beweis - der Diff zeigt, was wirklich passiert ist.

## Fazit

- `git show` macht den tatsächlichen Inhalt eines Commits unabhängig von seiner Nachricht sichtbar.
- Mehrere unsaubere, noch ungeteilte Commits lassen sich mit `reset --soft` zu einem klaren Commit zusammenfassen.
- Debug-Rückstände gehören vor dem Commit entfernt, nicht nachträglich toleriert.

Die Übung diagnostiziert die beiden Commits "wip" und "asdf" und ersetzt sie durch einen sauberen Commit.
