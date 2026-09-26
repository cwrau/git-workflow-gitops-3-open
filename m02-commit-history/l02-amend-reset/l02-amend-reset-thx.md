---
theme: default
layout: default
---

# Lab 2.2: Fehler mit `commit --amend` und `reset` beheben

Eine unpräzise Commit-Nachricht nachträglich korrigieren und einen zu früh erstellten Commit gezielt zurücknehmen, ohne Änderungen zu verlieren.

**Leitfragen:**

<details>
<summary>Was macht `git commit --amend`?</summary>

Es ersetzt den letzten Commit durch eine neue Version (z. B. andere Nachricht oder zusätzliche Änderungen) statt einen weiteren Commit anzuhängen.

</details>

<details>
<summary>Worin unterscheiden sich `git reset --soft` und `git reset --mixed`?</summary>

`--soft` nimmt den Commit zurück, belässt die Änderungen aber gestaged; `--mixed` (Standard) nimmt den Commit zurück und entfernt die Änderungen zusätzlich aus dem Staging-Bereich, ohne sie im Arbeitsverzeichnis zu löschen.

</details>

<details>
<summary>Warum ist `commit --amend` nach einem bereits geteilten Commit riskant?</summary>

Amend erzeugt einen neuen Commit-Hash; wurde der alte Commit bereits an ein gemeinsames Repository gepusht, entsteht eine abweichende Historie, die für andere Personen zu Konflikten führt.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git commit --amend` | ersetzt den letzten Commit statt einen neuen anzuhängen |
| `git reset --soft <ref>` | Commit(s) zurücknehmen, Änderungen bleiben gestaged |
| `git reset --mixed <ref>` | Commit(s) zurücknehmen, Änderungen bleiben im Arbeitsverzeichnis, aber ungestaged |
| `git reset --hard <ref>` | Commit(s) und alle zugehörigen Änderungen vollständig verwerfen |

## Die drei `reset`-Modi im Vergleich

| Modus | Commit | Staging-Bereich | Arbeitsverzeichnis |
| --- | --- | --- | --- |
| `--soft` | zurückgenommen | Änderungen bleiben gestaged | unverändert |
| `--mixed` (Standard) | zurückgenommen | Änderungen werden ungestaged | unverändert |
| `--hard` | zurückgenommen | geleert | Änderungen gehen verloren |

## Ablauf für dieses Lab

```bash
# Nachricht eines Tippfehler-Commits korrigieren
git commit --amend -m "Team-Bio fuer Mitglied D ergaenzen"

# Commit zu frueh erstellt, Datei vergessen zu stagen
git reset --soft HEAD~1
git add team.html
git commit -m "Team-Bio fuer Mitglied D ergaenzen"
```

- `--hard` ist im gemeinsamen Referenzprojekt nur mit Bedacht zu verwenden, da nicht gestagete Änderungen dabei endgültig verloren gehen.
- `git commit --amend` ohne `-m` öffnet den konfigurierten Editor mit der bisherigen Nachricht zum Bearbeiten.

> **Merksatz:** `--soft` ist der sichere Rückweg, wenn nur die Commit-Grenze falsch war, nicht der Inhalt der Änderung.

## Fazit

- `--amend` korrigiert den letzten Commit, ohne die Historie um einen weiteren Eintrag zu verlängern.
- `reset --soft` nimmt einen Commit zurück, ohne bereits geleistete Arbeit zu verlieren.
- Beide Befehle verändern bereits geschriebene Historie - vor einem `push` unproblematisch, danach mit Vorsicht zu verwenden.

Die Übung wendet beide Befehle auf zwei absichtlich unpräzise Commits im Referenzprojekt an.
