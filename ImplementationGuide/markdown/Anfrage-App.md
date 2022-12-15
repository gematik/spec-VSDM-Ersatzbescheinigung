# Inhalt

Beim Check-In mittels einer Versicherten-App fordert die versicherte Person die Bereitstellung eines Versicherungsnachweis bzw. einer Ersatzbescheinigung an eine konkrete Praxis an. Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

- [Inhalt](#inhalt)
  - [Identifikation und Autorisierung der versicherten Person](#identifikation-und-autorisierung-der-versicherten-person)
  - [Aufbau QR-Code](#aufbau-qr-code)
  - [Anforderung zur Ausstellung einer Versicherungsbescheinigung](#anforderung-zur-ausstellung-einer-versicherungsbescheinigung)

## Identifikation und Autorisierung der versicherten Person

Die Identifikation und Autorisierung der versicherten Person zur Anforderung einer Versicherungsbescheinigung gegenüber der Kasse ist nicht Gegenstand dieser Betrachtungen und wird zwischen der betreffenden Kasse bzw. Versicherungsunternehmen und der durch sie bereitgestellten App umgesetzt.

## Aufbau QR-Code

Der QR-Code stellt den Namen `displayName` und die KIM-Adresse `komLeData` der Praxis zum Abscannen durch eine Versicherten-App bereit.
Diese sind dem VZD-Eintrag der Praxis zu entnehmen und können bspw. über das PVS aus dem VZD geladen und in der folgenden JSON-Struktur als QR-Code ausgedruckt werden.

```json
{
 "version": "1",
 "displayName": "Meine Praxis Dr. Müller",
 "komLeData": "1.0,praxis-drmueller03@akquinet.kim.telematik",
 "telematikID": "2-01-7331073310"
}
```
<!--- generated at https://qr.io/ -->
{{render:ImplementationGuide-images-qr-sample}}

Diese JSON-Struktur wird dann durch die Kassen-App an das Kassen-Backend übertragen, wo die Kasse die Daten prüft:

- Existiert für diesen `displayName` ein Eintrag im VZD der Telematikinfrastruktur
- Stimmt die KIM-Adresse aus `komLeData` mit der KIM-Adresse im VZD-Eintrag überein
- (Optional je Kasse: Passt die im VZD hinterlegte `oid` zu einem Institutionstyp, für den Versicherungsbescheinigungen ausgestellt werden)

## Anforderung zur Ausstellung einer Versicherungsbescheinigung

Der Aufbau und Inhalt der Kommunikation zwischen App und Kasse ist nicht Gegenstand dieser Beschreibung.
Diese Kommunikation wird als `kassenintern` betrachtet.

Nach Bedarf kann die Datenstruktur [KBV_PR_FOR_Organization](https://simplifier.net/for/kbvprfororganization "KBV formularübergreifende Festlegungen") genutzt werden, um die KIM-Empfängeradresse der Praxis zur Zustellung der Versicherungsbescheinigung des Versicherungsunternehmens bzw. der Kasse mitzuteilen.
Die KIM-Empfängeradresse würde dabei im Value-Feld des Attributes `telecom` und dem System `email` eingetragen werden.

<iframe src="https://www.simplifier.net/embed/render?id=for/kbvprfororganization" style="width: 100%;height: 320px;"></iframe>
