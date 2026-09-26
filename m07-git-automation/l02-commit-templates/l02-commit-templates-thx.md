---
theme: default
layout: default
---

# Lab 7.2: Commit-Vorlage einrichten

Eine Commit-Vorlage konfigurieren, die beim Erstellen jedes neuen Commits eine feste Struktur vorschlägt.

**Leitfragen:**

<details>
<summary>Was macht `git config commit.template`?</summary>

Es hinterlegt eine Datei, deren Inhalt beim Aufruf von `git commit` (ohne `-m`) als vorausgefüllter Text im Editor erscheint.

</details>

<details>
<summary>Wieso ändert eine Commit-Vorlage nichts an bereits vorhandenen Commits?</summary>

Sie wirkt nur beim Erstellen neuer Commits über den Editor, nicht rückwirkend auf die bestehende Historie.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Commit-Vorlage | vorausgefüllte Textstruktur für neue Commit-Nachrichten |
| `git config commit.template <pfad>` | hinterlegt die zu verwendende Vorlagendatei |

## Beispielvorlage

```text
# Kurzbeschreibung (max. 50 Zeichen)

# Warum ist diese Aenderung noetig?

# Wie wurde sie getestet/geprueft?
```

Zeilen mit `#` erscheinen im Editor als Hinweis, werden aber wie bei jeder Commit-Nachricht automatisch entfernt, wenn sie nicht bearbeitet werden.

## Ablauf für dieses Lab

```bash
git config commit.template .gitmessage.txt
git commit
```

- Die Vorlage gilt nur für dieses eine Repository, solange `git config` ohne `--global` ausgeführt wird.
- Wird weiterhin `git commit -m "..."` verwendet, greift die Vorlage nicht - sie wirkt ausschließlich beim editorgestützten Commit ohne `-m`.

> **Merksatz:** Eine Commit-Vorlage erinnert an eine gute Struktur, erzwingt sie aber nicht - Disziplin bleibt weiterhin nötig.

## Fazit

- Eine Commit-Vorlage strukturiert neue Commit-Nachrichten, ohne bestehende zu verändern.
- Sie wirkt nur beim editorgestützten Commit, nicht bei `git commit -m`.
- `#`-Zeilen dienen als Hinweistext und verschwinden automatisch aus der endgültigen Nachricht.

Die Übung richtet eine Commit-Vorlage ein und vergleicht Commits mit und ohne deren Nutzung.
