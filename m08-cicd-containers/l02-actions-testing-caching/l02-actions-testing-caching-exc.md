# Lab 8.2 - Übung: Workflow um Tests, Caching und Service-Container erweitern

Diese Übung erweitert `.github/workflows/lint.yml` aus Modul 7 um echte Prüfungen.

## Ausgangslage

Das `teamsite`-Repository mit dem bestehenden Workflow `.github/workflows/lint.yml` aus Lab 7.3.

## Aufgaben

1. Den bestehenden Workflow um zwei echte Test-Steps erweitern: Prüfung, dass `index.html` existiert (`test -f index.html`), und Prüfung, dass die Datei ein `<title>`-Element enthält (`grep -q "<title>" index.html`).
2. Einen Caching-Step mit `actions/cache@v4` für ein beliebiges Verzeichnis (z. B. `.cache`) mit einem festen Key ergänzen.
3. Einen Service-Container `httpbin` (Image `mccutchen/go-httpbin:2.25.0`, Port 8080) im Job ergänzen.
4. Einen weiteren Step ergänzen, der mit `curl -sf http://localhost:8080/get` die Erreichbarkeit des Service-Containers prüft.
5. Die Änderungen committen und pushen; unter GitHub "Actions" den Lauf beobachten und bestätigen, dass alle Steps erfolgreich sind.
6. Testweise `index.html` lokal so verändern, dass kein `<title>`-Element mehr vorhanden ist, pushen, und beobachten, dass der entsprechende Step fehlschlägt; die Änderung danach rückgängig machen und erneut pushen.

## Beobachtbarer Checkpoint

GitHub "Actions" zeigt einen vollständig erfolgreichen Lauf mit allen fünf Steps (Checkout, Cache, zwei Testprüfungen, Service-Container-Prüfung); der bewusst provozierte Fehlschlag in Aufgabe 6 ist als roter, fehlgeschlagener Step sichtbar.

## Abschlusskriterien

- Beide Test-Steps prüfen tatsächlichen Inhalt, nicht nur Dateiexistenz allein.
- Der Service-Container ist über den definierten Port erreichbar (Step 4 erfolgreich).
- Der provozierte Fehlschlag aus Aufgabe 6 ist eindeutig einem bestimmten Step zuordenbar.

## Erweiterung (optional)

Den Cache-Key so anpassen, dass er einen Platzhalter für den Inhalt einer Datei einbezieht (z. B. `teamsite-cache-${{ hashFiles('index.html') }}`), und beschreiben, welchen Vorteil das gegenüber einem festen Key bietet.

## Fallback

Ohne Berechtigung, Workflow-Läufe unter "Actions" einzusehen: die YAML-Datei stattdessen lokal mit einem YAML-Linter oder durch sorgfältiges Gegenlesen auf Einrückung und Syntax prüfen; die inhaltliche Korrektheit der Steps bleibt dadurch überprüfbar, auch ohne den tatsächlichen Lauf zu sehen.
