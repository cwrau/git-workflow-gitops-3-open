# Lab 8.2 - Übung: Workflow um Tests, Caching und Service-Container erweitern

Diese Übung erweitert `.github/workflows/lint.yaml` aus Modul 7 um Prüfungen.

## Ausgangslage

Das `teamsite`-Repository mit dem bestehenden Workflow `.github/workflows/lint.yaml` aus Lab 7.3.

## Aufgaben

1. Den Job `lint` in `test` umbenennen (Lab 8.3 verweist per `needs: test` darauf) und den bestehenden Workflow um zwei Test-Steps erweitern: Prüfung, dass `index.html` existiert (`test -f index.html`), und Prüfung, dass die Datei ein `<title>`-Element enthält (`grep -q "<title>" index.html`). Stand zum Kopieren: `~/handout/project/setup/snippets/lint-8.2.yaml`.
2. Einen Caching-Step mit `actions/cache@v4` für ein beliebiges Verzeichnis (z. B. `.cache`) mit einem festen Key ergänzen.
3. Einen Service-Container `httpbin` (Image `mccutchen/go-httpbin:2.25.0`, Port 8080) im Job ergänzen.
4. Einen weiteren Step ergänzen, der mit `curl -sf http://localhost:8080/get` die Erreichbarkeit des Service-Containers prüft.
5. Die Änderungen committen und pushen; unter GitHub "Actions" den Lauf beobachten und bestätigen, dass alle Steps erfolgreich sind.

## Beobachtbarer Checkpoint

GitHub "Actions" zeigt einen vollständig erfolgreichen Lauf mit allen fünf Steps (Checkout, Cache, zwei Testprüfungen, Service-Container-Prüfung).

## Abschlusskriterien

- Der Job heißt `test` und enthält die beiden Test-Steps.
- Der Service-Container ist über den definierten Port erreichbar (Step 4 erfolgreich).

## Erweiterung (optional)

Den Cache-Key so anpassen, dass er einen Platzhalter für den Inhalt einer Datei einbezieht (z. B. `teamsite-cache-${{ hashFiles('index.html') }}`), und beschreiben, welchen Vorteil das gegenüber einem festen Key bietet.

## Fallback

Ohne Berechtigung, Workflow-Läufe unter "Actions" einzusehen: die YAML-Datei stattdessen lokal mit einem YAML-Linter oder durch sorgfältiges Gegenlesen auf Einrückung und Syntax prüfen; die inhaltliche Korrektheit der Steps bleibt dadurch überprüfbar, auch ohne den tatsächlichen Lauf zu sehen.
