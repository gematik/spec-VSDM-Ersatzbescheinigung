---
parent:
---
# Inhalt

- [Inhalt](#inhalt)
- [Unter welchen Bedingungen darf ein Versicherter sein Versicherungsunternehmen mit der Übermittlung der Daten beauftragen?](#unter-welchen-bedingungen-darf-ein-versicherter-sein-versicherungsunternehmen-mit-der-übermittlung-der-daten-beauftragen)
  - [Einschränkung der Datenverarbeitung](#einschränkung-der-datenverarbeitung)
  - [Information des Versicherten](#information-des-versicherten)
  - [Aktive Einwilligung in die Datenverarbeitung](#aktive-einwilligung-in-die-datenverarbeitung)
  - [Dokumentation der Einwilligung zum Online Check-in](#dokumentation-der-einwilligung-zum-online-check-in)
- [Hinweise für den Fehlerfall](#hinweise-für-den-fehlerfall)
- [Was ist wichtig in Hinblick auf eine gute User Experience?](#was-ist-wichtig-in-hinblick-auf-eine-gute-user-experience)

Die Funktionalität zum Online Check-In kann in eine beliebige App der privaten Krankenversicherung integriert werden – zum Beispiel die Service-App oder die ePA-App. Wichtig ist, dass vor der Nutzung eine **sichere Authentisierung** erfolgt – idealerweise mit der GesundheitsID.

Folgende Kernfunktionalitäten sind vorgesehen:

- Auswahl des Leistungserbringers via QR-Code-Scan und perspektivisch ggf. auch VZD-Suche
- Zustimmung und Initiierung der Datenübermittlung über den Versicherten
- Historie bereits erfolgter Online Check-ins

# Unter welchen Bedingungen darf ein Versicherter sein Versicherungsunternehmen mit der Übermittlung der Daten beauftragen?

## Einschränkung der Datenverarbeitung

Die Verarbeitung der Daten ist auf den Zweck der Übertragung von Verwaltungsdaten zu begrenzen. Die übermittelte KIM-Adresse darf nicht weitergehend genutzt werden, um beispielsweise das Versichertenprofil anzureichern oder Auswertungen vorzunehmen.

## Information des Versicherten

Das Versicherungsunternehmen muss über die Bedingungen der Nutzung des Dienstes Online Check-in im Rahmen der Datenschutzerklärungen und Nutzungsbedingungen der App informieren. Es muss eine Zustimmung zu den Bedingungen erfolgen, diese muss dokumentiert werden und die zugestimmten Bedingungen müssen für die Versicherten einsehbar bleiben.

## Aktive Einwilligung in die Datenverarbeitung

Die versicherte Person muss dem Versicherungsunternehmen gegenüber der Weitergabe der aufgezählten Daten an den ausgewählten Leistungserbringer transaktionsbasiert aktiv zustimmen.

Der Zustimmungs-Screen enthält folgende Bestandteile:

1. **Anzeige der Daten:** Vor Initiierung des Online Check-In muss dem Versicherten die Möglichkeit gegeben werden, die Daten noch einmal zu prüfen:
   1. Name und Adresse der Praxis, an welche die Daten übermittelt werden sollen
   2. Vollständige Auflistung der zu übermittelnden persönlichen Daten. Die Daten dürfen abstrakt aufgelistet werden (Name, Adresse...). Jedoch hat die konkrete Anzeige der zu übermittelnden Daten den Vorteil, dass der Versicherte nachvollziehen kann, welche Daten an die Praxis übertragen werden.
2. **Ausdrückliche und aktive Einwilligung:** Der Versicherte muss der konkreten Datenübermittlung aktiv zustimmen - zum Beispiel über das Anhaken einer Checkbox mit einem entsprechenden Hinweis. Dabei sollten die Bedingungen noch einmal verlinkt sein.

Eine Datenübermittlung darf nur nach erfolgter transaktionsbasierter ausdrücklicher und aktiver Einwilligung erfolgen. Liegt diese Einwilligung nicht vor, darf eine Datenübermittlung an den Leistungserbringer in keinem Fall erfolgen. Es wird empfohlen das technische Set-up zu dokumentieren, um nachweisen zu können, dass eine Datenübermittlung nur nach vorheriger informierter Zustimmung erfolgen konnte.

## Dokumentation der Einwilligung zum Online Check-in

Das Versicherungsunternehmen muss nachweisen können, dass der Versicherte der konkreten Datenübermittlung zugestimmt hat. Um Privatversicherten die Wahrnehmung ihrer Rechte zu erleichtern, müssen erfolgte Online Check-ins in einer Historie einsehbar sein. Dabei sind mindestens das Datum und die Uhrzeit des Versands, die Daten der empfangenden Praxis (Name und Adresse) sowie der Übertragungsstatus (Versand erfolgreich / nicht erfolgreich) zu nennen. Es wird eine Speicherdauer von 3 Jahren empfohlen. Um Versicherten bei Bedarf einen dauerhaften Zugriff auf diese Daten zu ermöglichen, sollte vor Ablauf der 3 Jahre auf die anstehende Löschung hingewiesen und ein Export der Daten (z. B. im PDF-Format) ermöglicht werden. Letztere Funktionalitäten können nachgelagert implementiert werden.

# Hinweise für den Fehlerfall

Der Versicherte soll ein einfaches Feedback dazu bekommen, ob die KIM-Nachricht erfolgreich versandt oder nicht. Im Fall einer fehlgeschlagenen Datenübermittlung soll er einen aussagekräftigen Hinweis dazu bekommen, wie er nun weiter vorgehen soll.

Um eine unnötige Häufig von Transaktionen zu vermeiden, empfiehlt sich die Programmierung einer "Bremse", sodass innerhalb eines Zeitraums nur eine sinnvoll begrenzte Anzahl von Online Check-Ins möglich ist.

# Was ist wichtig in Hinblick auf eine gute User Experience?

Folgende Aspekte sollten im Sinen einer nutzerfreundlichen Gestaltung beachtet werden:

- Gute Auffindbarkeit und Zugänglichkeit der Funktionalität in der App
- Schnelles und einfaches Durchlaufen des Prozesses
- Aufklärung darüber, wozu der Prozess dient und wann er durchzuführen ist - zum Beispiel in Form eines Onboardings oder Tooltips
- Abgrenzung gegenüber anderen Prozessen wie zum Beispiel der Berechtigungserteilung für die ePA oder dem kurzen Anmelden bei Betreten einer Arztpraxis
