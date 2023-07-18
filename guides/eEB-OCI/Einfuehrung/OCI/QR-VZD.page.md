---
parent:
---
# Inhalt

- [Inhalt](#inhalt)
- [QR-Code-Scan](#qr-code-scan)
  - [Bereitstellung des QR-Codes](#bereitstellung-des-qr-codes)
  - [Aufbau des QR-Codes](#aufbau-des-qr-codes)

Für die Auswahl des Leistungserbringers in der App der Versicherung sind zwei Wege denkbar:

1. QR-Code-Scan
Bei diesem Verfahren stellt die Praxis einen QR-Code mit ihrer KIM-Adresse bereit, den Privatversicherte mit ihrer App-Funktionalität scannen können. Dieses ermöglicht eine eindeutige Zuordnung, die vor allem größeren Einrichtungen mit mehreren KIM-Adressen vorteilhaft ist. Auch können sich Versicherte bei Praxen mit QR-Code sicher sein, dass diese das Verfahren auch bereits unterstützen. Deshalb sollte dieses Verfahren App-seitig priorisiert angeboten werden.

1. VZD-Suche
Die Suchfunktionalität in der App greift auf Daten des Verzeichnisdienstes der gematik zurück. Somit funktioniert sie auch unabhängig von der Bereitstellung eines QR-Codes und bietet sich vor allem für einen Online Check-In vor dem Arztbesuch an. Jedoch sind Praxen aufgrund der Datenqualität mitunter schwer zu finden. Hinzu kommt, dass große Praxen und Kliniken über mehrere KIM-Adressen verfügen können, was Versicherten die Auswahl erschweren und die Fehleranfälligkeit erhöhen würde. Somit wird empfohlen, die Suchfunktion nachgelagert in Ergänzung zum QR-Code-Scanner anzubieten.

# QR-Code-Scan

Der QR-Code für den Online Check-in wird durch die Praxis bereitgestellt und enthält deren KIM-Adresse. Scannt eine privatversicherte Person den Code mit der Scan-Funktion der App-Funktionalität zum Online Check-in, wird die KIM-Adresse backendseitig mit dem Verzeichnisdienst (VZD) abgeglichen. Die Praxisdaten aus dem VZD werden der versicherten Person dann in der App angezeigt. So kann sie sich sicher sein, dass ihre Daten an die richtige Praxis übermittelt werden.

## Bereitstellung des QR-Codes

Die Praxis sucht die KIM-Adresse heraus, die für den Online Check-in genutzt werden soll. Diese erhält sie üblicherweise mit der Einrichtung des KIM-Kontos bei einem KIM-Dienstanbieter.
Hier ein Beispiel einer fiktiven Praxis Baldgesund mit der KIM-Adresse `praxis-dr-baldgesund@kim-dienstleister.kim.telematik`

{{render:guides-eeb-oci-images-qr-sample}}

Die Praxis erstellt den QR-Code. Dazu kann beispielsweise der QR-Code-Generator auf der von der gematik bereitgestellten Seite <https://wwww.praxis-check-in.de> genutzt werden. Perspektivisch ist auch denkbar, dass Primärsystemhersteller eine solche Funktionalität direkt im System zur Verfügung stellen.

Weitere QR-Code-Generatoren:

- https://qr.io/
- https://qr-code-styling.com/
- https://www.qrcode-generator.de

Die Praxis stellt den QR-Code vor Ort (z. B. am Empfangstresen), auf der Praxiswebsite oder im Zuge der Online-Terminvereinbarung zur Verfügung. Dabei wird empfohlen, einen kurzen Hinweis zur Nutzung hinzuzufügen. Auch die Darstellung der Praxisdaten wie im VZD hinterlegt kann hilfreich sein, da diese teilweise so stark von dem bekannten Praxisnamen abweichen, dass Patientinnen und Patienten die Zuordnung schwerfällt.

## Aufbau des QR-Codes

Versicherte könnten den Hinweis auf die Scan-Funktion in ihrer App übersehen und stattdessen die Standard-Kamerafunktion ihres Gerätes nutzen, um den Code zu scannen. Damit auch diese Versicherten zum Ziel kommen, ist vorgesehen, dass der QR-Code auf eine `URL` verweist, durch welche ein Öffnen der App zum Online Check-in initiiert werden kann.

```json
  https://www.praxis-check-in.de?mail=<KIM-Adresse>
```

- `mail` benennt dabei die KIM-Adresse, an welche die Daten für den Online Check-in gesendet werden sollen.

> **Hinweis**
>
> Die gematik veröffentlicht unter der URL <https://wwww.praxis-check-in.de/.well-known/> eine Konfiguration für Anroid (assetlinks.json) und iOS-Geräte(apple-app-site-association),
> mittels der die App auf Smartphones von Versicherten beim Scannen des QR-Codes automatisch gestartet werden kann.
> App-Hersteller können der gematik via [JIRA-Service Desk Anfrage](http://service.gematik.de/servicedesk/customer/portals) ihre benötigte Konfiguration als JSON-Datei bereitstellen.

Weitere Hinweise zum Hinterlegen technischer Informationen für die Betriebssysteme:

- https://developer.android.com/training/app-links/verify-android-applinks#multi-app-same-domain
- https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content
