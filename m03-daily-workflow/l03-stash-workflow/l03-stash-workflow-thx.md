---
theme: default
layout: default
---

# Lab 3.3: Unfertige Änderungen mit `git stash` sichern

Eine begonnene, aber unfertige Änderung beiseitelegen, den Kontext wechseln und die Änderung anschließend wiederherstellen.

**Leitfragen:**

<details>
<summary>Wofür eignet sich `git stash`?</summary>

Um unfertige, noch nicht committete Änderungen vorübergehend beiseitezulegen, ohne sie zu committen oder zu verwerfen - z. B. bei einer dringenden Zwischenaufgabe.

</details>

<details>
<summary>Was passiert mit gestashten Änderungen bei `git stash pop`?</summary>

Sie werden auf den aktuellen Stand angewendet und aus dem Stash-Speicher entfernt.

</details>

<details>
<summary>Worin unterscheiden sich `git stash pop` und `git stash apply`?</summary>

`pop` wendet die Änderung an und löscht den Stash-Eintrag danach; `apply` wendet sie an, behält den Eintrag aber zusätzlich im Stash-Speicher.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git stash` | legt unfertige Änderungen beiseite und stellt ein sauberes Arbeitsverzeichnis wieder her |
| `git stash list` | zeigt alle aktuell gesicherten Stash-Einträge |
| `git stash pop` | wendet den obersten Stash-Eintrag an und entfernt ihn |
| `git stash apply` | wendet den obersten Stash-Eintrag an, behält ihn aber im Speicher |

## Typischer Ablauf

```bash
# waehrend einer unfertigen Aenderung:
git stash

# Kontext wechseln, z. B. dringende Korrektur auf demselben Branch
git status   # sauberes Arbeitsverzeichnis

# zurueck zur unfertigen Aenderung:
git stash list
git stash pop
```

- Mehrere Stash-Einträge lassen sich mit `git stash list` unterscheiden; ein konkreter Eintrag wird über `git stash pop stash@{1}` gezielt angesprochen.
- Ein Stash-Eintrag ist repository-lokal und verschwindet nicht automatisch - unbenutzte Einträge sammeln sich sonst über Zeit an.

> **Merksatz:** `git stash` ist ein temporärer Zwischenspeicher, kein Ersatz für einen Commit.

## Fazit

- `git stash` erlaubt einen sauberen Kontextwechsel, ohne unfertige Arbeit zu verlieren.
- `pop` und `apply` unterscheiden sich darin, ob der Stash-Eintrag danach weiterhin existiert.
- Alte, nicht mehr benötigte Stash-Einträge sollten gezielt entfernt werden (`git stash drop`).

Die Übung stasht eine unfertige Änderung, wechselt den Kontext und stellt sie danach wieder her.
