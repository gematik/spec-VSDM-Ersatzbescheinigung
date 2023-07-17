---
parent:
---
# Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV)

Die UseCases der elektronischen Ersatzbescheinigung digitalisieren den papierbasierten Prozess für Anwendungsfälle in der (Zahn-)Arztpraxis, in denen keine eGK als Versicherungsnachweis vorgelegt werden kann. Der bisherige papierbasierte Prozess für die Übermittlung von Ersatzbescheinigungen wie bspw. Fax, Papierausstellung usw. und der anschließenden händischen Übernahme der Daten sind langwierig, fehleranfällig und unkomfortabel für einen Großteil der Beteiligten.

Mit dem eEB-Verfahren wird die Anforderung und Ausstellung einer Ersatzbescheinigung für Versicherte der gesetzlichen Krankenkassen automatisierbar.

## Rechtliche Einordnung

Für Versicherte der gesetzlichen Krankenkassen ist der Nachweis der Anspruchsberechtigung vertraglich in §19 BMV geregelt.
Die vorliegende Spezifikation soll eine Möglichkeit schaffen, mit der Arztpraxen, Zahnarztpraxen und Krankenhäuser eine Ersatzbescheinigung nach §19 Abs. 2 BMV auf elektronischem Weg erhalten können.
Die vorliegende Spezifikation befreit die gesetzlichen Krankenkassen nicht davon, den Versicherten auf Wunsch eine Ersatzbescheinigung in Papierform auszustellen.

Die Nutzung dieses Verfahrens ist für Praxen, Zahnarztpraxen und Krankenhäuser freiwillig.

## UseCase und Funktionsweise (Anforderung aus der Praxis)

Die Anforderung zur Ausstellung einer Ersatzbescheinigung für eine gesetzlich versicherte Person kann durch das Praxispersonal initiiert werden.
Für die Anforderung einer Ersatzbescheinigung muss in der Prxis ein minimaler Satz an Informationen zur zu behandelnden Person erfasst und aus dem Praxisverwaltungssystem via KIM an die bekannte bzw. benannte Kasse als Anfrage gesendet werden.
Die Kasse erstellt zur angefragten Person automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz (inkl. des bekannten VSD-Datensatzes), der dann via KIM der Praxis zugestellt wird.

Das Praxisverwaltungssystem kann die bereits erfassten bzw. vorhandenen Patientendaten mit den von der Kasse bereitgestellten Versichertenstammdaten aktualisieren.

{{render:eeb-oci-images-gkv-ersatzverfahren}}
