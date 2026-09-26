---
theme: default
layout: default
---

# Lab 4.3: Merge-Konflikt herbeiführen und auflösen

Zwei Branches verändern dieselbe Zeile unterschiedlich; der resultierende Merge-Konflikt wird verstanden, bewusst aufgelöst und das Ergebnis dokumentiert.

**Leitfragen:**

<details>
<summary>Wann entsteht ein Merge-Konflikt?</summary>

Wenn zwei Branches dieselbe Zeile (oder eng benachbarte Zeilen) derselben Datei unterschiedlich verändert haben und Git die Änderungen nicht automatisch kombinieren kann.

</details>

<details>
<summary>Was bedeuten die Markierungen `<<<<<<<`, `=======` und `>>>>>>>` in einer Konfliktdatei?</summary>

Sie grenzen die konkurrierenden Versionen ab: oberhalb von `=======` steht der aktuelle Branch-Stand, unterhalb bis `>>>>>>>` der eingemergte Stand.

</details>

<details>
<summary>Wie wird ein Konflikt als aufgelöst markiert?</summary>

Durch Entfernen aller Konfliktmarkierungen und anschließendes `git add` der bereinigten Datei, gefolgt von `git commit`.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Merge-Konflikt | Situation, in der Git zwei Änderungen an derselben Stelle nicht automatisch kombinieren kann |
| Konfliktmarkierung | `<<<<<<<`, `=======`, `>>>>>>>` in der betroffenen Datei |
| `git merge --abort` | bricht einen laufenden, konfliktbehafteten Merge vollständig ab und stellt den vorherigen Stand wieder her |

## Aufbau einer Konfliktstelle

```text
<<<<<<< HEAD
<h1>Kodschul Team Site</h1>
=======
<h1>Kodschul Team Portal</h1>
>>>>>>> feature/portal-title
```

| Bereich | Herkunft |
| --- | --- |
| zwischen `<<<<<<< HEAD` und `=======` | aktueller Branch (`main`) |
| zwischen `=======` und `>>>>>>> <branch>` | eingemergter Branch |

## Ablauf für dieses Lab

```bash
git switch main
git switch -c feature/portal-title
# index.html: <h1>Kodschul Team Site</h1> zu <h1>Kodschul Team Portal</h1> aendern
git add index.html
git commit -m "Titel zu Team Portal aendern"

git switch main
# index.html: <h1>Kodschul Team Site</h1> zu <h1>Kodschul Team Site - Uebersicht</h1> aendern
git add index.html
git commit -m "Titel um Uebersicht ergaenzen"

git merge feature/portal-title
# Konflikt in index.html
# Datei manuell bereinigen, Markierungen entfernen
git add index.html
git commit
```

- `git status` listet während eines laufenden Konflikts explizit alle betroffenen Dateien unter "Unmerged paths".
- Ein abgebrochener Merge (`--abort`) hinterlässt keine Spuren im Arbeitsverzeichnis - der Stand vor dem Merge-Versuch bleibt vollständig erhalten.

> **Merksatz:** Ein Merge-Konflikt ist kein Fehler, sondern Git, das eine Entscheidung bewusst an einen Menschen zurückgibt.

## Fazit

- Konflikte entstehen genau dann, wenn dieselbe Stelle unterschiedlich verändert wurde.
- Die drei Konfliktmarkierungen zeigen beide konkurrierenden Versionen nebeneinander.
- Nach der Bereinigung markieren `git add` und ein Commit den Konflikt als aufgelöst.

Die Übung provoziert bewusst einen Konflikt an der Überschrift der Startseite und löst ihn dokumentiert auf.
