# Lab 6.1 - Lösung: Pull Request erstellen und Review bearbeiten

## Aufgabe 1: Branch und Änderung

```bash
git switch -c feature/team-photo-note
# team.html: <p>Fotos folgen in Kuerze.</p> ergaenzen
git add team.html
git commit -m "Hinweis auf folgende Team-Fotos ergaenzen"
git push -u origin feature/team-photo-note
```

## Aufgabe 2: Pull Request eröffnen

Titel: "Hinweis auf folgende Team-Fotos". Beschreibung (Beispiel): "Ergänzt team.html um einen kurzen Hinweis, dass Fotos noch folgen, damit die Seite nicht unvollständig wirkt. Prüfung: team.html im Browser öffnen und den neuen Hinweistext sehen."

## Aufgabe 3-4: Review bearbeiten

Beispielkommentar: "Formulierung 'in Kuerze' wirkt unpräzise, besser mit konkretem Zeitraum." Antwort: Text zu "Fotos folgen im nächsten Quartal." ändern.

```bash
git add team.html
git commit -m "Formulierung des Foto-Hinweises praezisieren"
git push
```

Der bestehende Pull Request aktualisiert sich automatisch um den neuen Commit.

## Aufgabe 5-6: Merge und Aufräumen

Auf GitHub: "Squash and Merge" wählen, Branch löschen.

```bash
git switch main
git pull
git branch -d feature/team-photo-note
```

## Prüfung

```bash
git log --oneline -3
```

Zeigt genau einen neuen Commit für die gesamte Änderung (durch Squash), unabhängig davon, dass der Branch zwei Einzel-Commits enthielt.

## Erweiterung (Beispielantwort)

Mit "Rebase and Merge" erscheinen beide ursprünglichen Branch-Commits einzeln und linear in `main`, ohne zusätzlichen Merge-Commit - im Unterschied zu "Squash and Merge", das beide zu einem einzigen Commit zusammenfasst. Für dieses Kursprojekt ist Squash and Merge die bevorzugte Strategie, da die `main`-Historie pro Feature genau einen aussagekräftigen Commit zeigen soll (siehe Lab 6.3).
