---
theme: default
layout: default
---

# Lab 7.1: Lokalen Git-Hook einrichten

Einen `pre-commit`-Hook einrichten, der vor jedem Commit automatisch eine einfache Prüfung ausführt und fehlerhafte Commits verhindert.

**Leitfragen:**

<details>
<summary>Was ist ein Git-Hook?</summary>

Ein ausführbares Skript, das Git an bestimmten Punkten im Arbeitsablauf automatisch aufruft, z. B. vor einem Commit (`pre-commit`) oder vor einem Push (`pre-push`).

</details>

<details>
<summary>Wo liegen Hooks in einem Repository, und werden sie standardmäßig geteilt?</summary>

Im Ordner `.git/hooks/`; da `.git/` nicht Teil der versionierten Historie ist, werden Hooks standardmäßig nicht automatisch mit anderen Personen geteilt.

</details>

<details>
<summary>Was passiert, wenn ein `pre-commit`-Hook mit einem Fehlercode beendet wird?</summary>

Git bricht den Commit-Vorgang ab, bevor ein neuer Commit entsteht - die Änderungen bleiben gestaged erhalten.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Git-Hook | automatisch ausgeführtes Skript an einem definierten Punkt im Git-Ablauf |
| `pre-commit` | Hook, der unmittelbar vor der Erstellung eines Commits läuft |
| Exit-Code | Rückgabewert eines Skripts; `0` bedeutet Erfolg, jeder andere Wert bricht den Commit ab |

## Gängige Hook-Zeitpunkte

| Hook | Zeitpunkt | Typischer Zweck |
| --- | --- | --- |
| `pre-commit` | vor dem Commit | Formatierung/Lint-Prüfung |
| `commit-msg` | nach Eingabe der Nachricht | Format der Commit-Nachricht prüfen |
| `pre-push` | vor dem Push | Tests vor Veröffentlichung ausführen |

## Ablauf für dieses Lab

```bash
# .git/hooks/pre-commit anlegen und mit chmod +x ausführbar machen
#!/bin/sh
if grep -r "console.log" --include="*.js" .; then
  echo "Commit abgelehnt: console.log gefunden."
  exit 1
fi
exit 0
```

```bash
chmod +x .git/hooks/pre-commit
```

- Ein Hook, der versehentlich mit Exit-Code `0` endet, obwohl ein Problem gefunden wurde, verhindert nichts - der Rückgabewert entscheidet, nicht die reine Textausgabe.
- Da `.git/hooks/` nicht versioniert wird, lassen sich Hooks nicht einfach team-weit verteilen (nur mit Zusatzmitteln wie einem Setup-Skript, das den Hook bei der Einrichtung kopiert). Verbindliche Prüfungen gehören deshalb in CI-Checks (Lab 7.3), die für alle Beteiligten laufen; Hooks sind eine lokale Komfortfunktion.

> **Merksatz:** Hooks lassen sich nicht einfach verteilen - verbindliche Prüfungen gehören in CI-Checks, die für alle Beteiligten laufen.

## Fazit

- Git-Hooks automatisieren wiederkehrende Prüfungen direkt im lokalen Arbeitsablauf.
- Der Exit-Code des Hook-Skripts entscheidet über Erfolg oder Abbruch des Commits.
- Hooks liegen standardmäßig außerhalb der versionierten Historie und werden nicht automatisch geteilt; verbindlich sind CI-Checks (ab Lab 7.3).
- Das Framework [pre-commit](https://pre-commit.com/) verwaltet Hooks in einer versionierten Datei `.pre-commit-config.yaml`, installiert sie mit `pre-commit install` und kann dieselben Prüfungen mit `pre-commit run --all-files` in der CI ausführen.

Die Übung richtet einen `pre-commit`-Hook ein, der Debug-Rückstände abfängt, bevor sie committet werden.
