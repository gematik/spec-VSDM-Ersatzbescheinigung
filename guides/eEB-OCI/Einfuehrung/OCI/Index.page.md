---
parent:
---
# Online Check-In (OCI/PKV)

Für Privatversicherte dient der Online Check-In der Teilhabe an den Anwendungen der Telematikinfrastruktur.
Die privaten Versicherungen sehen keine eGK Ausgabe für ihre Versicherten vor.
Der Online Check-In bietet einer Praxis einen Gewinn in Zeit und Datenqualität in der Übernahme von Versichertendaten (insbesondere der Krankenversicherungsnummer) durch einen automatisierten Prozess.

Da für den PKV-Bereich keine "Haupt-" und "Ersatzverfahren" in der Erfassung der Arzt-Patienten-Kontakte geregelt sind, obliegt es dem PVS-Markt, diese "Check-In"-Funktion durch eine gute User Experience und kommunikativer Begleitung zu einem Standard-Verfahren werden zu lassen.

## UseCase und Funktionsweise (Check-In mittels App)

Beim "Check-In" mittels einer Versicherten-App fordert die versicherte Person das Versicherungsunternehmen auf, die Versichertendaten an eine konkrete Praxis zu übermitteln.
Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

In der Anforderung wird der Kasse bzw. dem PKV-Versicherungsunternehmen die Kennung der Praxis über die App mitgeteilt.
Die Kasse bzw. das Versicherungsunternehmen erstellen nach erfolgreicher Prüdung diee EEB-Bescheinigung, die dann via KIM der Praxis zugestellt wird.
In der Bescheinigung ist im EEBMessageHeader hinterlegt (s. Element `eventCoding`), ob die Anfrage von einem Leistungserbringer per KIM oder vom Versicherten via App angefordert wurde.
Ist die Bescheinigung auf Grundlage der Anfrage via App eingetroffen, so wird zusätzlich auch das optionale Element `response` weggelassen, mit dem ansonsten die Referenz auf die vorangegangene EEB-Anfrage via KIM gegeben wäre.

Das Praxisverwaltungssystem kann diesen FHIR-Datensatz der Bescheinigung in beiden Fällen in analoger Weise zum Einlesen der Versichertenstammdaten der eGK verarbeiten und nach Bedarf eine neue digitale Patientenkartei anlegen.

_Dieser Anwendungsfall der Anforderung via App wird aktuell nur für Versicherte der Privaten Krankenversicherung eingesetzt, über den der Praxis die Versichertendaten (KVNR, Name, Adresse, Geburtsdatum, etc.) des Patienten bereitgestellt werden._

{{render:eeb-oci-images-pkv-ersatzverfahren}}
