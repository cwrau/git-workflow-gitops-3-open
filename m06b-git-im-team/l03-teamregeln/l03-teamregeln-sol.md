# Lab 6b.3 - Lösung: Teamregeln: Branch-Schutz, Commit-Konventionen und Versions-Tags

## Aufgabe 1: Branch-Schutz

Unter "Settings → Rules → Rulesets → New branch ruleset": Ziel `main`, Regeln "Require a pull request before merging", "Restrict deletions" und "Block force pushes". Die Bezeichnungen können je nach GitHub-Version abweichen.

## Aufgabe 2: Direkten Push testen

```bash
echo "Test" >> notizen.md
git add notizen.md
git commit -m "chore: Test"
git push
```

Ausgabe: `remote: error: ... Changes must be made through a pull request`, der Push wird abgelehnt.

```bash
git reset --hard origin/main
```

## Aufgabe 3: CODEOWNERS per Pull Request

```bash
git switch -c docs/codeowners
mkdir -p .github
echo "* @<konto>" > .github/CODEOWNERS
git add .github/CODEOWNERS
git commit -m "docs: CODEOWNERS ergänzen"
git push -u origin docs/codeowners
```

Auf GitHub erscheint der Vorschlag "Compare & pull request". Pull Request öffnen und mit "Squash and merge" abschließen.

## Aufgabe 4: Version taggen

```bash
git switch main
git pull
git tag v0.1.0
git push origin v0.1.0
```

Der Tag erscheint auf GitHub unter "Releases" und "Tags".

## Aufgabe 5: Schutz deaktivieren

Im Ruleset den "Enforcement status" auf "Disabled" stellen oder das Ruleset löschen. Sonst werden die direkten Pushes auf `main` in den Labs 7.3 bis 9.3 abgelehnt.

## Erweiterung (Beispielantwort)

Mit "Require review from Code Owners" muss die in `CODEOWNERS` eingetragene Person den Pull Request freigeben. Wer den Pull Request selbst eröffnet hat, kann ihn als Alleinverantwortliche oder Alleinverantwortlicher nicht selbst freigeben, GitHub zeigt den Merge dann als blockiert an, sofern kein Bypass erlaubt ist.
