---
theme: default
layout: default
---

# Lab 6.3: Branch-, Remote- und Tagging-Strategie festlegen

Eine begründete, dokumentierte Strategie für Branch-Namen, Merge-Vorgehen und Tags für das Referenzprojekt entwerfen.

**Leitfragen:**

<details>
<summary>Wonach richtet sich die Wahl zwischen Squash, Merge Commit und Rebase als Standardstrategie?</summary>

Nach Teamgröße, gewünschter Detailtiefe der `main`-Historie und ob Zwischenschritte einzelner Personen später noch relevant sein sollen.

</details>

<details>
<summary>Warum lohnt sich eine einheitliche Branch-Namenskonvention (z. B. `feature/...`, `fix/...`)?</summary>

Sie macht auf einen Blick erkennbar, welche Art von Änderung ein Branch enthält, auch bei vielen gleichzeitig offenen Branches.

</details>

<details>
<summary>Wann lohnt sich ein Tag zusätzlich zu regulären Commits?</summary>

Wenn ein bestimmter Stand dauerhaft und eindeutig wiederauffindbar bleiben soll, unabhängig von der weiteren Entwicklung des Branches.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Branch-Namenskonvention | einheitliches Präfix-Schema wie `feature/`, `fix/`, `docs/` |
| Merge-Strategie | Festlegung, wie Branches standardmäßig in `main` übernommen werden |
| Tagging-Strategie | Regel, wann und wie ein Stand mit einem Tag markiert wird |

## Beispielhafte Strategie-Bausteine

| Bereich | Mögliche Festlegung |
| --- | --- |
| Branch-Namen | `feature/<kurzbeschreibung>`, `fix/<kurzbeschreibung>` |
| Standard-Merge-Strategie | Squash and Merge für Feature-Branches |
| Tagging | ein Tag `vX.Y` nach jedem inhaltlich abgeschlossenen Meilenstein |
| Aufräumen | gemergte Branches zeitnah lokal und remote löschen |

Das Referenzprojekt hat bereits `feature/`-Branches (Module 4-6) und einen Tag `v0.1` (Modul 4) verwendet - die hier entworfene Strategie macht dieses bisherige Vorgehen explizit und für weitere Beteiligte nachvollziehbar.

- Eine Strategie ohne Ausnahmefall-Regelung (z. B. dringende Korrekturen außerhalb des üblichen Branch-Namensschemas) wird in der Praxis häufig unterlaufen.
- Eine zu starre Strategie für ein sehr kleines Team kann mehr Aufwand erzeugen, als sie einspart.

> **Merksatz:** Eine Strategie ist nur so wirksam wie ihre Dokumentation - unbekannte Konventionen werden nicht befolgt.

## Fazit

- Eine dokumentierte Strategie macht bisher implizite Konventionen (Präfixe, Merge-Art, Tags) explizit nachvollziehbar.
- Sie sollte Ausnahmefälle benennen, nicht nur den Regelfall.
- Bereits genutzte Muster im Referenzprojekt liefern die Grundlage für die Formulierung.

Die Übung dokumentiert eine Strategie für das Referenzprojekt basierend auf den bisher genutzten Mustern.
