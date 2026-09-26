---
theme: default
layout: default
---

# Lab 4.2: Branches taggen, löschen und konfliktfrei zusammenführen

Zwei unabhängige Änderungen auf getrennten Branches vornehmen, konfliktfrei in `main` zusammenführen, den Stand markieren und nicht mehr benötigte Branches aufräumen.

**Leitfragen:**

<details>
<summary>Warum verläuft ein Merge hier ohne Konflikt?</summary>

Beide Branches verändern unterschiedliche Zeilen in unterschiedlichen Dateien - Git kann beide Änderungen automatisch kombinieren.

</details>

<details>
<summary>Wofür eignet sich ein Tag wie `v0.1`?</summary>

Um einen bestimmten Commit dauerhaft und aussagekräftig benannt wiederzufinden, unabhängig davon, wie sich `main` danach weiterentwickelt.

</details>

<details>
<summary>Warum lassen sich gemergte Branches gefahrlos löschen?</summary>

Ihre Commits sind über `main` weiterhin erreichbar; der Branch-Name selbst ist nach dem Merge nur noch ein zusätzlicher, nicht mehr benötigter Zeiger.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git merge <branch>` | führt die Commits eines Branches in den aktuellen Branch zusammen |
| Fast-Forward-Merge | Merge ohne eigenen Merge-Commit, wenn der Zielbranch seither keine eigenen Commits erhielt |
| `git tag <name>` | markiert einen Commit dauerhaft mit einem Namen |
| `git branch -d <name>` | löscht einen bereits gemergten Branch |

## Ablauf für dieses Lab

```bash
git switch feature/nav-highlight
# styles.css: nav-Link-Farbe beim Hover aendern
git add styles.css
git commit -m "Hover-Farbe fuer Navigationslinks ergaenzen"

git switch feature/footer-tweak
# index.html: Fusszeilentext ergaenzen
git add index.html
git commit -m "Fusszeilentext praezisieren"

git switch main
git merge feature/nav-highlight
git merge feature/footer-tweak

git tag v0.1
git branch -d feature/nav-highlight feature/footer-tweak
```

- Ein Fast-Forward-Merge verschiebt lediglich den Zeiger von `main`; ein regulärer Merge-Commit entsteht nur, wenn `main` zwischenzeitlich eigene Commits erhalten hat.
- `git branch -d` verweigert das Löschen eines noch nicht gemergten Branches - das schützt vor versehentlichem Verlust unfertiger Arbeit.

> **Merksatz:** Ein Tag verschiebt sich nie von selbst - anders als ein Branch bleibt er dauerhaft am markierten Commit.

## Fazit

- Änderungen an unterschiedlichen Stellen lassen sich automatisch, ohne manuelles Eingreifen zusammenführen.
- Ein Tag markiert einen Stand dauerhaft, unabhängig von der weiteren Entwicklung von `main`.
- Gemergte Branches lassen sich gefahrlos löschen, da ihre Commits über `main` erreichbar bleiben.

Die Übung führt zwei unabhängige Änderungen zusammen, markiert das Ergebnis und räumt die Branches auf.
