# Inhalt

Beim Check-In mittels einer Versicherten-App fordert die versicherte Person die Bereitstellung eines Versicherungsnachweis bzw. einer Ersatzbescheinigung an eine konkrete Praxis an. Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

- [Inhalt](#inhalt)
  - [Identifikation und Autorisierung der versicherten Person](#identifikation-und-autorisierung-der-versicherten-person)
  - [Aufbau QR-Code](#aufbau-qr-code)
  - [Anforderung zur Ausstellung einer Ersatzbescheinigung](#anforderung-zur-ausstellung-einer-ersatzbescheinigung)

## Identifikation und Autorisierung der versicherten Person

> TODO Thorsten

Die Identifikation und Autorisierung der versicherten Person zur Anforderung einer Ersatzbescheinigung gegenüber der Kasse ist nicht Gegenstand dieser Betrachtungen und wird zwischen der betreffenden Kasse und der durch sie bereitgestellten App umgesetzt.

## Aufbau QR-Code

> TODO eHex

## Anforderung zur Ausstellung einer Ersatzbescheinigung

Der Aufbau und Inhalt der Kommunikation zwischen App und Kasse ist nicht Gegenstand dieser Beschreibung.
Diese Kommunikation wird als `kassenintern` betrachtet.

Nach Bedarf kann die Datenstruktur [KBV_PR_FOR_Organization](https://simplifier.net/for/kbvprfororganization "KBV formularübergreifende Festlegungen") genutzt werden, um die KIM-Empfängeradresse der Praxis zur Zustellung der Ersatzbescheinigung der Kasse mitzuteilen.
Die KIM-Empfängeradresse würde dabei im Value-Feld des Attributes `telecom` und dem System `email` eingetragen werden.

<iframe src=https://www.simplifier.net/embed/render?id=for/kbvprfororganization width=”100%”></iframe>
