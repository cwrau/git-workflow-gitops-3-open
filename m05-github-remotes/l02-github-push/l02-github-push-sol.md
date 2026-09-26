# Lab 5.2 - Lösung: Repository mit GitHub verbinden und Remote-Branches verwalten

## Aufgabe 1-3: Umstellen und übertragen

```bash
git remote set-url origin https://github.com/<konto>/teamsite.git
git push -u origin main
```

Die GitHub-Weboberfläche zeigt danach unter "Commits" dieselbe Anzahl und Reihenfolge wie `git log --oneline` lokal.

## Aufgabe 4-5: Neuer Branch mit Push

```bash
git switch -c feature/social-links
# index.html: Platzhalter-Link in der Fusszeile ergaenzen, z. B. <a href="#">Social Media</a>
git add index.html
git commit -m "Platzhalter fuer Social-Media-Link ergaenzen"
git push -u origin feature/social-links
```

Auf GitHub erscheint `feature/social-links` unter der Branch-Übersicht des Repositorys.

## Aufgabe 6: Aufräumen

```bash
git push origin --delete feature/social-links
git switch main
git branch -d feature/social-links
```

## Prüfung

```bash
git branch -a
```

Zeigt nur noch `main` sowie `remotes/origin/main` - keine Spur von `feature/social-links` mehr, weder lokal noch remote.

## Erweiterung (Beispielantwort)

`git remote -v` vor der Umstellung zeigt `origin` mit dem lokalen Pfad `../teamsite-remote.git` für Fetch und Push; danach zeigt es die GitHub-URL für beide Richtungen - der Name `origin` bleibt unverändert, nur das Ziel wechselt.

## Hinweis zur Authentifizierung

Der genaue Anmeldeweg zu GitHub (SSH-Schlüssel oder HTTPS mit Personal Access Token) hängt von der lokalen Konfiguration ab und wird nicht in diesem Lab behandelt; bei einer Fehlermeldung zur Authentifizierung ist die GitHub-Kontoeinrichtung vorab zu prüfen.
