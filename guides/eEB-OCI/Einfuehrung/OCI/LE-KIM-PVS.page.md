---
parent:
---
# Empfang und Verarbeitung KIM-Nachricht

- [Empfang und Verarbeitung KIM-Nachricht](#empfang-und-verarbeitung-kim-nachricht)
- [Übernahme der Daten ins Primärsystem](#übernahme-der-daten-ins-primärsystem)
- [Validierung und Fehlermeldungen](#validierung-und-fehlermeldungen)
- [User Experience](#user-experience)
- [Prozessdauer](#prozessdauer)

Für das Angebot des OCI auf Leistungserbringerseite ist Voraussetzung, dass grundsätzlich KIM-Nachrichten empfangen werden können. Zusätzlich muss das Primärsystem Nachrichten zum OCI richtig erkennen und verarbeiten können.

# Übernahme der Daten ins Primärsystem

Eingehende Daten aus dem OCI müssen zunächst mit den Bestandsdaten abgeglichen werden. In den meisten Fällen wird im Primärsystem noch keine Krankenversichertennummer (KVNR) als Identifier vorliegen.

Um eine korrekte Zuordnung der eingehenden Daten sicherzustellen, bietet sich in diesen Fällen eine kurze manuelle Prüfung durch das Praxispersonal an. Über ein Matching von Vorname, Nachname und Geburtsdatum könnten die passendsten Patienten aus dem Bestandsystem vorgeschlagen werden. Das Praxispersonal entscheidet (bei Bedarf nach Abstimmung mit dem Patienten), welche Daten aus dem OCI übernommen werden sollen.

# Validierung und Fehlermeldungen

Bei der Interpretation der KIM-Nachricht kann es zu unterschiedlichen Fehlern kommen, wie zum Beispiel dem Eintreffen eines fehlerhaften Datensatzes, einem Signaturfehler oder KIM-Fehler. Die Fehlermeldung sollte nach Möglichkeit Aufschluss dazu geben, welche Art von Fehler aufgetreten ist. Zudem sollten die Daten aus Sicherheitsgründen und zur Fehlervermeidung nicht nur auf der Absender-, sondern auch auf der Empfängerseite validiert werden. Es ist keine Validierung an zentraler Stelle vorgesehen.

# User Experience

Eine schnelle, einfache Nutzung hat entscheidenden Einfluss auf die Akzeptanz des Prozesses. Wichtig ist deshalb:

- Eine übersichtliche Darstellung der über den OCI eingegangenen und noch nicht zugeordneten Daten
- Die einfache und schnelle manuelle Prüfung und Zuordnung der eingegangenen Daten zu ermöglichen - Abweichungen zwischen OCI-Daten und Bestandsdaten sollten leicht erkennbar gekennzeichnet sein.
- Der Prozess sollte sowohl gut funktionieren, wenn Versicherte den OCI vor Ort in der Praxis durchführen, als auch dann, wenn sie diesen bereits zuvor in Vorbereitung auf den Arztbesuch durchgeführt haben.

# Prozessdauer

Optimalerweise sollten die Daten 1-2 Minuten nach Initiierung des Prozesses zur Verfügung stehen. Längere Prozessdauern können sich beispielsweise aus den Polling-Intervallen in der Praxis ergeben. Da eine Verkürzung der Intervalle Auswirkungen auf andere Prozesse haben könnte, wird diese nicht empfohlen. Dafür sollten Primärsysteme aber die Möglichkeit anbieten, KIM-Nachrichten bei Bedarf manuell abzurufen und die Wartezeit so zu verkürzen.
