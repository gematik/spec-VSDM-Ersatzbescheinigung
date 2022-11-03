# Inhalt

Die UseCases der Ersatzbescheinigung digitalisieren den papierbasierten Prozess für Anwendungsfälle in der (Zahn-)Arztparxis, in denen keine eGK als Versicherungsnachweis vorgelegt werden kann. Diese papierbasierten Prozesse sind wegen handschriftlich ausgefüllter Formulare und/oder gefaxter Bescheinigungen langwierig, fehleranfällig und unkomfortabel für alle Beteiligten.

Mit der eEB wird die Anforderung und Ausstellung einer Ersatzbescheinigung automatisierbar. Das auslösende Ereignis (Anforderung) kann ein "Check-In" in der Praxis mittels einer App oder auch eine manuelle Anforderung aus dem Praxisverwaltungssystem durch medizinische Fachangestellte sein.

- [Inhalt](#inhalt)
  - [UseCase und Funktionsweise (Check-In mittels App)](#usecase-und-funktionsweise-check-in-mittels-app)
  - [UseCase und Funktionsweise (Manuelle Anforderung durch MFA)](#usecase-und-funktionsweise-manuelle-anforderung-durch-mfa)

## UseCase und Funktionsweise (Check-In mittels App)

Beim Check-In mittels einer Versicherten-App fordert die versicherte Person die Bereitstellung eines Versicherungsnachweis bzw. einer Ersatzbescheinigung an eine konkrete Praxis an. Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

In der Anforderung wird der Kasse die Kennung der Praxis über die App mitgeteilt, die Kasse erstellt automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz, der dann via KIM der Praxis zugestellt wird. Das Praxisverwaltungssystem kann diesen FHIR-Datensatz automatisiert einlesen und nach Bedarf analog zum Einlesen der Versichertenstammdaten der eGK eine neue digitale Patientenkartei anlegen.

{{render:ImplementationGuide-images-out-pkv-ersatzverfahren}}

## UseCase und Funktionsweise (Manuelle Anforderung durch MFA)

Die Anforderung zur Ausstellung einer Ersatzbescheinigung für eine versicherte Person kann auch durch das Praxispersonal initiiert werden. Dabei werden Informationen zur zu behandelnden Personen erfasst und aus dem Praxisverwaltungssystem via KIM an die bekannte bzw. benannte Kasse gesendet. Die Kasse erstellt zur angefragten Person automatisiert, anhand der in ihrem Backend vorliegenden Versicherungsdaten einen FHIR-Datensatz, der dann via KIM der Praxis zugestellt wird. Das Praxisverwaltungssystem kann die bereits erfassten bzw. vorhandenen Patientendaten mit den von der Kasse bereitgestellten Versichertenstammdaten aktualisieren.

{{render:ImplementationGuide-images-out-gkv-ersatzverfahren}}
