# Inhalt

Beim Check-In mittels einer Versicherten-App fordert die versicherte Person die Bereitstellung von Versichertendaten bzw. einer Ersatzbescheinigung an eine konkrete Praxis an. Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

- [Inhalt](#inhalt)
  - [Identifikation und Autorisierung der versicherten Person](#identifikation-und-autorisierung-der-versicherten-person)
  - [Aufbau QR-Code](#aufbau-qr-code)
  - [Anforderung zur Ausstellung einer Versicherungsbescheinigung](#anforderung-zur-ausstellung-einer-versicherungsbescheinigung)

## Identifikation und Autorisierung der versicherten Person

Die Identifikation und Autorisierung der versicherten Person zur Anforderung einer Versicherungsbescheinigung gegenüber der Kasse ist nicht Gegenstand dieser Betrachtungen und wird zwischen der betreffenden Kasse bzw. Versicherungsunternehmen und der durch sie bereitgestellten App umgesetzt.

## Aufbau QR-Code

Der QR-Code stellt technische Informationen über die Praxis zum Abscannen durch eine Versicherten-App bereit.
Diese werden _app-intern_ an das Backend des Versicherungsunternehmens (bzw. der Kasse) übertragen, um anhand dessen, die KIM-Adresse zu verifizieren, an die die Versichertendaten via KIM geschickt werden sollen.
Diese Daten können dem VZD-Eintrag der Praxis oder Stammdaten des Primärsystems wie SMC-B-Zertifikate entnommen werden.
Um dem Empfänger die Authentizität der enthaltenen Daten zuzusichern, wird diese mit einer technischen Identität signiert.
Der Transport als JWT (JSON Web Token, [rfc7519]) erlaubt die Signaturprüfung mit Bibliotheken der Webentwicklung.

Die Generierung erfolgt im Verzeichnisdienst der Telematikinfrastruktur, Leistungserbringer können über den Zugang zur Verwaltung ihres VZD-Eintrags einen Code aus den für sie hinterlegten Daten generieren lassen und herunterladen. Das JWT in `base64`-Darstellung

```
ewogICJhbGciOiAiRVMyNTYiLAogICJhcHAiOiAib2NpIiwKICAia2lkIjogIjQwNzc3NjAyNzM2NzM2NiIKfQ.ewogICJ0aWQiOiAiMy1TTUMtQi1UZXN0a2FydGUtODgzMTEwMDAwMTE2ODczIgp9.7ylIwW9XOYiow_axfTnk35PHYN4JJTi4n3KAeRxyZq-mYhwmR9bJAFeu55i65ajU-iUXT6E-0mDUwJYV5JW6Ug
```

enthält einen Header mit folgenden Informationen

```json
{
  "alg": "ES256",
  "app": "oci",
  "kid": "407776027367366"
}
```

- `alg` kennzeichnet den Signaturalgorithmus zum Schutz des JWT
- `app` ist ein proprietärer Header zur Kennzeichnung, dass der Payload Informationen für den *O*nline *C*heck*I*n enthält (s.u. TelematikID)
- `kid` enthält die Seriennummer `407776027367366` des Zertifikats zur JWT-Signaturprüfung. Eine Einbettung des kompletten Signaturzertifikats würde den QR-Code derart vergrößern, dass er auf kleinen Displays nicht in ausreichender Scan-Qualität dargestellt werden kann.

Der Payload transportiert die für diesen Anwendungsfall notwendige TelematikID `3-SMC-B-Testkarte-883110000116873"` mit der im Backend nach einer korrespondierenden KIM-Empfängeradresse der Praxis im VZD gesucht werden kann.

```json
{
  "tid": "3-SMC-B-Testkarte-883110000116873"
}
```
<!--- generated at https://gchq.github.io/CyberChef -->
{{render:ImplementationGuide-images-qr-sample}}

Das JWT wird durch die Kassen-App gescannt und an das Kassen-Backend übertragen, wo die Kasse die Daten und Signatur prüft.
Neben der Signaturprüfung sind intern fachliche Prüfungen durch den Kostenträger möglich.

## Anforderung zur Ausstellung einer Versicherungsbescheinigung

Der Aufbau und Inhalt der Kommunikation zwischen App und Kasse ist nicht Gegenstand dieser Beschreibung.
Diese Kommunikation wird als `kassenintern` betrachtet.

Nach Bedarf kann die Datenstruktur [KBV_PR_FOR_Organization](https://simplifier.net/for/kbvprfororganization "KBV formularübergreifende Festlegungen") genutzt werden, um die KIM-Empfängeradresse der Praxis zur Zustellung der Versicherungsbescheinigung des Versicherungsunternehmens bzw. der Kasse mitzuteilen.
Die KIM-Empfängeradresse würde dabei im Value-Feld des Attributes `telecom` und dem System `email` eingetragen werden.

<iframe src="https://www.simplifier.net/embed/render?id=for/kbvprfororganization" style="width: 100%;height: 320px;"></iframe>
