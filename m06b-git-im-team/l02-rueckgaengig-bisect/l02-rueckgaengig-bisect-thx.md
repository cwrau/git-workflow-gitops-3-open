---
theme: default
layout: default
---

# Lab 6b.2: Rückgängig machen und Fehler finden

Änderungen mit `restore` und `revert` zurücknehmen, mit `reflog` verlorene Stände wiederfinden und mit `bisect`, `blame` und `log -S` den Commit finden, der einen Fehler eingeführt hat.

**Leitfragen:**

<details>
<summary>Wann nimmt man `revert` und wann `reset`?</summary>

`revert` erzeugt einen neuen Commit, der einen früheren zurücknimmt, und eignet sich für bereits geteilte Commits. `reset` verschiebt den Branch und schreibt damit Historie um, deshalb nur für lokale, noch nicht geteilte Commits.

</details>

<details>
<summary>Wie holt man Commits nach einem `reset --hard` zurück?</summary>

Mit `git reflog`: Es listet die letzten Positionen von `HEAD`. Der frühere Stand wird mit `git reset --hard <hash>` oder `HEAD@{n}` wiederhergestellt, solange der Eintrag noch nicht verfallen ist.

</details>

<details>
<summary>Wie findet man den Commit, der einen Fehler eingeführt hat?</summary>

Mit `git bisect`: Git halbiert die Historie zwischen einem guten und einem schlechten Commit, bis der erste schlechte feststeht. Mit `git bisect run <befehl>` läuft das automatisch.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git restore <datei>` | verwirft Änderungen im Arbeitsverzeichnis (nicht rückholbar) |
| `git restore --staged <datei>` | nimmt eine Datei aus dem Staging-Bereich |
| `git revert <commit>` | erzeugt einen Commit, der den angegebenen zurücknimmt |
| `git reflog` | lokales Protokoll der Positionen von `HEAD` |
| `git bisect` | binäre Suche nach dem Commit, der einen Fehler eingeführt hat |
| `git blame <datei>` | zeigt je Zeile den letzten ändernden Commit |
| `git log -S<text>` | findet Commits, die das Vorkommen von `<text>` ändern |

## Situation und Befehl

| Situation | Befehl |
| --- | --- |
| Änderung in der Datei verwerfen | `git restore <datei>` |
| Datei aus dem Staging nehmen | `git restore --staged <datei>` |
| Geteilten Commit zurücknehmen | `git revert <commit>` |
| Verlorenen Stand wiederfinden | `git reflog` |
| Fehlerhaften Commit finden | `git bisect run <befehl>` |
| Wer hat die Zeile geändert, wann kam der Text dazu | `git blame <datei>`, `git log -S"<text>"` |

## Ablauf für dieses Lab

```bash
git restore log.txt
git revert --no-edit HEAD
git reflog
git bisect start
git bisect bad
git bisect good <commit>
git bisect run sh pruefen.sh
git bisect reset
```

- `bisect run` wertet den Exit-Code des Befehls aus: `0` ist gut, ein Wert von `1` bis `127` (außer `125`) ist schlecht.
- Der Reflog ist lokal und verfällt nach einiger Zeit, er ersetzt keine Sicherung.

> **Merksatz:** Geteilte Commits macht man mit `revert` rückgängig, nicht mit `reset`. `reflog` ist das Netz für lokale Fehler.

## Fazit

- `restore` verwirft Änderungen oder Staging, `revert` nimmt einen Commit durch einen neuen Commit zurück.
- `reflog` findet verlorene Stände wieder, solange sie lokal vorhanden sind.
- `bisect`, `blame` und `log -S` führen zum Commit, der einen Fehler eingeführt hat.

Die Übung nutzt ein vorbereitetes Repository mit zwölf Commits, von denen einer einen Fehler enthält.
