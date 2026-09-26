# Lab 6.2 - Übung: Cherry-Picking und Squashing an einer präparierten Historie

Diese Übung nutzt ein eigenständiges Übungs-Repository, nicht die Kodschul Team Site.

## Ausgangslage

Ein leerer, neuer lokaler Ordner `cherry-lab`.

## Aufgaben

1. Repository mit einer kleinen, verzweigten Historie anlegen:

   ```bash
   mkdir cherry-lab && cd cherry-lab
   git init
   echo "v1" > status.txt && git add status.txt && git commit -m "Status v1"
   git switch -c fix-branch
   echo "v1 - Tippfehler behoben" > status.txt && git add status.txt && git commit -m "Tippfehler in Status beheben"
   git switch main
   echo "v2" > status.txt && git add status.txt && git commit -m "Status v2"
   ```

2. Den Hash des Commits "Tippfehler in Status beheben" mit `git log fix-branch --oneline` ermitteln.
3. Auf `main` mit `git cherry-pick <hash>` genau diesen einen Commit übernehmen, ohne den restlichen Verlauf von `fix-branch`.
4. Mit `git log --oneline` bestätigen, dass `main` jetzt drei Commits enthält, davon einen mit dem cherry-gepickten Inhalt.
5. Drei weitere, bewusst kleinteilige Zwischenschritte simulieren (`echo "v3" > status.txt && git commit -am "wip1"`, `echo "v3b" > status.txt && git commit -am "wip2"`, `echo "v3 final" > status.txt && git commit -am "wip3"`).
6. Diese drei Zwischenschritte mit `git reset --soft HEAD~3` und einem neuen, zusammenfassenden Commit zu einem einzigen Commit squashen.
7. Mit `git log --oneline` die finale, bereinigte Historie prüfen.

## Beobachtbarer Checkpoint

`git log --oneline` zeigt nach Aufgabe 7 keine der drei "wip"-Nachrichten mehr, sondern genau einen zusammenfassenden Commit an ihrer Stelle.

## Abschlusskriterien

- Der cherry-gepickte Commit ist auf `main` vorhanden, ohne die übrige Historie von `fix-branch`.
- Alle drei "wip"-Commits sind durch genau einen aussagekräftigen Commit ersetzt.
- `status.txt` enthält am Ende den Inhalt "v3 final".

## Erweiterung (optional)

`git cherry-pick` ein zweites Mal auf denselben bereits übernommenen Commit anwenden und beobachten, dass Git dabei keinen Fehler meldet, aber einen inhaltlich leeren oder redundanten Commit erzeugen kann - anschließend mit `git reset --hard HEAD~1` diesen Testschritt rückgängig machen.

## Fallback

Meldet `git cherry-pick` einen Konflikt: mit `git cherry-pick --abort` den Vorgang vollständig zurücknehmen und den Hash aus Aufgabe 2 erneut prüfen, bevor der Cherry-Pick wiederholt wird.
