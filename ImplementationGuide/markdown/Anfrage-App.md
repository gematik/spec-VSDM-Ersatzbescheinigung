# Inhalt

Beim Check-In mittels einer Versicherten-App fordert die versicherte Person die Bereitstellung von Versichertendaten bzw. einer Ersatzbescheinigung an eine konkrete Praxis an. Der Bezug zu einer konkreten Praxis kann mittels Abscannen eines QR-Codes in der Versicherten-App hergestellt werden, der als Ausdruck in einem Aufsteller am Empfangstresen oder auf einer Internetseite (z.B. Terminbuchungsportal) dargestellt wird.

- [Inhalt](#inhalt)
  - [Identifikation und Autorisierung der versicherten Person](#identifikation-und-autorisierung-der-versicherten-person)
  - [Aufbau QR-Code](#aufbau-qr-code)
  - [Kommunikation zwischen App und Backendsystemen](#kommunikation-zwischen-app-und-backendsystemen)

## Identifikation und Autorisierung der versicherten Person

Die Identifikation und Autorisierung der versicherten Person zur Anforderung einer Versicherungsbescheinigung gegenüber der Kasse ist nicht Gegenstand dieser Betrachtungen und wird zwischen der betreffenden Kasse bzw. Versicherungsunternehmen und der durch sie bereitgestellten App umgesetzt.

## Aufbau QR-Code

Der QR-Code stellt technische Informationen über die Praxis zum Abscannen durch eine Versicherten-App bereit.
Diese werden _app-intern_ an das Backend des Versicherungsunternehmens (bzw. der Kasse) übertragen, um anhand dessen, die KIM-Adresse zu verifizieren, an die die Versichertendaten via KIM geschickt werden sollen.

Das Backend des Versicherungsunternehmens kann die übergebene KIM-Adresse mit den Daten im VZD verifizieren und an die App übertragen.
Im Sinne eines geführten Check-Ins in die Praxis können dem Patienten die aus dem VZD anhand der KIM-Adresse gefunden Praxis-Stammdaten (Name, Adresse) zur eigenen Verifikation (_"Ja korrekt, in dieser Praxis möchte ich behandelt werden"_) angezeigt werden. Ebenso kann dazu die Einwilligung in die Übermittlung der eEB-Daten in genau diese Praxis durch den Patienten eingeholt werden.

Für den Start des UseCases zum Online Check-In in der Praxis wird lediglich die KIM-Adresse benötigt, an welche die Praxis die Daten über den Patienten gesendet bekommen möchte. Der Aufbau des QR-Codes gestaltet sich daher sehr schlank.

```json
{
  "mail": "<KIM-Adresse>"
}
```

- `mail` benennt die KIM-Adresse, an die die Praxis eine Ersatzbescheinigung bzw. Online Check-In gesendet haben möchte. Die Daten der Praxis werden dem Patienten zur Verifikation aus dem VZD über das Backend der App bereitgestellt.

Im Folgenden ist ein Beispiel QR-Code für die KIM-Adresse einer fiktiven Praxis _Dr. Baldgesund_ dargestellt. Dr. Baldgesund erhält die KIM-Adresse `praxis-dr-baldgesund@kim-dienstleister.kim.telematik` über die Beantragung eines Kontos bei einem KIM-Anbieter.

<!--- generated at https://gchq.github.io/CyberChef -->
{{render:ImplementationGuide-images-qr-sample}}

Für die Generierung stehen veschiedene Dienste im Internet zur Verfügung, beispielsweise

- https://qr.io/
- https://qr-code-styling.com/
- https://www.qrcode-generator.de

> **Hinweis**
>
> Die Praxis muss ich ihrer KIM-Adresse bewusst sein.
> Diese erhält sie üblicherweise mit der Einrichtung des KIM-Kontos bei einem KIM-Diensteanbieter.
> Für das korrekte Einlesen ist es notwendig, die KIM-Adresse in die oben gezeigte `json`-Struktur einzubetten.
> Die gematik unterstützt bei Bedarf bei der Generierung des QR-Codes für eine Praxis.

## Kommunikation zwischen App und Backendsystemen

Der Aufbau und Inhalt der Kommunikation zwischen App und Backend einer Kasse bzw. eines Versicherungsunternehmens ist nicht Gegenstand dieser Beschreibung.
Diese Kommunikation wird als `kassenintern` betrachtet.
