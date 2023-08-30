---
parent:
---
# App-Funktionalitäten OCI

- [App-Funktionalitäten OCI](#app-funktionalitäten-oci)
  - [Auswahl des Leistungserbringers in der App](#auswahl-des-leistungserbringers-in-der-app)
    - [QR-Code-Scan](#qr-code-scan)
    - [VZD-Suche](#vzd-suche)
  - [Unter welchen Bedingungen darf ein Versicherter sein Versicherungsunternehmen mit der Übermittlung der Daten beauftragen?](#unter-welchen-bedingungen-darf-ein-versicherter-sein-versicherungsunternehmen-mit-der-übermittlung-der-daten-beauftragen)
    - [Einschränkung der Datenverarbeitung](#einschränkung-der-datenverarbeitung)
    - [Information des Versicherten](#information-des-versicherten)
    - [Ausdrückliche und aktive Einwilligung in die Datenverarbeitung](#ausdrückliche-und-aktive-einwilligung-in-die-datenverarbeitung)
    - [Dokumentation der Einwilligung zum OCI](#dokumentation-der-einwilligung-zum-oci)
  - [Feedback zum Versandstatus](#feedback-zum-versandstatus)
  - [Was ist wichtig in Hinblick auf eine gute User Experience?](#was-ist-wichtig-in-hinblick-auf-eine-gute-user-experience)

Die Funktionalität zum OCI kann in eine beliebige App der privaten Krankenversicherung integriert werden - zum Beispiel die Service-App oder die ePA-App. Wichtig ist, dass vor der Nutzung eine **sichere Authentisierung** erfolgt - idealerweise mit der GesundheitsID.

Folgende Kernfunktionalitäten sind vorgesehen:

- Auswahl des Leistungserbringers via QR-Code-Scan und perspektivisch ggf. auch VZD-Suche
- Zustimmung und Initiierung der Datenübermittlung über den Versicherten
- Feedback zum Versandstatus
- Historie bereits erfolgter OCI

## Auswahl des Leistungserbringers in der App

Für die Auswahl des Leistungserbringers in der App sind prinzipiell zwei Wege möglich:

### QR-Code-Scan

Bei diesem Verfahren stellt die Praxis einen QR-Code mit ihrer KIM-Adresse bereit, den Privatversicherte mit ihrer App-Funktionalität scannen können. Backendseitig wird die KIM-Adresse mit dem Verzeichnisdienst (VZD) abgeglichen. Die Praxisdaten aus dem VZD werden Versicherten dann in der App angezeigt. So können sie sich sicher sein, dass ihre Daten an die richtige Praxis übermittelt werden.

Die Bereitstellung des QR-Codes ermöglicht eine eindeutige Zuordnung, die vor allem größeren Einrichtungen mit mehreren KIM-Adressen vorteilhaft ist. Auch können sich Versicherte bei Praxen mit QR-Code sicher sein, dass diese das Verfahren auch bereits unterstützen. Deshalb sollte dieses Verfahren App-seitig priorisiert angeboten werden.

### VZD-Suche

Die Suchfunktionalität in der App greift auf Daten des Verzeichnisdienstes der gematik zurück. Somit funktioniert sie auch unabhängig von der Bereitstellung eines QR-Codes und bietet sich vor allem für einen OCI vor dem Arztbesuch an. Jedoch sind Praxen aufgrund der Datenqualität mitunter schwer zu finden. Hinzu kommt, dass große Praxen und Kliniken über mehrere KIM-Adressen verfügen können, was Versicherten die Auswahl erschweren und die Fehleranfälligkeit erhöhen würde. Somit wird empfohlen, die Suchfunktion nachgelagert in Ergänzung zum QR-Code-Scanner anzubieten.

## Unter welchen Bedingungen darf ein Versicherter sein Versicherungsunternehmen mit der Übermittlung der Daten beauftragen?

### Einschränkung der Datenverarbeitung

Die Verarbeitung der Daten ist auf den Zweck der Übertragung von Verwaltungsdaten zu begrenzen. Die übermittelte KIM-Adresse darf nicht weitergehend genutzt werden, um beispielsweise das Versichertenprofil anzureichern oder Auswertungen vorzunehmen.

### Information des Versicherten

Das Versicherungsunternehmen muss über die Bedingungen der Nutzung des Dienstes OCI im Rahmen der Datenschutzerklärungen und Nutzungsbedingungen der App informieren. Es muss eine Zustimmung zu den Bedingungen erfolgen, diese muss dokumentiert werden und die zugestimmten Bedingungen müssen für die Versicherten einsehbar bleiben.

### Ausdrückliche und aktive Einwilligung in die Datenverarbeitung

Die versicherte Person muss dem Versicherungsunternehmen gegenüber der Weitergabe der aufgezählten Daten an den ausgewählten Leistungserbringer transaktionsbasiert **ausdrücklich und aktiv zustimmen**.

Der Zustimmungs-Screen enthält folgende Bestandteile:

1. **Anzeige der Daten**: Vor Initiierung des OCI muss dem Versicherten die Möglichkeit gegeben werden, die Daten noch einmal zu prüfen:
   1. Name und Adresse der Praxis, an welche die Daten übermittelt werden sollen
   2. Vollständige Auflistung der zu übermittelnden persönlichen Daten. Die Daten dürfen abstrakt aufgelistet werden (Name, Adresse...). Jedoch hat die konkrete Anzeige der zu übermittelnden Daten den Vorteil, dass der Versicherte nachvollziehen kann, welche Daten an die Praxis übertragen werden.
2. **Ausdrückliche und aktive Einwilligung**: Der Versicherte muss der konkreten Datenübermittlung ausdrücklich und aktiv zustimmen - zum Beispiel über das Anhaken einer Checkbox mit einem entsprechenden Hinweis. Dabei sollten die Bedingungen noch einmal verlinkt sein.

Eine Datenübermittlung darf nur nach erfolgter transaktionsbasierter ausdrücklicher und aktiver Einwilligung erfolgen. Liegt diese Einwilligung nicht vor, darf eine Datenübermittlung an den Leistungserbringer in keinem Fall erfolgen.

### Dokumentation der Einwilligung zum OCI

Um Privatversicherten die Wahrnehmung ihrer Rechte zu erleichtern, müssen erfolgte OCI in einer Historie einsehbar sein. Dabei wird empfohlen, mindestens das Datum und die Uhrzeit des Versands, die Daten der empfangenden Praxis (Name und Adresse) sowie den Übertragungsstatus (Versand erfolgt/ nicht erfolgt) zu nennen. Es wird eine Speicherdauer von 3 Jahren empfohlen. Der Versicherte sollte über die Speicherdauer sowie die nach Ablauf dieser Speicherdauer erfolgende Löschung seiner Daten informiert werden. Um Versicherten bei Bedarf einen dauerhaften Zugriff auf diese Daten zu ermöglichen, sollte ein Export der Daten (z. B. im PDF-Format) ermöglicht werden.

## Feedback zum Versandstatus

Der Versicherte soll ein einfaches Feedback dazu bekommen, ob der Versand der KIM-Nachricht erfolgen konnte oder nicht. Im Fall einer fehlgeschlagenen Datenübermittlung soll er einen aussagekräftigen Hinweis dazu bekommen, wie er nun weiter vorgehen soll.

Um eine unnötige Häufung von Transaktionen zu vermeiden, empfiehlt sich die Programmierung einer "Bremse", sodass innerhalb eines Zeitraums nur eine sinnvoll begrenzte Anzahl von OCI möglich ist.

## Was ist wichtig in Hinblick auf eine gute User Experience?

Folgende Aspekte sollten im Sinne einer nutzerfreundlichen Gestaltung beachtet werden:

- Gute Auffindbarkeit und Zugänglichkeit der Funktionalität in der App
- Schnelles und einfaches Durchlaufen des Prozesses
- Aufklärung darüber, wozu der Prozess dient und wann er durchzuführen ist - zum Beispiel in Form eines Onboardings oder Tooltips
- Abgrenzung gegenüber anderen Prozessen wie zum Beispiel der Berechtigungserteilung für die ePA oder dem kurzen Anmelden bei Betreten einer Arztpraxis
