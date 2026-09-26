# Lab 3.1 - Lösung: Aliases für den täglichen Git-Workflow

## Aufgabe 1: Aliase anlegen

```bash
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --decorate"
git config --global alias.co checkout
```

## Aufgabe 2: Test im Repository

```bash
git st        # entspricht: git status
git lg        # entspricht: git log --oneline --graph --decorate
git co main   # entspricht: git checkout main
```

Jede Alias-Ausführung liefert dieselbe Ausgabe wie der vollständige Befehl.

## Aufgabe 3: Aliase anzeigen

```bash
git config --global --get-regexp alias
```

Erwartete Ausgabe:

```text
alias.st status
alias.lg log --oneline --graph --decorate
alias.co checkout
```

## Aufgabe 4: Begründungstabelle

| Alias | Befehl | Begründung |
| --- | --- | --- |
| `st` | `status` | wird vor fast jedem Commit mehrfach täglich aufgerufen |
| `lg` | `log --oneline --graph --decorate` | ersetzt einen langen, schwer zu merkenden Befehl durch drei Zeichen |
| `co` | `checkout` | häufiger Wechsel zwischen Branches ab Modul 4 |

## Erweiterung (Beispielantwort)

```bash
git config --global alias.up "!git add -A && git commit"
```

Einschränkung: Ohne zusätzliche `-m "..."`-Angabe beim Aufruf öffnet `git up` den Editor für die Commit-Nachricht - der Alias spart also nur das Tippen der beiden Befehlsnamen, nicht das Formulieren der Nachricht selbst.
