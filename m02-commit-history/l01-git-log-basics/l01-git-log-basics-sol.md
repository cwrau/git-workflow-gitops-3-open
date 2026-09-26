# Lab 2.1 - Lösung: Commit-Historie lesen und Revisionen abkürzen

## Aufgabe 1-4: Befehle und erwartete Ausgaben

Nach den vier Commits zeigt `git log --oneline` (neueste zuerst, Hashes exemplarisch):

```text
d4e5f6a Tippfehler korrigieren
c3d4e5f Notiz freigeben
b2c3d4e Notiz ueberarbeiten
a1b2c3d Erste Notiz anlegen
```

`git show HEAD~2` zeigt den Commit "Notiz ueberarbeiten" (`b2c3d4e`) mit dem Diff, der `notes.md` von "Entwurf" auf "Entwurf, Version 2" ändert.

`git log HEAD~3..HEAD~1` listet genau die Commits "Notiz ueberarbeiten" und "Notiz freigeben".

## Aufgabe 5: Tabelle

| Position | Gekürzter Hash | Nachricht | Inhalt von `notes.md` |
| --- | --- | --- | --- |
| `HEAD` | `d4e5f6a` | Tippfehler korrigieren | Freigegeben, Korrektur |
| `HEAD~1` | `c3d4e5f` | Notiz freigeben | Freigegeben |
| `HEAD~2` | `b2c3d4e` | Notiz ueberarbeiten | Entwurf, Version 2 |
| `HEAD~3` | `a1b2c3d` | Erste Notiz anlegen | Entwurf |

Die tatsächlichen Hash-Werte weichen je nach Ausführung ab (Zeitstempel und Autor-Daten fließen in den Hash ein); die Reihenfolge und Zuordnung zu `HEAD~n` bleibt gleich.

## Erweiterung (Beispielantwort)

`git log --oneline --graph` zeigt dieselben vier Commits zusätzlich mit einer einfachen vertikalen Linie (`*`) davor, da die Historie linear ist (kein Merge). Bei einer linearen Historie liefert der Graph keine zusätzliche Information gegenüber der reinen Liste - der Nutzen zeigt sich erst bei verzweigter Historie (Modul 4).
