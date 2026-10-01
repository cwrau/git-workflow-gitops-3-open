# FAQ: Git-Workflow und GitOps

## Allgemein

### Muss vorher schon Git-Erfahrung vorhanden sein?

Nein. Der Kurs beginnt bei null (Modul 1) und baut jedes weitere Konzept darauf auf. Teilnehmende mit erster Vorerfahrung erhalten zusätzliche, klar abgetrennte Erweiterungen, vor allem an Tag 3.

### Welche Software muss vor Kursbeginn installiert sein?

Git, ein GitHub-Konto, Docker (bzw. eine alternative Container-Runtime) sowie ein lokales Einzelknoten-Kubernetes (kind oder Minikube) für Tag 3. Die genauen Mindestanforderungen werden vor Kursbeginn mitgeteilt.

### Was passiert, wenn die eigene Kubernetes-Umgebung an Tag 3 nicht funktioniert?

Der Trainer demonstriert den betroffenen Ablauf live oder aufgezeichnet als vollwertigen Ersatz. Der übrige Kursinhalt (Module 1-8) ist davon unabhängig durchführbar.

### Ist eine bestimmte Programmiersprache Voraussetzung?

Nein. Das Referenzprojekt (Kodschul Team Site) ist eine kleine statische HTML/CSS/JavaScript-Seite ohne Build-Werkzeuge - sie dient als gemeinsames Beispiel, nicht als Sprachvertiefung.

### Warum arbeitet der gesamte Kurs mit einer einzigen, einfachen Website statt mit realistischeren Projekten?

Damit der Fokus durchgängig auf Git und GitOps liegt, nicht auf einer bestimmten Programmiersprache oder einem Framework. Die Konzepte (Branching, Merge, CI/CD, GitOps) übertragen sich unverändert auf größere, technologisch anspruchsvollere Projekte.

### Wie unterscheiden sich Baseline-Aufgaben und Erweiterungen?

Jedes Lab hat eine Baseline, die für alle Teilnehmenden erreichbar ist, unabhängig vom Vorwissen. Optionale Erweiterungen (z. B. in M7-L3, M9-L1, M9-L3) bieten Teilnehmenden mit Vorerfahrung zusätzliche Tiefe, ohne dass sie für den weiteren Kursverlauf erforderlich sind.

## Modul 1-3: Lokale Historie und täglicher Workflow

### Warum wird zunächst ohne GitHub gearbeitet?

Um die grundlegende Mechanik (Commits, Historie, Konfiguration) unabhängig von einem externen Dienst zu verstehen, bevor in Modul 5 Zusammenarbeit über GitHub hinzukommt.

### Was passiert mit einer Datei, die versehentlich committet wurde?

Sie lässt sich mit `git rm --cached` aus der Versionskontrolle entfernen, ohne sie lokal zu löschen (Modul 3). Ein nachträglicher `.gitignore`-Eintrag verhindert nur zukünftiges, kein rückwirkendes Tracking.

### Wann sollte `reset --hard` verwendet werden?

Nur wenn eine Änderung bewusst vollständig verworfen werden soll - dabei gehen nicht gestagete Änderungen unwiderruflich verloren (Modul 2).

### Wofür eignet sich `git stash`, wenn nicht zum dauerhaften Speichern?

Ausschließlich für einen kurzen Kontextwechsel bei unfertiger Arbeit. Ein Stash-Eintrag ersetzt keinen Commit und sollte nicht über längere Zeit unbeachtet bleiben (Modul 3).

### Warum wird ein eigenes Übungs-Repository für das Lesen der Commit-Historie verwendet (Lab 2.1)?

Damit ein Fehler beim Ausprobieren keine Auswirkung auf das gemeinsame Referenzprojekt hat. Die Befehle (`git log`, `git show`, `HEAD~n`) verhalten sich in jedem Repository identisch.

### Was, wenn beim Konfigurieren von Git die Fehlermeldung "Please tell me who you are" erscheint?

Das bedeutet, `user.name`/`user.email` wurden noch nicht gesetzt (Modul 1). `git config --global user.name "..."` und `git config --global user.email "..."` beheben das vor dem nächsten Commit-Versuch.

## Modul 4-6: Branches, GitHub, Pull Requests

### Warum entsteht bei manchen Merges kein Merge-Commit?

Wenn der Zielbranch seit der Branch-Erstellung keine eigenen Commits erhalten hat, verläuft der Merge als Fast-Forward - der Zeiger verschiebt sich lediglich, ohne zusätzlichen Commit (Modul 4).

### Ist ein Merge-Konflikt ein Fehler?

Nein. Er entsteht, wenn zwei Branches dieselbe Stelle unterschiedlich verändert haben, und gibt die Entscheidung bewusst an eine Person zurück, statt sie automatisch (und möglicherweise falsch) zu treffen (Modul 4).

### Worin unterscheidet sich ein Fork von einem Branch?

Ein Branch liegt innerhalb desselben Repositorys; ein Fork ist eine eigenständige Kopie unter einem anderen GitHub-Konto, verbunden über einen zusätzlichen `upstream`-Remote (Modul 5).

### Warum wird im Kurs "Squash and Merge" statt "Merge Commit" verwendet?

Weil es die `main`-Historie pro Feature auf genau einen aussagekräftigen Commit begrenzt - eine im Kurs getroffene, in `STRATEGY.md` dokumentierte Entscheidung, kein technisches Muss. Andere Teams wählen je nach Bedarf eine andere Strategie (Modul 6).

### Was, wenn niemand für ein Pull-Request-Review verfügbar ist?

Der Trainer übernimmt das Review; im Gegenzug review-t die eigene Person einen vom Trainer vorbereiteten Pull Request (Modul 6, Fallback in Lab 6.1).

### Warum gibt es in Modul 5 zunächst ein lokales, "künstliches" Remote-Repository, bevor GitHub verwendet wird?

Damit Fetch, Pull, Push und Tracking-Branches ohne Kontoerstellung oder Authentifizierung geübt werden können, bevor in Lab 5.2 ein echtes GitHub-Repository hinzukommt. Die Befehle unterscheiden sich technisch nicht.

### Warum verwendet Lab 6.2 ein eigenes Übungs-Repository für Cherry-Picking und Squashing statt der Kodschul Team Site?

Damit Cherry-Picking gezielt an einer bewusst vorbereiteten, verzweigten Historie geübt werden kann, ohne das gemeinsame Referenzprojekt für diese isolierte Technik zu verändern.

## Modul 7-8: Automatisierung und CI/CD

### Werden Git-Hooks automatisch mit anderen Personen geteilt?

Nein. `.git/hooks/` liegt außerhalb der versionierten Historie; Hooks lassen sich nicht einfach team-weit verteilen. Verbindliche Prüfungen gehören deshalb in CI-Checks (ab Lab 7.3), die für alle Beteiligten laufen.

### Wie lange dauert es, bis GitHub Pages nach der Aktivierung erreichbar ist?

Üblicherweise wenige Minuten; die genaue Dauer ist nicht exakt vorhersagbar und hängt vom aktuellen Zustand der GitHub-Infrastruktur ab (Modul 7).

### Was bedeutet ein "skipped" Job in GitHub Actions?

Der Job wurde aufgrund einer nicht erfüllten `if:`-Bedingung übersprungen - das ist kein Fehler und erscheint neutral, nicht rot markiert (Modul 8).

### Wofür eignet sich ein Service-Container, und ist er dauerhaft verfügbar?

Für Testabhängigkeiten (z. B. eine Datenbank oder einen einfachen HTTP-Dienst), die nur während der Laufzeit eines Jobs benötigt werden. Nach Jobende wird er automatisch entfernt - er eignet sich nicht für dauerhafte Infrastruktur (Modul 8).

### Warum werden Container-Images im Kurs mit einer festen Versionsnummer statt `latest` verwendet?

Damit ein Lab über mehrere Kursdurchführungen hinweg reproduzierbar bleibt. Ein `latest`-Tag kann sich unbemerkt ändern und ein zuvor funktionierendes Beispiel ohne erkennbaren Grund verändern (Modul 8).

### Was bedeutet `needs:` in einer GitHub-Actions-Workflow-Datei?

Es legt eine Ausführungsreihenfolge zwischen Jobs fest - ein Job mit `needs: test` startet erst, nachdem der Job `test` erfolgreich abgeschlossen wurde (Modul 8).

## Modul 9: GitOps

### Warum wird nicht direkt die Kodschul Team Site per GitOps bereitgestellt?

Um den GitOps-Mechanismus nachvollziehbar zu demonstrieren, ohne einen eigenen Container-Image-Build- und Registry-Workflow vorauszusetzen, nutzt der Kurs einen bewusst kleinen, repräsentativen Demo-Workload (`hashicorp/http-echo`). Das zugrunde liegende Prinzip ist unabhängig von der Größe der Anwendung identisch.

### Was passiert, wenn jemand den Cluster-Zustand manuell ändert?

Argo CD erkennt die Abweichung vom im Git-Repository beschriebenen Zustand und gleicht sie automatisch wieder an (Self-Healing) - eine manuelle Änderung ist dadurch nur vorübergehend wirksam (Modul 9).

### Ist ein Kubernetes-Secret ausreichend sicher für echte Zugangsdaten?

Nicht allein: ein Kubernetes-Secret ist lediglich Base64-kodiert, keine Verschlüsselung. Für produktiv genutzte Secrets sind zusätzliche Werkzeuge (verschlüsselte Secret-Objekte oder externe Vaults) üblich - das ist im Kurs nicht Teil der praktischen Übung, aber als Grenze benannt (Modul 9).

### Wie aktuell sind die im Kurs gezeigten Argo-CD-Installationsschritte?

Die grundlegenden Konzepte (Application-Objekt, automatisierte Synchronisation, Self-Healing) sind über Versionen hinweg stabil; exakte Installationsbefehle und Oberflächendetails werden vor Kursbeginn gegen die tatsächlich installierte Version geprüft und bei Bedarf aktualisiert.

### Was, wenn nach dem Kurs kein eigener Kubernetes-Cluster mehr zur Verfügung steht?

Die im Kurs erarbeiteten Konzepte (deklarative Infrastruktur, Push- vs. Pull-Bereitstellung, Self-Healing) gelten unabhängig vom konkreten Werkzeug; Argo CD ist ein Beispiel für ein verbreitetes, aber nicht das einzige Pull-basierte GitOps-Werkzeug.

### Warum liegt die Argo-CD-`Application`-Definition in einem eigenen Ordner (`gitops-bootstrap/`) statt neben den übrigen Manifesten?

Damit der von Argo CD überwachte Sync-Pfad (`project/gitops/`) ausschließlich die eigentlichen Workload-Manifeste enthält. Läge die `Application`-Definition im selben Ordner, würde Argo CD versuchen, auch ihre eigene Ressource als Teil des überwachten Zustands zu verwalten - die Bootstrap-Datei wird stattdessen einmalig manuell angewendet.

### Muss man Kubernetes bereits gut kennen, um Modul 9 zu bearbeiten?

Modul 8 (Lab 8.1) führt die nötigen Grundbegriffe (Image, Container, Registry, Orchestrierung) ein, bevor Modul 9 sie anwendet. Vertiefte, eigenständige Kubernetes-Erfahrung wird nicht vorausgesetzt.

## Nach dem Kurs

### Welches Artefakt bleibt nach dem Kurs nutzbar?

Das eigene, vollständig durchlaufene `teamsite`-Repository mit seiner gesamten Commit-Historie, dem dokumentierten `STRATEGY.md`, dem GitHub-Actions-Workflow und den GitOps-Manifesten - alles direkt auf reale Projekte übertragbar.

### Wie geht es weiter, wenn im eigenen Team eine andere Merge-Strategie üblich ist?

Die im Kurs getroffene Wahl (Squash and Merge) ist eine dokumentierte, aber änderbare Entscheidung. `STRATEGY.md` zeigt beispielhaft, wie eine solche Entscheidung für ein Team begründet und festgehalten wird - das Vorgehen lässt sich unverändert auf eine andere gewählte Strategie übertragen.

