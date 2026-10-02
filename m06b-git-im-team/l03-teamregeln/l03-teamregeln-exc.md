# Lab 6b.3 - Übung: Teamregeln: Branch-Schutz, Commit-Konventionen und Versions-Tags

Diese Übung arbeitet im Repository `~/teamsite` auf GitHub.

## Ausgangslage

Das Repository `teamsite` ist öffentlich auf GitHub, `main` ist gepusht, das Arbeitsverzeichnis ist sauber.

## Aufgaben

1. Auf GitHub unter "Settings → Rules → Rulesets" (oder "Settings → Branches") einen Schutz für `main` anlegen: Pull Request vor dem Merge verlangen, Löschen und Force-Pushes verbieten.
2. Lokal auf `main` eine kleine Änderung committen (z. B. `echo "Test" >> notizen.md`) und mit `git push` pushen. Die Ablehnung beobachten, danach die Änderung mit `git reset --hard origin/main` wieder entfernen.
3. Einen Branch `docs/codeowners` anlegen, die Datei `.github/CODEOWNERS` mit `* @<konto>` erstellen, mit der Nachricht `docs: CODEOWNERS ergänzen` committen und pushen. Auf GitHub einen Pull Request öffnen und mit "Squash and merge" mergen.
4. Lokal `main` aktualisieren (`git switch main`, `git pull`) und mit `git tag v0.1.0` und `git push origin v0.1.0` eine Version markieren.

## Beobachtbarer Checkpoint

Der direkte Push auf `main` wird abgelehnt; die `CODEOWNERS`-Datei liegt über einen Pull Request auf `main`; der Tag `v0.1.0` ist auf GitHub unter "Tags" sichtbar.

## Abschlusskriterien

- Der Branch-Schutz verhindert direkte Pushes auf `main`.
- Die Commit-Nachricht folgt dem Schema `<typ>: <beschreibung>` mit höchstens 50 Zeichen.
- Der Tag liegt auf dem Stand von `main` nach dem Merge.

## Erweiterung (optional)

Im Branch-Schutz zusätzlich "Require review from Code Owners" aktivieren und beobachten, was bei einem Pull Request passiert, den man selbst eröffnet hat.

## Fallback

Ohne Berechtigung für Repository-Einstellungen (z. B. fremdes Repository): Aufgabe 1 und 2 überspringen und mit Aufgabe 3 und 4 weitermachen; der Branch-Schutz wird dann vom Trainer vorgeführt.
