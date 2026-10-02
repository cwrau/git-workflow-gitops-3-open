---
theme: default
layout: default
---

# Lab 6b.3: Teamregeln: Branch-Schutz, Commit-Konventionen und Versions-Tags

Den Branch `main` schützen, Verantwortliche per `CODEOWNERS` festlegen und Commit-Nachrichten und Versions-Tags nach einer einheitlichen Konvention schreiben.

**Leitfragen:**

<details>
<summary>Wie verhindert man direkte Pushes auf `main`?</summary>

Mit einem Branch-Schutz (Branch protection rule oder Ruleset) in den Repository-Einstellungen: Änderungen sind nur noch über einen Pull Request möglich.

</details>

<details>
<summary>Was legt eine `CODEOWNERS`-Datei fest?</summary>

Sie ordnet Dateien oder Ordnern Personen oder Teams zu. Diese werden bei Pull Requests automatisch als Reviewer vorgeschlagen und können über den Branch-Schutz als Pflicht-Reviewer eingetragen werden.

</details>

<details>
<summary>Wofür eignen sich Conventional Commits und Versions-Tags?</summary>

Der Typ im Betreff (`feat:`, `fix:` ...) macht den Zweck eines Commits lesbar und erlaubt, daraus Versionssprünge und Änderungslisten abzuleiten. Ein Tag wie `v0.1.0` markiert den Stand einer Version.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Branch-Schutz / Ruleset | Regeln für einen Branch, z. B. Pull Request nötig, Reviews, Pflicht-Checks |
| Required status check | Check, der bestanden sein muss, bevor ein Pull Request gemergt werden darf |
| `CODEOWNERS` | Datei (z. B. `.github/CODEOWNERS`), die Dateien Verantwortlichen zuordnet |
| Conventional Commits | Schema `<typ>: <beschreibung>`, z. B. `feat:`, `fix:`, `docs:`, `chore:` |
| Semver | Versionsschema `MAJOR.MINOR.PATCH` |

## Commit-Typ und Version

| Commit | Bedeutung | Versionssprung |
| --- | --- | --- |
| `fix: ...` | Fehlerbehebung | PATCH (`0.1.0` zu `0.1.1`) |
| `feat: ...` | neue Funktion | MINOR (`0.1.0` zu `0.2.0`) |
| `feat!: ...` | inkompatible Änderung | MAJOR (`0.1.0` zu `1.0.0`) |

Der Betreff sollte höchstens 50 Zeichen lang sein, Zeilen im Textteil höchstens 72 (50/72-Regel).

## Ablauf für dieses Lab

```text
# .github/CODEOWNERS
*  @<konto>
```

```bash
git switch -c docs/codeowners
git add .github/CODEOWNERS
git commit -m "docs: CODEOWNERS ergänzen"
git push -u origin docs/codeowners
git tag v0.1.0
git push origin v0.1.0
```

- Ein Tag wird nicht automatisch mit `git push` übertragen, er muss ausdrücklich gepusht werden.
- Ein "Required status check" lässt sich erst eintragen, wenn der Check mindestens einmal gelaufen ist (ab Lab 7.3).

> **Merksatz:** Regeln, die für alle gelten sollen, gehören in den Branch-Schutz und in CI-Checks, nicht in persönliche Einstellungen.

## Fazit

- Der Branch-Schutz erzwingt Pull Requests und Reviews auf `main`.
- Conventional Commits und Semver-Tags machen Verlauf und Versionen lesbar.
- Pflicht-Checks werden erst über den Branch-Schutz verbindlich.

Die Übung schützt `main`, bringt eine `CODEOWNERS`-Datei per Pull Request ein und setzt einen Versions-Tag.
