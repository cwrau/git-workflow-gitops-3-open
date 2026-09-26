---
theme: default
layout: default
---

# Lab 6.1: Pull Request erstellen und Review bearbeiten

Einen Pull Request auf GitHub eröffnen, Review-Kommentare einer zweiten Person bearbeiten und den Pull Request abschließend mergen.

**Leitfragen:**

<details>
<summary>Wodurch unterscheidet sich ein Pull Request von einem direkten `git merge` auf `main`?</summary>

Ein Pull Request macht die Änderung vor dem Zusammenführen sichtbar, kommentierbar und optional an automatisierte Prüfungen gebunden - ein direkter Merge überspringt diesen Zwischenschritt vollständig.

</details>

<details>
<summary>Was gehört in eine nachvollziehbare Pull-Request-Beschreibung?</summary>

Was sich ändert, warum, und wie sich die Änderung überprüfen lässt - genug Kontext für eine reviewende Person ohne Rückfrage.

</details>

<details>
<summary>Welche Merge-Strategien bietet GitHub für Pull Requests an?</summary>

Merge Commit (behält alle Einzel-Commits), Squash and Merge (fasst sie zu einem Commit zusammen), Rebase and Merge (setzt sie linear vor den Zielbranch).

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Pull Request (PR) | Vorschlag, einen Branch in einen anderen zu übernehmen, inklusive Review vor dem Merge |
| Review-Kommentar | gezielte Anmerkung zu einer bestimmten Zeile oder dem PR insgesamt |
| Merge Commit | behält alle Einzel-Commits des Branches, fügt einen zusätzlichen Merge-Commit hinzu |
| Squash and Merge | fasst alle Commits des Branches zu einem einzigen zusammen |

## Merge-Strategien im Vergleich

| Strategie | Effekt auf `main` |
| --- | --- |
| Merge Commit | vollständige Historie des Branches bleibt sichtbar |
| Squash and Merge | genau ein zusätzlicher Commit, unabhängig von der Anzahl der Branch-Commits |
| Rebase and Merge | Branch-Commits erscheinen linear, ohne zusätzlichen Merge-Commit |

## Ablauf für dieses Lab

```bash
git switch -c feature/team-photo-note
# team.html: Hinweis ergaenzen, dass Fotos folgen
git add team.html
git commit -m "Hinweis auf folgende Team-Fotos ergaenzen"
git push -u origin feature/team-photo-note
```

Auf GitHub: "Compare & pull request" wählen, Titel und Beschreibung ausfüllen, Reviewer zuweisen, nach Review-Kommentaren die Datei anpassen und erneut pushen (der bestehende Pull Request aktualisiert sich automatisch), abschließend mit "Squash and Merge" zusammenführen.

- Ein zusätzlicher Commit nach dem Öffnen des Pull Requests erscheint automatisch im selben PR, solange derselbe Branch weiter gepusht wird.
- Unter "Settings -> Branches" kann eine Regel verlangen, dass ein PR nur mergbar ist, wenn bestimmte automatisierte Prüfungen erfolgreich waren (Thema Modul 7/8).

> **Merksatz:** Ein Pull Request ist ein Vorschlag mit Historie - erst der Merge macht ihn endgültig.

## Fazit

- Ein Pull Request macht Zusammenarbeit sichtbar und überprüfbar, bevor eine Änderung endgültig wird.
- Squash and Merge hält die `main`-Historie unabhängig von der Anzahl der Zwischencommits übersichtlich.
- Review-Kommentare werden durch weitere Commits auf demselben Branch beantwortet, nicht durch einen neuen PR.

Die Übung eröffnet einen Pull Request, bearbeitet ein Review und schließt ihn per Squash and Merge ab.
