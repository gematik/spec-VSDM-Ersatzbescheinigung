---
parent:
---
# QR-Code-Scan

- [QR-Code-Scan](#qr-code-scan)
  - [Nutzung des QR-Codes durch Versicherte](#nutzung-des-qr-codes-durch-versicherte)
  - [Aufbau und Inhalt des QR-Codes](#aufbau-und-inhalt-des-qr-codes)
    - [Weitere QR-Code-Generatoren:](#weitere-qr-code-generatoren)

Der QR-Code-Scan ist Voraussetzung für folgende zwei Use Cases, die von den Versicherten über ihre Versicherten-App (PKV) bzw. Kassen-App (GKV) angestoßen werden können:

- PKV: Übermittlung der Versichertenstammdaten via Online Check-in
- GKV: Übermittlung der elektronischen Ersatzbescheinigung

Auf der Seite <https://www.praxis-check-in.de/leistungserbringer> finden Leistungserbringer Hinweise zur Bereitstellung des QR-Codes sowie einen Code-Generator, um einen Code für ihre Einrichtung zu erstellen. Perspektivisch ist auch denkbar, dass Primärsystemhersteller eine die Funktionalität zum Generieren des QR-Codes direkt in ihrem System zur Verfügung stellen.

Der QR-Code wird durch Leistungserbringer nur dann bereitgestellt, wenn die Praxisverwaltungssoftware bzw. das Krankenhausinformationssystem eEB-Bescheinigungen und Nachrichten zum Online Check-in annehmen und verarbeiten kann sowie die rechtlichen organisatorischen Rahmenbedingungen erfüllt sind. So ist sichergestellt, dass die Verfahren nur von Leistungserbringern durchgeführt werden, die auch die Voraussetzungen dafür mitbringen.

## Nutzung des QR-Codes durch Versicherte

Der QR-Code kann auf zwei Wegen von Versicherten gescannt werden:

1. Der QR-Code wird in der geöffneten Versicherten-App (PKV) bzw. Kassen-App (GKV) durch eine Scanfunktion in der App eingelesen und anschließend verarbeitet.
2. Der QR-Code wird zunächst mit der Kamera-App auf dem Gerät (Smartphone) gelesen, welche die im QR-Code hinterlegte URL <https://www.praxis-check-in.de> im Browser des Geräts öffnet.

Auf der Seite <https://www.praxis-check-in.de> haben Versicherte dann die Möglichkeit der Wahl der zu startenden App, mit welcher dann ein Online Check-In durchgeführt bzw. eine elektronische Ersatzbescheinigung angefordert werden soll. Der App-Start erfolgt durch eine Weiterleitung zu einer gemeldeten URL (Landing-Page) des jeweiligen App-Herausgebers.

Von einem automatischen Öffnen durch einheitliche .well-known-Dateien auf der Seite <https://www.praxis-check-in.de> wurde Abstand genommen, da das Multi-App-Szenario (Unterschiedliche Kassen-Apps für Eltern- und Kind-Versicherung, Private Zusatzversicherung, etc.) als zu verbreitet angenommen wird. App-Herausgeber können den Eintrag einer Weiterleitungs-URL zum Öffnen ihrer App im Service Portal <https://service.gematik.de/servicedesk/customer/portals> der gematik melden.

## Aufbau und Inhalt des QR-Codes

Der QR-Code für den Online Check-in enthält die KIM-Adresse einer Praxis. Das folgende Beispiel enthält die KIM-Adresse einer fiktiven Praxis Dr. Baldgesund: `praxis-dr-baldgesund@kim-dienstleister.kim.telematik`

{{render:guides-eeb-oci-images-qr-sample}}

Versicherte könnten den Hinweis auf die Scan-Funktion in ihrer App übersehen und stattdessen die Standard-Kamerafunktion ihres Gerätes nutzen, um den Code zu scannen. Damit auch diese Versicherten zum Ziel kommen, ist vorgesehen, dass der QR-Code auf eine `URL` verweist, durch welche ein Öffnen der App zum Online Check-in initiiert werden kann.

```json
  https://www.praxis-check-in.de?mail=<KIM-Adresse>
```

oder auch

```json
  https://www.praxis-check-in.de/?mail=<KIM-Adresse>
```

- `mail` benennt dabei die KIM-Adresse, an welche die Daten für den Online Check-in gesendet werden sollen.

> **Hinweis**
>
> Die URL ist sowohl mit "/" als auch ohne "/" vor dem "?" `rfc-3986`-konform.
> Die gematik empfiehlt hier ein URL-Fomat, hat jedoch keinen Einfluss auf frei im Internet genutzte Schreibweisen.
>
> **Ebenso ist es (immer) ratsam, in der App zum Einlesen des QR-Codes jeglichen User-Input zu validieren.**

### Weitere QR-Code-Generatoren:

- https://qr.io/
- https://qr-code-styling.com/
- https://www.qrcode-generator.de

> **Hinweis**
>
> Die gematik veröffentlicht auf der Landing-Page <https://www.praxis-check-in.de/> eine Liste von Kassen bzw. Versicherungen, die der gematik eine Weiterleitungs-URL gemeldet haben. Durch Auswahl der eigenen Kasse bzw. Versicherung werden Nutzende auf eine Seite weitergeleitet, auf der die Kasse bzw. Versicherung Informationen und Hinweise zum Bezug der jeweiligen App gegeben werden oder sich bei bereits installierter App selbige automatisch öffnet.
> App-Hersteller können der gematik via [JIRA-Service Desk Anfrage](http://service.gematik.de/servicedesk/customer/portals) ihre gewünschte Weiterleitungs-URL mitteilen.

Weitere Hinweise zum Hinterlegen technischer Informationen für die Betriebssysteme:

- https://developer.android.com/training/app-links/verify-android-applinks#multi-app-same-domain
- https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content
