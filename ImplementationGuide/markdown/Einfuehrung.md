# Inhalt

Die UseCases der Ersatzbescheinigung digitalisieren den papierbasierten Prozess für Anwendungsfälle in der (Zahn-)Arztparxis, in denen keine eGK als Versicherungsnachweis vorgelegt werden kann.
Der bisherige papierbasierte Prozess für die Übermittlung von Ersatzbescheinigungen wie bspw. Faxen, Papierausstellung usw. und der anschließenden händischen Übernahme der Daten sind langwierig, fehleranfällig und unkomfortabel für einen Großteil der Beteiligten.

Mit dem eEB-Verfahren wird die Anforderung und Ausstellung einer Ersatzbescheinigung für Versicherte der gesetzlichen Krankenkassen automatisierbar.
Ebenso kann über dieses Verfahren ein Versichertennachweis (insbesondere die Bereitstellung der Krankenversicherungsnummer KVNR) für privat Versicherte angefordert werden.

Das auslösende Ereignis (Anforderung) kann ein "Check-In" in der Praxis mittels einer App oder eine manuelle Anforderung aus dem Praxisverwaltungssystem durch Mitarbeitende der Praxis sein.

- [Inhalt](#inhalt)
  - [Rechtliche Einordnung](#rechtliche-einordnung)
  - [UseCase und Funktionsweise (Check-In mittels App)](#usecase-und-funktionsweise-check-in-mittels-app)
  - [UseCase und Funktionsweise (Anforderung aus der Praxis)](#usecase-und-funktionsweise-anforderung-aus-der-praxis)

## Rechtliche Einordnung

Das hier vorgestellte Verfahren des "Online Check-In" bzw. der "elektronischen Ersatzbescheinigung" tangiert die Verfahren, Prozesse und ggfs. Verträge der gesetzlichen (GKV), wie der privaten Krankenversicherung (PKV) im Arzt-Patienten-Kontakt.

Für Versicherte der gesetzlichen Krankenkassen ist der Nachweis der Anspruchsberechtigung vertraglich in §19 BMV geregelt.
Die vorliegende Spezifikation soll eine Möglichkeit schaffen, mit der Arztpraxen, Zahnarztpraxen und Krankenhäuser eine Ersatzbescheinigung nach §19 Abs. 2 BMV auf elektronischem Weg erhalten können.
Die vorliegende Spezifikation befreit die gesetzlichen Krankenkassen nicht davon, den Versicherten auf Wunsch eine Ersatzbescheinigung in Papierform auszustellen.

Für Privatversicherte dient der Online Check-In der Teilhabe an den Anwendungen der Telematikinfrastruktur.
Die privaten Versicherungen sehen keine eGK Ausgabe für ihre Versicherten vor.
Der Online Check-In bietet einer Praxis einen Gewinn in Zeit und Datenqualität in der Übernahme von Versichertendaten (insbesondere der Krankenversicherungsnummer) durch einen automatisierten Prozess.
Um den PVS-Herstellern die Umsetzung durch das Einlesen von Patientendaten über das etablierte Standardverfahren im GKV-Bereich zu erleichtern, verwenden die PKV Versicherungsunternehmen in der EEB-Bescheinigung die gleichen FHIR-Profile wie die Krankenkassen der GKV.
Das FHIR-Profil `EEBCoverageEgk` bietet dazu mit der optionalen Extension `geschuetzteVersichertendaten` die Möglichkeit, dass PKV-Versicherungsunternehmen auf diesen Eintrag verzichten können.

Da für den PKV-Bereich keine "Haupt-" und "Ersatzverfahren" in der Erfassung der Arzt-Patienten-Kontakte geregelt sind, obliegt es dem PVS-Markt, diese "Check-In"-Funktion durch eine gute User Experience und kommunikativer Begleitung zu einem Standard-Verfahren werden zu lassen.

Die Nutzung dieses Verfahrens ist für Praxen, Zahnarztpraxen und Krankenhäuser freiwillig.

## UseCase und Funktionsweise (Check-In mittels App)

Beim "Check-In" mittels einer Versicherten-App fordert die versicherte Person das Versicherungsunternehmen auf, die Versichertendaten an eine konkrete Praxis zu übermitteln.
Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

In der Anforderung wird der Kasse bzw. dem PKV-Versicherungsunternehmen die Kennung der Praxis über die App mitgeteilt.
Die Kasse bzw. das Versicherungsunternehmen erstellen nach erfolgreicher Prüdung diee EEB-Bescheinigung, die dann via KIM der Praxis zugestellt wird.
In der Bescheinigung ist im EEBMessageHeader hinterlegt (s. Element `eventCoding`), ob die Anfrage von einem Leistungserbringer per KIM oder vom Versicherten via App angefordert wurde.
Ist die Bescheinigung auf Grundlage der Anfrage via App eingetroffen, so wird zusätzlich auch das optionale Element `response` weggelassen, mit dem ansonsten die Referenz auf die vorangegangene EEB-Anfrage via KIM gegeben wäre.

Das Praxisverwaltungssystem kann diesen FHIR-Datensatz der Bescheinigung in beiden Fällen in analoger Weise zum Einlesen der Versichertenstammdaten der eGK verarbeiten und nach Bedarf eine neue digitale Patientenkartei anlegen.

_Dieser Anwendungsfall der Anforderung via App wird aktuell nur für Versicherte der Privaten Krankenversicherung eingesetzt, über den der Praxis die Versichertendaten (KVNR, Name, Adresse, Geburtsdatum, etc.)  des Patienten bereitgestellt werden._

{{render:ImplementationGuide-images-out-pkv-ersatzverfahren}}

## UseCase und Funktionsweise (Anforderung aus der Praxis)

Die Anforderung zur Ausstellung einer Ersatzbescheinigung für eine gesetzlich versicherte Person kann durch das Praxispersonal initiiert werden.
Für die Anforderung einer Ersatzbescheinigung muss in der Prxis ein minimaler Satz an Informationen zur zu behandelnden Person erfasst und aus dem Praxisverwaltungssystem via KIM an die bekannte bzw. benannte Kasse als Anfrage gesendet werden.
Die Kasse erstellt zur angefragten Person automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz (inkl. des bekannten VSD-Datensatzes), der dann via KIM der Praxis zugestellt wird.

Das Praxisverwaltungssystem kann die bereits erfassten bzw. vorhandenen Patientendaten mit den von der Kasse bereitgestellten Versichertenstammdaten aktualisieren.

{{render:ImplementationGuide-images-out-gkv-ersatzverfahren}}
