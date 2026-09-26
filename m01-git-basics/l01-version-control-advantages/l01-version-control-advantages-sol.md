# Lab 1.1 - Lösung: Versionskontrolle einordnen

## Aufgabe 1 und 2: Zuordnung und Begründung

| Situation | Prinzip | Lösungsidee mit Git |
| --- | --- | --- |
| 1. `teamsite_final_v3_wirklich_final.zip` per E-Mail | Reproduzierbarkeit | Ein Commit markiert einen eindeutigen, benannten Stand; `git tag` kann einen Release-Stand zusätzlich fest verankern. |
| 2. Fehlerbehebung vor drei Wochen muss zurückgenommen werden | Rückgängigmachen | `git log` zeigt den betroffenen Commit, `git revert <commit>` macht genau diese Änderung rückgängig, ohne andere Historie zu verlieren. |
| 3. Prüfer fragt nach Änderungen an einer Konfigurationsdatei | Audit-Trail | `git log -- <datei>` zeigt jeden Commit, der die Datei verändert hat, inklusive Autor, Zeitpunkt und Commit-Nachricht. |
| 4. Zwei Personen überschreiben sich gegenseitig auf einem Netzlaufwerk | Zusammenarbeit ohne Überschreiben | Jede Person committet eigene Änderungen; Git erkennt überlappende Änderungen beim Zusammenführen und verlangt eine bewusste Konfliktauflösung statt stillem Überschreiben. |

## Aufgabe 3: Begründung der Zuordnung

- Situation 1 betrifft die Frage "Ist dieser Stand wirklich zuverlässig identifizierbar?" - das ist Reproduzierbarkeit, nicht Audit-Trail, weil hier kein Änderungsverlauf gefragt ist, sondern ein eindeutiger Endstand.
- Situation 2 betrifft ausdrücklich das Zurücknehmen einer bekannten, aber unklar lokalisierten Änderung.
- Situation 3 fragt explizit nach Wer/Wann/Warum - der Kernfall eines Audit-Trails.
- Situation 4 betrifft paralleles Arbeiten, nicht einen einzelnen Stand - daher Zusammenarbeit statt Reproduzierbarkeit.

## Erweiterung (Beispielantwort)

Beispiel für eine fünfte Situation: "Ein Praktikant löscht versehentlich eine wichtige Konfigurationsdatei kurz vor einem Kundentermin." Prinzip: Rückgängigmachen. Lösungsidee: Die Datei existiert im letzten Commit weiterhin und lässt sich mit `git checkout <commit> -- <datei>` wiederherstellen, ohne ein Backup außerhalb des Repositorys zu benötigen.
