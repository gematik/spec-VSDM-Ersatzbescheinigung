---
parent:
---
# QR-Code-Scan

- [QR-Code-Scan](#qr-code-scan)
- [Aufbau und Inhalt des QR-Codes](#aufbau-und-inhalt-des-qr-codes)

Der QR-Code-Scan ist Voraussetzung für folgende zwei Use Cases, die von den Versicherten über ihre Versicherten-App (PKV) bzw. Kassen-App (GKV) angestoßen werden können:

- PKV: Übermittlung der Versichertenstammdaten via Online Check-in
- GKV: Übermittlung der elektronischen Ersatzbescheinigung

Auf der Seite <https://www.praxis-check-in.de> finden Leistungserbringer Hinweise zur Bereitstellung des QR-Codes sowie einen Code-Generator, um einen Code für ihre Einrichtung zu erstellen. Perspektivisch ist auch denkbar, dass Primärsystemhersteller eine die Funktionalität zum Generieren des QR-Codes direkt in ihrem System zur Verfügung stellen.

Der QR-Code wird durch Leistungserbringer nur dann bereitgestellt, wenn die Praxisverwaltungssoftware bzw. das Krankenhausinformationssystem eEB-Bescheinigungen und Nachrichten zum Online Check-in annehmen und verarbeiten kann sowie die rechtlichen organisatorischen Rahmenbedingungen erfüllt sind. So ist sichergestellt, dass die Verfahren nur von Leistungserbringern durchgeführt werden, die auch die Voraussetzungen dafür mitbringen.

# Aufbau und Inhalt des QR-Codes

Der QR-Code für den Online Check-in enthält die KIM-Adresse einer Praxis. Das folgende Beispiel enthält die KIM-Adresse einer fiktiven Praxis Dr. Baldgesund: `praxis-dr-baldgesund@kim-dienstleister.kim.telematik`

{{render:guides-eeb-oci-images-qr-sample}}

Versicherte könnten den Hinweis auf die Scan-Funktion in ihrer App übersehen und stattdessen die Standard-Kamerafunktion ihres Gerätes nutzen, um den Code zu scannen. Damit auch diese Versicherten zum Ziel kommen, ist vorgesehen, dass der QR-Code auf eine `URL` verweist, durch welche ein Öffnen der App zum Online Check-in initiiert werden kann.

```json
  https://www.praxis-check-in.de?mail=<KIM-Adresse>
```

- `mail` benennt dabei die KIM-Adresse, an welche die Daten für den Online Check-in gesendet werden sollen.

Weitere QR-Code-Generatoren:

- https://qr.io/
- https://qr-code-styling.com/
- https://www.qrcode-generator.de

> **Hinweis**
>
> Die gematik veröffentlicht unter der URL <https://www.praxis-check-in.de/.well-known/> eine Konfiguration für Anroid (assetlinks.json) und iOS-Geräte(apple-app-site-association),
> mittels der die App auf Smartphones von Versicherten beim Scannen des QR-Codes automatisch gestartet werden kann.
> App-Hersteller können der gematik via [JIRA-Service Desk Anfrage](http://service.gematik.de/servicedesk/customer/portals) ihre benötigte Konfiguration als JSON-Datei bereitstellen.

Weitere Hinweise zum Hinterlegen technischer Informationen für die Betriebssysteme:

- https://developer.android.com/training/app-links/verify-android-applinks#multi-app-same-domain
- https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content
