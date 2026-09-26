# Lab 5.3 - Lösung: Fork erstellen und mit einem Upstream-Repository arbeiten

## Aufgabe 1-4: Fork, Klon und Remotes einrichten

```bash
git clone https://github.com/<eigenes-konto>/teamsite.git
cd teamsite
git remote add upstream https://github.com/<original-konto>/teamsite.git
git remote -v
```

Erwartete Ausgabe: `origin` zeigt auf den eigenen Fork (Fetch und Push), `upstream` auf das Original-Repository (Fetch und Push).

## Aufgabe 5: Änderung im Original (durch Trainer/Partnerkonto)

Ein neuer Commit auf `main` des Original-Repositorys, z. B. eine Ergänzung in `README.md` wie "Letzte Aktualisierung: Kursbeispiel".

## Aufgabe 6: Synchronisieren

```bash
git fetch upstream
git merge upstream/main
```

`git log --oneline` zeigt danach den neuen Commit aus dem Original-Repository als Teil der eigenen lokalen `main`-Historie.

## Aufgabe 7: In den eigenen Fork übertragen

```bash
git push origin main
```

Der eigene Fork auf GitHub zeigt danach denselben Commit-Stand wie das Original-Repository zum Zeitpunkt der Synchronisation.

## Erweiterung (Beispielantwort)

Ein eigener Commit (z. B. eine kleine Korrektur) auf einem neuen Branch, gepusht zu `origin`, kann über die GitHub-Weboberfläche als Pull Request gegen das Original-Repository vorgeschlagen werden - die technische Grundlage (eigener Branch, Push zu `origin`) ist identisch zum bisherigen Vorgehen; der Pull-Request-Workflow selbst wird in Modul 6 vertieft.

## Grenzfall: Divergierende Änderungen

Enthält der eigene Fork bereits einen eigenen, noch nicht geteilten Commit an derselben Stelle wie der neue Upstream-Commit, kann `git merge upstream/main` einen Konflikt erzeugen - die Auflösung folgt demselben Vorgehen wie in Lab 4.3 beschrieben.
