---
theme: default
layout: default
---

# Lab 3.2: Build-Artefakte mit `.gitignore` ausschließen

Eine `.gitignore`-Datei einrichten, damit generierte oder lokale Dateien gar nicht erst versehentlich in die Historie gelangen.

**Leitfragen:**

<details>
<summary>Was passiert mit bereits committeten Dateien, wenn sie nachträglich in `.gitignore` eingetragen werden?</summary>

Nichts automatisch: `.gitignore` wirkt nur auf noch nicht versionierte Dateien. Bereits committete Dateien müssen zusätzlich mit `git rm --cached` aus der Versionskontrolle entfernt werden.

</details>

<details>
<summary>Warum lohnt sich `.gitignore` besonders für generierte Build-Ausgaben?</summary>

Build-Ausgaben lassen sich jederzeit neu erzeugen, blähen aber die Historie unnötig auf und können je nach Umgebung unterschiedlich ausfallen.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `.gitignore` | Datei mit Mustern für Pfade, die Git nicht als "untracked" anzeigt und nicht versehentlich mit `git add .` erfasst |
| Build-Artefakt | eine aus Quellcode generierte Ausgabedatei (z. B. ein Ordner mit erzeugten Dateien) |
| `git rm --cached` | entfernt eine Datei aus der Versionskontrolle, behält sie aber im Arbeitsverzeichnis |

## Muster in `.gitignore`

| Muster | Wirkung |
| --- | --- |
| `build/` | ignoriert den gesamten Ordner `build` |
| `*.log` | ignoriert alle Dateien mit der Endung `.log` |
| `!wichtig.log` | Ausnahme: diese eine Datei trotz vorheriger Regel nicht ignorieren |

## Ablauf für dieses Lab

```bash
mkdir build && echo "generierte Ausgabe" > build/output.txt
git status   # build/ erscheint als "untracked"

echo "build/" >> .gitignore
git status   # build/ erscheint nicht mehr

git add .gitignore
git commit -m ".gitignore fuer Build-Ordner ergaenzen"
```

- `.gitignore` selbst wird ganz normal versioniert - alle im Team profitieren von denselben Regeln.
- Wurde `build/` versehentlich bereits vor der `.gitignore`-Regel committet, entfernt `git rm -r --cached build/` den Ordner nachträglich aus der Versionskontrolle, ohne ihn lokal zu löschen.

> **Merksatz:** `.gitignore` verhindert neues Tracking, entfernt aber nichts, was bereits Teil der Historie ist.

## Fazit

- `.gitignore` hält generierte und lokale Dateien dauerhaft aus `git status`/`git add .` heraus.
- Bereits versionierte Dateien benötigen zusätzlich `git rm --cached`, um sie aus der Versionskontrolle zu lösen.
- `.gitignore` selbst gehört ins Repository, damit die Regeln für alle gelten.

Die Übung richtet `.gitignore` für einen simulierten Build-Ordner im Referenzprojekt ein.
