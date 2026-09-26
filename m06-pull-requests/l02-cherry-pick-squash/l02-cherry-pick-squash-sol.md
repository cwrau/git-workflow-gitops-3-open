# Lab 6.2 - Lösung: Cherry-Picking und Squashing an einer präparierten Historie

## Aufgabe 1-2: Historie anlegen und Hash ermitteln

```bash
git log fix-branch --oneline
```

Erwartete Ausgabe (Hash exemplarisch): `b2c3d4e Tippfehler in Status beheben` gefolgt von `a1b2c3d Status v1`.

## Aufgabe 3-4: Cherry-Pick

```bash
git switch main
git cherry-pick b2c3d4e
git log --oneline
```

Erwartete Ausgabe: drei Commits auf `main` - "Status v2", "Tippfehler in Status beheben" (mit neuem Hash, da cherry-gepickt), "Status v1".

## Aufgabe 5: Zwischenschritte simulieren

```bash
echo "v3" > status.txt && git commit -am "wip1"
echo "v3b" > status.txt && git commit -am "wip2"
echo "v3 final" > status.txt && git commit -am "wip3"
```

## Aufgabe 6: Squashen

```bash
git reset --soft HEAD~3
git commit -m "Status auf v3 final aktualisieren"
```

## Aufgabe 7: Finale Historie

```bash
git log --oneline
```

Zeigt "Status auf v3 final aktualisieren" anstelle der drei "wip"-Commits, gefolgt vom cherry-gepickten Commit und den beiden ursprünglichen Status-Commits.

## Erweiterung (Beispielantwort)

Ein wiederholter `git cherry-pick` desselben Commits erzeugt einen weiteren Commit mit identischem Inhalt, sofern die Zieldatei zwischenzeitlich nicht erneut denselben Stand hatte - Git verweigert dies nicht automatisch, da Cherry-Pick keine Duplikatsprüfung durchführt. `git reset --hard HEAD~1` entfernt diesen zusätzlichen, redundanten Commit vollständig.

## Häufige Stolperfalle

Wird bei Aufgabe 6 versehentlich `HEAD~4` statt `HEAD~3` verwendet, wird zusätzlich der cherry-gepickte Commit mit zurückgenommen und müsste erneut per Cherry-Pick oder manuell ergänzt werden - vor dem `reset` lohnt sich ein kurzer Blick auf `git log --oneline`, um die genaue Anzahl zu bestätigen.
