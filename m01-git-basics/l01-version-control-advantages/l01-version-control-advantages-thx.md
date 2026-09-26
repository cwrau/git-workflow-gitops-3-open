---
theme: default
layout: default
---

# Lab 1.1: Versionskontrolle einordnen

Change-Management-Prinzipien erklären, warum Versionskontrolle mehr leistet als manuelles Kopieren von Ordnern. Dieses Lab ordnet vier Alltagssituationen den passenden Prinzipien zu.

**Leitfragen:**

<details>
<summary>Was bedeutet "Change Management" im Kontext von Software?</summary>

Der kontrollierte Umgang mit Änderungen: wer hat wann was geändert, warum, und wie lässt sich das nachvollziehen oder rückgängig machen.

</details>

<details>
<summary>Welche vier Grundprinzipien deckt Versionskontrolle ab?</summary>

Änderungen rückgängig machen können, Audit-Trails (wer/wann/was), reproduzierbare Software-Stände und Zusammenarbeit ohne gegenseitiges Überschreiben.

</details>

<details>
<summary>Warum reicht ein Ordner mit Dateikopien wie "seite_final_v3.zip" nicht aus?</summary>

Es fehlt die Nachvollziehbarkeit: kein Zeitpunkt, kein Grund, keine Garantie, dass "final" wirklich final ist, kein einfacher Weg zurück zu einer älteren Version.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Versionskontrolle | System, das Änderungen an Dateien über Zeit nachvollziehbar macht |
| Change Management | kontrollierter Umgang mit Änderungen an einem System |
| Audit-Trail | lückenlose Nachvollziehbarkeit, wer wann was geändert hat |
| Reproduzierbarkeit | ein exakter früherer Stand lässt sich zuverlässig wiederherstellen |
| Repository | der Ort, an dem Git die gesamte Historie eines Projekts speichert |
| Commit | ein gespeicherter, beschrifteter Schnappschuss von Änderungen |

## Manuelles Kopieren vs. Versionskontrolle

| Kriterium | Ordner-Kopien (`_v1`, `_final`, ...) | Versionskontrolle (Git) |
| --- | --- | --- |
| Wer hat was geändert? | nicht nachvollziehbar | jeder Commit hat Autor und Zeitpunkt |
| Änderung rückgängig machen | manuelles Suchen der richtigen Kopie | gezielter Commit oder Datei wiederherstellen |
| Grund einer Änderung | oft nur im Gedächtnis oder E-Mail | Commit-Nachricht dokumentiert den Grund |
| Zusammenarbeit mehrerer Personen | Überschreiben, Chaos bei parallelen Kopien | nachvollziehbare, zusammenführbare Änderungen |

Das Referenzprojekt für den gesamten Kurs ist die Kodschul Team Site, eine kleine statische Website (HTML/CSS/JavaScript) ohne Build-Werkzeuge.

- Versionskontrolle ersetzt Disziplin nicht vollständig: unklare Commit-Nachrichten bleiben ein Problem, auch mit Git.
- Ein Repository ohne jemals committete Änderungen bietet noch keinen Nutzen; der Wert entsteht erst durch regelmäßige, aussagekräftige Commits.

> **Merksatz:** Versionskontrolle beantwortet zuverlässig drei Fragen: Was hat sich geändert, warum, und wie kommt man zurück?

## Fazit

- Change Management bedeutet: Änderungen sind nachvollziehbar, rückgängig machbar und dokumentiert.
- Ordnerkopien lösen keines der vier Grundprinzipien zuverlässig.
- Die Kodschul Team Site begleitet ab Lab 1.2 den gesamten Kurs als gemeinsames Referenzprojekt.

Die Übung ordnet vier Situationen diesen Prinzipien zu und begründet die Einordnung.
