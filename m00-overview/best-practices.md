# Best Practices: Git-Workflow und GitOps

Modulübergreifende Praktiken, die im Kurs wiederholt angewendet werden. Jede Praxis nennt eine Begründung, eine Konsequenz bei Nichtbeachtung und ein konkretes Kursbeispiel.

## Atomare Commits: eine logische Änderung pro Commit

- Begründung: erleichtert gezieltes Rückgängigmachen und spätere Fehlersuche, da jeder Commit unabhängig nachvollziehbar bleibt.
- Konsequenz bei Nichtbeachtung: ein Rückgängigmachen (`revert`/`reset`) trifft immer den gesamten Commit - vermischte Änderungen lassen sich nicht selektiv zurücknehmen.
- Beispiel im Kurs: Lab 1.3 trennt Umbenennen, neue Seite und Aufräumen bewusst in drei Commits.
- Bezug: Modul 1, 2, 4.

## Aussagekräftige Commit-Nachrichten statt "update"/"fix"

- Begründung: eine Nachricht ohne Bezug zur tatsächlichen Änderung zwingt zu einem zusätzlichen `git show`, um den Inhalt zu verstehen.
- Konsequenz bei Nichtbeachtung: Audit-Trail und Code-Review verlieren an Wert, da die Historie nur noch über den Diff, nicht über die Nachricht lesbar ist.
- Beispiel im Kurs: Lab 2.2 zeigt bewusst eine Nachricht "update" und korrigiert sie anschließend mit `commit --amend`.
- Bezug: Modul 1, 2, 7.

## Vor jedem Commit `git status` prüfen

- Begründung: verhindert unbeabsichtigt fehlende oder zusätzliche Dateien im Commit.
- Konsequenz bei Nichtbeachtung: ein Commit kann unvollständig sein (Datei vergessen) oder unerwünschte Dateien enthalten (z. B. Debug-Rückstände).
- Beispiel im Kurs: Lab 1.2 verlangt `git status` explizit als Prüfschritt vor der Bestätigung des Checkpoints.
- Bezug: Modul 1-3.

## `.gitignore` direkt zu Projektbeginn einrichten

- Begründung: verhindert, dass generierte oder lokale Dateien überhaupt erst versehentlich committet werden.
- Konsequenz bei Nichtbeachtung: eine nachträgliche `.gitignore`-Regel wirkt nur auf zukünftige Änderungen, nicht rückwirkend auf bereits committete Dateien.
- Beispiel im Kurs: Lab 3.2 zeigt exakt diesen Unterschied anhand eines simulierten Build-Ordners.
- Bezug: Modul 3.

## `reset --hard` nur nach bewusster Prüfung verwenden

- Begründung: im Gegensatz zu `--soft`/`--mixed` gehen dabei nicht gestagete Änderungen unwiderruflich verloren.
- Konsequenz bei Nichtbeachtung: unfertige, wertvolle Arbeit kann ohne Wiederherstellungsmöglichkeit verschwinden.
- Beispiel im Kurs: Lab 2.2 stellt `--soft`, `--mixed` und `--hard` explizit gegenüber, bevor `--soft` praktisch angewendet wird.
- Bezug: Modul 2.

## Branch-Namenskonvention konsequent einhalten (`feature/`, `fix/`)

- Begründung: macht auf einen Blick erkennbar, welche Art von Änderung ein Branch enthält, auch bei vielen offenen Branches.
- Konsequenz bei Nichtbeachtung: bei wachsender Anzahl paralleler Branches wird die Übersicht ohne einheitliches Schema schnell unklar.
- Beispiel im Kurs: `STRATEGY.md` (Lab 6.3) dokumentiert das im Kurs tatsächlich verwendete Schema anhand der bereits genutzten Branch-Namen.
- Bezug: Modul 4, 6.

## `main` durchgängig in einem lauffähigen Zustand halten

- Begründung: jede spätere Automatisierung (Hooks, CI/CD, GitOps) setzt einen verlässlichen `main`-Stand voraus.
- Konsequenz bei Nichtbeachtung: ein fehlerhafter `main`-Stand blockiert oder verfälscht nachgelagerte automatisierte Schritte für alle Beteiligten gleichzeitig.
- Beispiel im Kurs: Merge-Konflikte (Lab 4.3) werden vor dem Fortschreiten aufgelöst, nie unaufgelöst weitergereicht.
- Bezug: Modul 4-9.

## Pull Request statt direktem Push auf `main`

- Begründung: macht eine Änderung vor dem Zusammenführen sichtbar, kommentierbar und optional an Prüfungen gebunden.
- Konsequenz bei Nichtbeachtung: Fehler oder unklare Entscheidungen gelangen ungeprüft in den gemeinsamen Stand.
- Beispiel im Kurs: Lab 6.1 durchläuft den vollständigen Pull-Request-Workflow inklusive Review vor dem Merge.
- Bezug: Modul 6.

## Review-Kommentare durch weitere Commits auf demselben Branch beantworten

- Begründung: hält die Diskussion im Kontext des ursprünglichen Pull Requests, statt einen neuen zu eröffnen.
- Konsequenz bei Nichtbeachtung: verstreute Diskussion über mehrere Pull Requests erschwert die Nachvollziehbarkeit einer Entscheidung.
- Beispiel im Kurs: Lab 6.1 verlangt genau diesen Ablauf als Teil der Abschlusskriterien.
- Bezug: Modul 6.

## Squash and Merge als dokumentierten Standard verwenden

- Begründung: hält die `main`-Historie pro Feature auf genau einen aussagekräftigen Commit begrenzt.
- Konsequenz bei Nichtbeachtung: uneinheitliche Merge-Strategien erzeugen eine schwer lesbare, inkonsistente `main`-Historie.
- Beispiel im Kurs: `STRATEGY.md` (Lab 6.3) legt diese Wahl ausdrücklich fest und begründet sie.
- Bezug: Modul 6.

## Gemergte Branches zeitnah löschen (lokal und remote)

- Begründung: verhindert eine wachsende Zahl veralteter, nicht mehr benötigter Branches.
- Konsequenz bei Nichtbeachtung: die Branch-Übersicht wird mit der Zeit unübersichtlich und erschwert die Orientierung.
- Beispiel im Kurs: jedes Merge-Lab (4.2, 5.2, 6.1) schließt mit einem Aufräumschritt.
- Bezug: Modul 4, 5, 6.

## Tags für bedeutsame, dauerhaft wiederauffindbare Stände setzen

- Begründung: ein Tag verschiebt sich im Gegensatz zu einem Branch nicht von selbst.
- Konsequenz bei Nichtbeachtung: ein bedeutsamer Stand lässt sich später nur über die Commit-Historie, nicht über einen sprechenden Namen wiederfinden.
- Beispiel im Kurs: Lab 4.2 setzt den Tag `v0.1` nach den ersten konfliktfreien Merges.
- Bezug: Modul 4, 6.

## Lokale Hooks für schnelle Rückmeldung, CI/CD für verbindliche Prüfung

- Begründung: ein Hook läuft sofort, aber nur lokal; eine Pipeline läuft langsamer, aber für alle Beteiligten verbindlich.
- Konsequenz bei Nichtbeachtung: ohne CI/CD kann eine lokal übersprungene Prüfung (z. B. deaktivierter Hook) unbemerkt in `main` gelangen.
- Beispiel im Kurs: Lab 7.1 (lokaler Hook) und Lab 7.3/8.2 (CI/CD) prüfen ähnliche Dinge auf unterschiedlichen Ebenen.
- Bezug: Modul 7, 8.

## Commit-Vorlagen für wiederkehrend benötigte Informationen nutzen

- Begründung: reduziert das Risiko, Begründung oder Testnachweis in der Commit-Nachricht zu vergessen.
- Konsequenz bei Nichtbeachtung: wichtiger Kontext (Warum, Testnachweis) geht verloren, wenn er nicht aktiv eingefordert wird.
- Beispiel im Kurs: Lab 7.2 vergleicht einen editorgestützten Commit mit Vorlage direkt gegen einen `-m`-Commit ohne Vorlage.
- Bezug: Modul 7.

## Cache-Keys inhaltsabhängig statt fest wählen

- Begründung: ein fester Key kann veraltete Inhalte liefern, ein inhaltsabhängiger Key (z. B. Prüfsumme) invalidiert sich automatisch.
- Konsequenz bei Nichtbeachtung: ein Workflow kann mit veralteten, gecachten Daten weiterarbeiten, ohne dass dies auffällt.
- Beispiel im Kurs: Lab 8.2 zeigt zunächst einen festen Key und als Erweiterung einen `hashFiles()`-basierten Key.
- Bezug: Modul 8.

## Branch- oder umgebungsabhängige Jobs über `if:` explizit absichern

- Begründung: verhindert, dass produktionsnahe Schritte versehentlich bei jedem beliebigen Branch laufen.
- Konsequenz bei Nichtbeachtung: eine simulierte oder echte Bereitstellung könnte auf einem falschen Branch ausgelöst werden.
- Beispiel im Kurs: Lab 8.3 beschränkt den `deploy-staging`-Job explizit auf den Branch `staging`.
- Bezug: Modul 8.

## Keine echten Secrets im Klartext in Manifesten oder Workflow-Dateien

- Begründung: ein Git-Repository ist vollständig historisiert - ein einmal committeter Wert bleibt auffindbar, auch nach späterem Entfernen.
- Konsequenz bei Nichtbeachtung: ein einmal committetes Secret gilt als kompromittiert und muss ausgetauscht werden, unabhängig von späteren Löschversuchen.
- Beispiel im Kurs: Lab 9.1 ordnet genau diesen Unterschied anhand von Beispielen ein; `kustomization.yaml` enthält bewusst nur einen harmlosen Begrüßungstext.
- Bezug: Modul 9.

## Bei GitOps das Git-Repository als einzige Wahrheit behandeln

- Begründung: manuelle Änderungen direkt am Cluster werden vom Kontrollmechanismus als Abweichung erkannt und zurückgesetzt (Self-Healing).
- Konsequenz bei Nichtbeachtung: manuelle "Soforthilfe"-Änderungen am Cluster werden ohne Dokumentation in Git automatisch wieder rückgängig gemacht und wirken dadurch scheinbar unzuverlässig.
- Beispiel im Kurs: Lab 9.2 demonstriert bewusst eine manuelle Skalierung, die Argo CD danach zurücksetzt.
- Bezug: Modul 9.

## Fallback-Pfad vor einer Live-Demo kennen, nicht erst währenddessen suchen

- Begründung: eine nicht funktionierende Umgebung (Kubernetes, GitHub Actions) darf den Lernfortschritt nicht blockieren.
- Konsequenz bei Nichtbeachtung: technische Probleme während der Durchführung kosten unverhältnismäßig viel Kurszeit, wenn kein Ausweichweg vorbereitet ist.
- Beispiel im Kurs: jedes Lab in Modul 7-9 enthält einen dokumentierten Fallback-Abschnitt.
- Bezug: Modul 7-9.

## Unsaubere Zwischen-Commits vor dem Teilen bereinigen

- Begründung: eine bereits geteilte, unsaubere Historie lässt sich nicht mehr gefahrlos mit `reset`/`amend` korrigieren.
- Konsequenz bei Nichtbeachtung: nach dem Push verändert eine Korrektur mit `amend`/`reset` die Historie anderer Beteiligter und erzeugt Konflikte.
- Beispiel im Kurs: Lab 2.3 bereinigt zwei "wip"/"asdf"-Commits, bevor sie geteilt würden.
- Bezug: Modul 2, 6.

## Ausnahmefälle einer Strategie explizit dokumentieren, nicht nur den Regelfall

- Begründung: eine Strategie ohne benannte Ausnahme (z. B. dringende Ein-Zeilen-Korrektur) wird in der Praxis stillschweigend unterlaufen.
- Konsequenz bei Nichtbeachtung: informelle Abweichungen von der Strategie bleiben undokumentiert und untergraben ihre Verbindlichkeit.
- Beispiel im Kurs: `STRATEGY.md` (Lab 6.3) benennt einen konkreten Ausnahmefall für dringende Korrekturen.
- Bezug: Modul 6.

## Container-Images mit explizitem Tag statt `latest` verwenden

- Begründung: ein gepinnter Tag macht ein Lab über Zeit und über Deliveries hinweg reproduzierbar.
- Konsequenz bei Nichtbeachtung: `latest` kann sich unbemerkt ändern und ein zuvor funktionierendes Lab ohne erkennbaren Grund brechen.
- Beispiel im Kurs: `alpine:3.22` (Modul 8) und `hashicorp/http-echo:1.0` (Modul 9) sind bewusst versioniert, nicht `latest`.
- Bezug: Modul 8, 9.

## Bootstrap-Ressourcen außerhalb des von ihnen verwalteten Pfads ablegen

- Begründung: eine GitOps-`Application`-Definition, die im eigenen Sync-Pfad liegt, würde vom Kontrollmechanismus als Teil des zu verwaltenden Zustands mitbehandelt.
- Konsequenz bei Nichtbeachtung: unklare Grenze zwischen "einmalig manuell angewendet" und "laufend automatisiert verwaltet".
- Beispiel im Kurs: `argocd-application.yaml` liegt in `project/gitops-bootstrap/`, nicht im überwachten `project/gitops/`.
- Bezug: Modul 9.

