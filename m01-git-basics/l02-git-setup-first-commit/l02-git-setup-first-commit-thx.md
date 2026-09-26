---
theme: default
layout: default
---

# Lab 1.2: Git einrichten und ersten Commit erstellen

Ein neues lokales Repository für die Kodschul Team Site entsteht: Konfiguration, `git init`, erster Commit.

**Leitfragen:**

<details>
<summary>Was unterscheidet Arbeitsverzeichnis, Staging-Bereich und Repository?</summary>

Das Arbeitsverzeichnis enthält die aktuellen Dateien, der Staging-Bereich sammelt die für den nächsten Commit vorgesehenen Änderungen, das Repository speichert alle bisherigen Commits dauerhaft.

</details>

<details>
<summary>Warum muss Git vor dem ersten Commit konfiguriert werden?</summary>

Jeder Commit speichert Autor-Name und -E-Mail. Ohne Konfiguration nutzt Git einen generischen Systemwert, der die Nachvollziehbarkeit (Audit-Trail) untergräbt.

</details>

<details>
<summary>Was macht `git init` konkret?</summary>

Es legt im aktuellen Ordner ein verstecktes `.git`-Verzeichnis an, das ab diesem Zeitpunkt die gesamte Historie speichert - der Ordner selbst bleibt unverändert nutzbar.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git init` | initialisiert ein neues, leeres Repository im aktuellen Ordner |
| `git config` | setzt Einstellungen wie Autor-Name und -E-Mail (`--global` oder pro Repository) |
| Arbeitsverzeichnis | die tatsächlichen Dateien auf der Festplatte |
| Staging-Bereich (Index) | Zwischenschritt: für den nächsten Commit vorgemerkte Änderungen |
| `git add` | verschiebt Änderungen vom Arbeitsverzeichnis in den Staging-Bereich |
| `git commit` | speichert die gestagten Änderungen dauerhaft mit einer Nachricht |

## Die drei Bereiche im Überblick

```mermaid
flowchart LR
  A[Arbeitsverzeichnis] -- "git add" --> B[Staging-Bereich]
  B -- "git commit" --> C[Repository / Historie]
```

`git add` und `git commit` sind zwei getrennte Schritte, damit gezielt ausgewählt werden kann, welche Änderungen tatsächlich in den nächsten Commit gehören.

## Konfiguration: global vs. lokal

| Ebene | Befehl | Gilt für |
| --- | --- | --- |
| Global | `git config --global user.name "..."` | alle Repositories dieses Benutzerkontos |
| Lokal | `git config user.name "..."` (im Repository ausgeführt) | nur das aktuelle Repository |

Eine lokale Einstellung überschreibt die globale für dieses eine Repository - nützlich, wenn dienstliche und private Projekte unterschiedliche Identitäten benötigen.

## Ablauf für den ersten Commit

```bash
git config --global user.name "Vorname Nachname"
git config --global user.email "name@example.com"
mkdir teamsite && cd teamsite
git init
git add .
git commit -m "Erste Version der Kodschul Team Site"
git log
```

- Ohne vorherige Konfiguration bricht `git commit` mit einer Fehlermeldung ab oder verwendet einen irreführenden Platzhalter-Autor, je nach Git-Version.
- `git status` vor jedem Commit zeigt, welche Dateien gestaged sind - das verhindert unbeabsichtigt fehlende oder überzählige Dateien im Commit.

> **Merksatz:** Ein Commit enthält immer genau das, was zuvor mit `git add` gestaged wurde - nicht automatisch den gesamten Ordnerinhalt.

## Fazit

- `git init` erzeugt ein leeres Repository, ohne bestehende Dateien zu verändern.
- Autor-Konfiguration vor dem ersten Commit sichert einen brauchbaren Audit-Trail.
- `git add` und `git commit` sind bewusst getrennte Schritte: Staging vor Speichern.

Die Übung richtet ein neues Repository ein und erstellt den ersten Commit der Kodschul Team Site.
