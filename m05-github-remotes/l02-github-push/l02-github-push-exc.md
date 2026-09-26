# Lab 5.2 - Übung: Repository mit GitHub verbinden und Remote-Branches verwalten

Diese Übung verbindet das `teamsite`-Repository mit einem echten, leeren GitHub-Repository.

## Ausgangslage

Ein neues, leeres Repository auf GitHub (Name z. B. `teamsite`, ohne automatisch erzeugte README-Datei); das lokale `teamsite`-Repository im Stand nach Lab 5.1 mit `origin` auf das lokale bare Repository.

## Aufgaben

1. Die Remote-URL von `origin` auf das neue GitHub-Repository umstellen (`git remote set-url origin <github-url>`).
2. `main` inklusive gesamter bisheriger Historie zu GitHub übertragen.
3. Auf der GitHub-Weboberfläche prüfen, dass alle bisherigen Commits sichtbar sind.
4. Lokal einen neuen Branch `feature/social-links` anlegen, eine kleine Änderung vornehmen (z. B. einen Platzhalter-Link in der Fußzeile von `index.html` ergänzen), committen und zu GitHub pushen.
5. Auf GitHub bestätigen, dass `feature/social-links` als eigener Branch sichtbar ist.
6. Den Remote-Branch mit `git push origin --delete feature/social-links` entfernen und danach auch den lokalen Branch löschen.

## Beobachtbarer Checkpoint

GitHub zeigt nach Aufgabe 3 die vollständige lokale Historie; nach Aufgabe 6 existiert `feature/social-links` weder lokal noch auf GitHub.

## Abschlusskriterien

- `origin` verweist auf das GitHub-Repository, nicht mehr auf das lokale bare Repository.
- Die auf GitHub sichtbare Commit-Anzahl entspricht der lokalen Historie.
- Nach dem Aufräumen bleibt nur `main` als Branch übrig, lokal wie auf GitHub.

## Erweiterung (optional)

Mit `git remote -v` vor und nach `git remote set-url` vergleichen, wie sich Fetch- und Push-URL geändert haben.

## Fallback

Ohne eigenes GitHub-Konto oder ohne Berechtigung, ein neues Repository anzulegen: mit dem lokalen bare Repository aus Lab 5.1 fortfahren und die Aufgaben 1-3 als "würde entsprechend für GitHub gelten" überspringen; Aufgaben 4-6 bleiben mit dem lokalen Remote identisch durchführbar.
