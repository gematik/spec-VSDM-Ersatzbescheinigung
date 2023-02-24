# Inhalt

Die UseCases der Ersatzbescheinigung digitalisieren den papierbasierten Prozess für Anwendungsfälle in der (Zahn-)Arztparxis, in denen keine eGK als Versicherungsnachweis vorgelegt werden kann. Diese papierbasierten Prozesse sind wegen handschriftlich ausgefüllter Formulare und/oder gefaxter Bescheinigungen langwierig, fehleranfällig und unkomfortabel für alle Beteiligten.

Mit der eEB wird die Anforderung und Ausstellung einer Ersatzbescheinigung automatisierbar. Das auslösende Ereignis (Anforderung) kann ein "Check-In" in der Praxis mittels einer App oder auch eine manuelle Anforderung aus dem Praxisverwaltungssystem durch medizinische Fachangestellte sein.

- [Inhalt](#inhalt)
  - [Rechtliche Einordnung](#rechtliche-einordnung)
  - [UseCase und Funktionsweise (Check-In mittels App)](#usecase-und-funktionsweise-check-in-mittels-app)
  - [UseCase und Funktionsweise (Manuelle Anforderung durch MFA)](#usecase-und-funktionsweise-manuelle-anforderung-durch-mfa)

## Rechtliche Einordnung

Das hier vorgestellte Verfahren des "Online Check-In" bzw. der "elektronischen Ersatzbescheinigung" tangiert die Verfahren, Prozesse und ggfs. Verträge der gesetzlichen (GKV), wie der privaten Krankenversicherung PKV im Arzt-Patienten-Kontakt.

Für Versicherte der gesetzlichen Krankenkassen ist der Nachweis der Anspruchsberechtigung vertraglich in §19 BMV geregelt.
Die vorliegende Spezifikation soll eine Möglichkeit schaffen, mit der Arztpraxen, Zahnarztpraxen und Krankenhäuser eine Ersatzbescheinigung nach §19 Abs. 2 BMV auf elektronischem Weg erhalten können.
Die vorliegende Spezifikation befreit die gesetzlichen Krankenkassen nicht davon, den Versicherten auf Wunsch eine Ersatzbescheinigung in Papierform auszustellen.

Privatversicherte nehmen im Arzt-Patienten-Kontakt zumeist Leistsungen nach der GOÄ in Anspruch. Für Abrechnungszwecke und die Teilhabe an Prozessen der Digitalisierung des Gesundheitswesens ist die Erfassung personenbezogener Daten über den Patienten erforderlich. Da die manuelle Erfassung fehleranfällig und zeitaufwändig ist, stellt die Bereitstellung von Stammdaten über den Patienten, ggfs. im Vorfeld eines geplanten Termins ("Check-In"), einen Gewinn in Zeit und Datenqualität für eine Praxis dar. Die von den PKV-Versicherungsunternehmen an die Praxisverwaltungssysteme geschickten eGK-Datencontainer des VSDM der GKV können dabei optional verarbeitet werden, sie erleichtern den Softwareherstellern die Umsetzung durch das Einlesen von Patientendaten über das etablierte Standarderfahren im GKV-Bereich.
Da für den PKV-Bereich keine "Haupt-" und "Erstzverfahren" in der Erfassung der Arzt-Patienten-Kontakte geregelt sind, obliegt es dem PVS-Markt, diese "Check-In"-Funktion durch eine gute User Experience und kommunikativer Begleitung zu einem Standard-Verfahren werden zu lassen.

Die Nutzung dieses Verfahrens ist für Praxen, Zahnarztpraxen und Krankehäuser freiwillig.

## UseCase und Funktionsweise (Check-In mittels App)

Beim Check-In mittels einer Versicherten-App fordert die versicherte Person die Bereitstellung von Versichertendaten bzw. einer Ersatzbescheinigung an eine konkrete Praxis an. Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

In der Anforderung wird der Kasse die Kennung der Praxis über die App mitgeteilt, die Kasse erstellt automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz, der dann via KIM der Praxis zugestellt wird. Das Praxisverwaltungssystem kann diesen FHIR-Datensatz automatisiert einlesen und nach Bedarf analog zum Einlesen der Versichertenstammdaten der eGK eine neue digitale Patientenkartei anlegen.

_Dieser Anwendungsfall ist primär für Mitglieder der Privaten Krankenversicherung vorgesehen, über den der Praxis die Versichertendaten (Name, Adresse, Geburtsdatum, etc.)  des Patienten bereitgestellt werden._

{{render:ImplementationGuide-images-out-pkv-ersatzverfahren}}

## UseCase und Funktionsweise (Manuelle Anforderung durch MFA)

Die Anforderung zur Ausstellung einer Ersatzbescheinigung für eine versicherte Person kann auch durch das Praxispersonal initiiert werden. Dabei werden Informationen zur zu behandelnden Personen erfasst und aus dem Praxisverwaltungssystem via KIM an die bekannte bzw. benannte Kasse gesendet. Die Kasse erstellt zur angefragten Person automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz, der dann via KIM der Praxis zugestellt wird. Das Praxisverwaltungssystem kann die bereits erfassten bzw. vorhandenen Patientendaten mit den von der Kasse bereitgestellten Versichertenstammdaten aktualisieren.

{{render:ImplementationGuide-images-out-gkv-ersatzverfahren}}
