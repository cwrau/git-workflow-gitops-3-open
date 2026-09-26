---
theme: default
layout: default
---

# Lab 4.1: Branches erstellen, wechseln und vergleichen

Zwei neue Branches anlegen, zwischen ihnen wechseln und die Branch-Struktur visualisieren, bevor inhaltliche Änderungen entstehen.

**Leitfragen:**

<details>
<summary>Was ist ein Branch technisch gesehen?</summary>

Ein beweglicher Zeiger auf einen Commit - kein separater Ordner oder eine Kopie des gesamten Repositorys.

</details>

<details>
<summary>Was passiert beim Wechsel zwischen Branches im Arbeitsverzeichnis?</summary>

Git ersetzt die Dateien im Arbeitsverzeichnis durch den Stand des Ziel-Branches; unfertige, ungestagte Änderungen können diesen Wechsel verhindern.

</details>

<details>
<summary>Wie zeigt `git log --oneline --graph --all` mehrere Branches gleichzeitig?</summary>

Als verzweigte Liniengrafik: jeder Branch-Zeiger erscheint neben dem Commit, auf den er zeigt; gemeinsame Vorgänger-Commits werden nur einmal dargestellt.

</details>

## Begriffe

| Begriff | Bedeutung |
| --- | --- |
| Branch | benannter, beweglicher Zeiger auf einen Commit |
| `main` | Standard-Branch, in diesem Kurs der gemeinsame Hauptstand |
| `git branch <name>` | legt einen neuen Branch am aktuellen Commit an |
| `git switch <name>` / `git checkout <name>` | wechselt das Arbeitsverzeichnis auf den Stand eines Branches |
| `git branch -v` | listet alle Branches mit ihrem jeweils letzten Commit |

## Branches anlegen und wechseln

```bash
git branch feature/nav-highlight
git branch feature/footer-tweak
git branch -v

git switch feature/nav-highlight
git switch main
```

`git switch -c <name>` legt einen Branch an und wechselt in einem Schritt dorthin - eine gängige Kurzform der beiden getrennten Befehle oben.

- Solange keine Commits auf einem neuen Branch erfolgen, zeigen alle Branches auf denselben Commit - das wird erst nach dem ersten eigenen Commit je Branch sichtbar unterschiedlich.
- Ein Wechsel bei ungestagten, aber kollidierenden Änderungen wird von Git verweigert, um Datenverlust zu vermeiden.

> **Merksatz:** Ein Branch ist ein Zeiger, keine Kopie - das Anlegen ist praktisch kostenlos.

## Fazit

- Branches sind leichtgewichtige, bewegliche Zeiger auf Commits.
- `git switch`/`git checkout` tauschen den Stand des Arbeitsverzeichnisses aus.
- `git log --graph --all` macht mehrere Branches gleichzeitig sichtbar, auch ohne inhaltliche Unterschiede.

Die Übung legt zwei Branches an, wechselt zwischen ihnen und vergleicht die Ausgaben von `git branch` und `git log --graph`.
