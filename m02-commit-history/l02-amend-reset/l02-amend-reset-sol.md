# Lab 2.2 - Lösung: Fehler mit `commit --amend` und `reset` beheben

## Aufgabe 1-3: Team-Bio ergänzen und Nachricht korrigieren

```bash
# team.html: <li>Team-Mitglied D - Qualitaetssicherung</li> ergaenzen
git add team.html
git commit -m "update"
git commit --amend -m "Team-Bio fuer Mitglied D ergaenzen"
```

`git log -1` zeigt danach nur die korrigierte Nachricht; der ursprüngliche Commit "update" ist nicht mehr Teil der Historie, da `--amend` ihn ersetzt statt ergänzt.

## Aufgabe 4-5: Fußzeile nachträglich vervollständigen

```bash
# index.html: <p>&copy; 2026</p> vor </main> ergaenzen
git add index.html
git commit -m "Fusszeile ergaenzen"

git reset --soft HEAD~1
# styles.css: z. B. "footer { text-align: center; }" ergaenzen (footer-Element in index.html analog ergaenzen)
git add index.html styles.css
git commit -m "Fusszeile mit Copyright-Angabe und Styling ergaenzen"
```

`git status` nach `reset --soft` zeigt `index.html` weiterhin als gestaged - die Änderung ging nicht verloren, nur der Commit selbst wurde zurückgenommen.

## Aufgabe 6: Finale Historie

```bash
git log --oneline
```

Erwartete Ausgabe (sechs Commits, neueste zuerst): "Fusszeile mit Copyright-Angabe und Styling ergaenzen", "Team-Bio fuer Mitglied D ergaenzen", gefolgt von den vier Commits aus Modul 1. Keine Zeile enthält "update".

## Erweiterung (Beispielantwort)

Nach `git reset --mixed HEAD~1` zeigt `git status` dieselben Dateien als "Changes not staged for commit" statt "Changes to be committed" - der Inhalt ist identisch erhalten, nur der Staging-Status unterscheidet sich von `--soft`.

## Häufige Stolperfalle

Wird `git reset --hard` anstelle von `--soft` verwendet, gehen die Änderungen an `index.html` vollständig verloren und müssen erneut eingegeben werden. `--hard` ist nur sinnvoll, wenn eine Änderung bewusst verworfen werden soll.
