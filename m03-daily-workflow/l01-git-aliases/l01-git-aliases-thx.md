---
theme: default
layout: default
---

# Lab 3.1: Aliases für den täglichen Git-Workflow

Häufig genutzte Git-Befehle über kurze, selbst definierte Aliase ansprechbar machen.

**Leitfragen:**

<details>
<summary>Wo speichert Git Aliase standardmäßig?</summary>

In der Git-Konfiguration (`~/.gitconfig` bei globaler Konfiguration), unter dem Abschnitt `[alias]`.

</details>

<details>
<summary>Worin unterscheidet sich ein Git-Alias von einem Shell-Alias?</summary>

Ein Git-Alias funktioniert nur innerhalb von `git ...`-Aufrufen und ist damit unabhängig von der verwendeten Shell oder dem Betriebssystem übertragbar.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Git-Alias | Kurzform für einen längeren Git-Befehl, definiert über `git config alias.<name> "<befehl>"` |
| `~/.gitconfig` | globale, benutzerweite Git-Konfigurationsdatei |

## Beispiele für gängige Aliase

| Alias | Ausgeführter Befehl | Nutzen |
| --- | --- | --- |
| `git st` | `git status` | schneller Status-Check |
| `git co` | `git checkout` | kürzeres Wechseln von Branches/Dateien |
| `git lg` | `git log --oneline --graph --decorate` | kompakte, visuelle Historie |
| `git last` | `git log -1 HEAD` | letzten Commit direkt ansehen |

## Aliase anlegen

```bash
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --decorate"
```

- Aliase mit mehreren Wörtern benötigen Anführungszeichen, einzelne Wörter nicht.
- `git config --global --get-regexp alias` listet alle aktuell definierten Aliase auf.

> **Merksatz:** Ein Alias lohnt sich für jeden Befehl, der mehrmals täglich in derselben Form getippt wird.

## Fazit

- Aliase sind projektunabhängig, sobald sie global gesetzt sind.
- Kurze Aliase für `status`, `log` und `checkout` sparen im Alltag die meiste Tipparbeit.
- `git config --global --get-regexp alias` macht bestehende Aliase jederzeit nachvollziehbar.

Die Übung definiert eigene Aliase und vergleicht sie mit den vollständigen Befehlen.
