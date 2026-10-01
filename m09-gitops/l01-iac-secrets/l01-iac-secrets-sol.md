# Lab 9.1 - Lösung: Deklarative Infrastruktur und Secrets einordnen

## Aufgabe 1: Deklarativ vs. imperativ

| Beispiel | Einordnung | Begründung |
| --- | --- | --- |
| a. "Image-Version 1.2, 3 Replicas" | deklarativ | beschreibt den gewünschten Zielzustand, nicht die Schritte dorthin |
| b. drei `docker run`-Befehle nacheinander | imperativ | beschreibt konkrete Ausführungsschritte in fester Reihenfolge |
| c. "Service auf Port 80 erreichbar" | deklarativ | beschreibt das gewünschte Ergebnis, nicht den Konfigurationsweg |
| d. Runbook mit manuellen Neustart-Schritten | imperativ | beschreibt eine Schrittfolge, die eine Person manuell ausführt |

## Aufgabe 2: Secret-Handling

| Beispiel | Einordnung | Begründung |
| --- | --- | --- |
| e. API-Schlüssel im Klartext, committet | unsicher | bleibt dauerhaft in der Git-Historie auffindbar, auch nach Entfernen |
| f. API-Schlüssel über separates, nicht versioniertes Secret-Objekt | angemessen | der geheime Wert gelangt nie in die versionierte Historie |

## Aufgabe 3: Begründungen

Siehe Tabellenspalte "Begründung" oben - jede Zeile bezieht sich auf ein konkretes, beobachtbares Merkmal (Zielzustand vs. Schrittfolge; dauerhafte Historie vs. getrenntes Objekt), nicht auf einen allgemeinen Eindruck.

## Erweiterung (Beispielantwort)

Beispiel: "Eine Konfigurationsdatei legt fest, dass ein Datenbank-Cluster aus fünf Knoten besteht, unabhängig davon, wie viele davon aktuell laufen." Einordnung: deklarativ, da der Zielzustand (fünf Knoten) beschrieben wird und ein Kontrollmechanismus selbstständig für die Angleichung sorgt - genau dieses Prinzip liegt auch der GitOps-Bereitstellung in Lab 9.2/9.3 zugrunde.
