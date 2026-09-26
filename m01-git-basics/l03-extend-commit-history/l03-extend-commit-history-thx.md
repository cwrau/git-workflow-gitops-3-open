---
theme: default
layout: default
---

# Lab 1.3: Commit-Historie um Datei-Operationen erweitern

Umbenennen, Hinzufügen und Entfernen von Dateien als eigene, nachvollziehbare Commits - statt einer einzigen unübersichtlichen Änderung.

**Leitfragen:**

<details>
<summary>Warum ist `git mv` einem manuellen Umbenennen im Explorer/Finder vorzuziehen?</summary>

Manuelles Umbenennen erzeugt zwei getrennte Schritte (alte Datei entfernen, neue Datei hinzufügen), die leicht vergessen werden. `git mv` erledigt beides in einem Schritt und stagt die Änderung direkt.

</details>

<details>
<summary>Was macht einen Commit zu einem "atomaren" Commit?</summary>

Er enthält genau eine logisch zusammengehörige Änderung - nicht mehrere unabhängige Änderungen vermischt in einem Commit.

</details>

<details>
<summary>Warum lohnt sich `git status` unmittelbar vor jedem Commit?</summary>

Es zeigt exakt, was gestaged ist und was nicht - eine letzte Kontrolle gegen unbeabsichtigt fehlende oder zusätzliche Dateien im Commit.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| `git mv <alt> <neu>` | benennt eine versionierte Datei um und stagt die Änderung |
| `git rm <datei>` | entfernt eine versionierte Datei aus Arbeitsverzeichnis und Staging-Bereich |
| Atomarer Commit | ein Commit, der genau eine nachvollziehbare Änderung enthält |
| `git log --oneline` | kompakte, einzeilige Übersicht der Commit-Historie |

## Manuell vs. `git mv`/`git rm`

| Aktion | Manuell (Explorer/Terminal) | Mit Git-Befehl |
| --- | --- | --- |
| Umbenennen | Datei kopieren, alte löschen, beide Änderungen einzeln stagen | `git mv alt neu` - ein Schritt, direkt gestaged |
| Löschen | Datei löschen, danach `git add` nötig, um die Löschung zu erfassen | `git rm datei` - Löschung ist sofort gestaged |

Werden Dateien manuell im Explorer umbenannt oder gelöscht, zeigt `git status` sie zunächst als "gelöscht" und "neu" statt als eine zusammengehörige Änderung - `git add -A` erfasst zwar beides, aber `git mv`/`git rm` machen die Absicht von Anfang an eindeutig.

## Ablauf für dieses Lab

```bash
git mv script.js app.js
# index.html anpassen: <script src="app.js"></script>
git add index.html
git commit -m "app.js statt script.js als Namenskonvention nutzen"

# team.html neu anlegen, index.html-Navigation ergänzen
git add team.html index.html
git commit -m "Team-Seite hinzufuegen"

git rm notes-todo.txt
git commit -m "Entwurfsnotiz entfernen"

git log --oneline
```

- Nach `git mv` bleibt der Dateiinhalt unverändert - nur der Name ändert sich; inhaltliche Anpassungen (wie der `<script>`-Verweis) sind ein separater Schritt.
- `git rm` löscht die Datei auch im Arbeitsverzeichnis; ohne `--cached` bleibt keine lokale Kopie zurück.

> **Merksatz:** Ein Commit pro logischer Änderung macht die spätere Fehlersuche und das gezielte Rückgängigmachen einfacher.

## Fazit

- `git mv` und `git rm` machen Umbenennungen und Löschungen als bewusste, direkt gestagte Schritte sichtbar.
- Drei kleine, atomare Commits sind aussagekräftiger als ein einziger großer Commit mit vermischten Änderungen.
- `git log --oneline` macht eine wachsende Historie auf einen Blick lesbar.

Die Übung erweitert die Kodschul Team Site um genau diese drei Commits.
