# Lab 6.3 - Lösung: Branch-, Remote- und Tagging-Strategie festlegen

## Aufgabe 1: Bisherige Branch-Namen

`feature/nav-highlight`, `feature/footer-tweak`, `feature/portal-title`, `feature/social-links`, `feature/team-photo-note` - durchgängig mit dem Präfix `feature/`.

## Aufgabe 2-5: Festlegungen (Beispielantwort)

- Branch-Namen: `feature/<kurzbeschreibung>` für neue Inhalte/Funktionen, `fix/<kurzbeschreibung>` für Korrekturen (z. B. `fix/footer-typo`).
- Merge-Strategie: Squash and Merge als Standard für Pull Requests, da einzelne Feature-Branches bisher aus wenigen, teils unsauberen Zwischenschritten bestanden (siehe Modul 2) und `main` dadurch pro Feature genau einen aussagekräftigen Commit erhält.
- Tagging: ein Tag `vX.Y` nach jedem abgeschlossenen thematischen Block; `v0.1` (Modul 4) markierte den Abschluss der ersten konfliktfreien Merges und passt zu dieser Regel.
- Ausnahmefall: eine dringende Korrektur darf direkt auf `main` committet werden, wenn sie eine einzelne Zeile betrifft und unmittelbar im Team kommuniziert wird; alle übrigen Änderungen durchlaufen einen Branch und Pull Request.

## Aufgabe 6-7: Dokumentation

```markdown
# Branch-, Remote- und Tagging-Strategie

## Branch-Namen
- `feature/<kurzbeschreibung>` fuer neue Inhalte/Funktionen
- `fix/<kurzbeschreibung>` fuer Korrekturen

## Merge-Strategie
Squash and Merge als Standard fuer Pull Requests.

## Tagging
Ein Tag `vX.Y` nach jedem abgeschlossenen thematischen Block.

## Ausnahmefall
Einzeilige, dringende Korrekturen duerfen direkt auf `main` erfolgen, mit sofortiger Kommunikation im Team.
```

```bash
git add STRATEGY.md
git commit -m "Branch-, Merge- und Tagging-Strategie dokumentieren"
```

## Erweiterung (Beispielantwort)

Ergänzende Regel: Ein Branch, der länger als eine Woche offen bleibt, ohne gemergt zu werden, wird im wöchentlichen Team-Austausch besprochen - entweder zügig fertiggestellt oder bewusst verworfen, um veraltete, divergierende Branches zu vermeiden.
