---
parent:
---
# Online Check-in (OCI)

- [Online Check-in (OCI)](#online-check-in-oci)
  - [Häufig gestellte Fragen zum Online Check-in](#häufig-gestellte-fragen-zum-online-check-in)
    - [Welche Personengruppen können den Online Check-in nutzen?](#welche-personengruppen-können-den-online-check-in-nutzen)
    - [Ersetzt der OCI die Anmeldung in der Praxis?](#ersetzt-der-oci-die-anmeldung-in-der-praxis)
    - [Warum kann die Krankenversichertennummer nicht einfach abgetippt werden?](#warum-kann-die-krankenversichertennummer-nicht-einfach-abgetippt-werden)
    - [Gibt es ein Ersatzverfahren für Fälle, in denen ein OCI nicht möglich ist?](#gibt-es-ein-ersatzverfahren-für-fälle-in-denen-ein-oci-nicht-möglich-ist)
    - [Unterliegt der OCI einer Zulassung?](#unterliegt-der-oci-einer-zulassung)
    - [Ist das Verfahren verpflichtend?](#ist-das-verfahren-verpflichtend)
    - [Wie unterscheidet sich das Verfahren von der elektronischen Ersatzbescheinigung (GKV)?](#wie-unterscheidet-sich-das-verfahren-von-der-elektronischen-ersatzbescheinigung-gkv)

Für die Befüllung einer elektronischen Patientenakte oder das Ausstellen eines E-Rezeptes benötigen Leistungserbringer die Krankenversichertennummer sowie weitere Stammdaten der Patientin oder des Patienten. Da Privatversicherte keine elektronische Gesundheitskarte (eGK) haben, dient der OCI einer sicheren digitalen Übermittlung dieser Daten an eine Praxis oder ein Krankenhaus.

Der OCI für Privatversicherte wird von diesen selbst initiiert. Dafür stellt die private Krankenversicherung eine Funktionalität in einer Versicherten-App bereit. Mit dieser wählt die versicherte Person den gewünschten Leistungserbringer aus, indem sie einen dafür bereitgestellten QR-Code mit der KIM-Adresse des Leistungserbringers scannt. Anschließend stimmt sie der Übermittlung der Daten durch das Versicherungsunternehmen an den Leistungserbringer zu.

Das Versicherungsunternehmen bzw. ein beauftragter Dienstleister erstellt eine standardisierte KIM-Nachricht mit den Daten und sendet diese an den ausgewählten Leistungserbringer. Für das Bescheinigungsbundle werden dieselben FHIR-Profile genutzt wie bei der eEB-Bescheinigung der GKV.

Sobald die Bescheinigung via KIM in der Praxis eingeht, werden die Daten eingelesen und mit den Bestandsdaten aus dem Primärsystem abgeglichen. Das Praxispersonal kann die eingetroffenen Daten noch einmal prüfen, um eine korrekte Zuordnung zu einem Bestandspatienten bzw. eine korrekte Neuanlage sicherzustellen.

Da sich die KVNR nur in äußerst seltenen Fällen ändert und der Prozess nicht dem Versicherungsnachweis dient, braucht der OCI in der Regel nur einmal pro Praxis zu erfolgen. Spätere Änderungen der Adresse oder Versicherung können wie bisher manuell im Praxissystem vorgenommen werden.

{{render:guides-eeb-oci-images-pkv-ersatzverfahren}}

## Häufig gestellte Fragen zum Online Check-in

### Welche Personengruppen können den Online Check-in nutzen?

|Einführung des Online Check-In 2023|Mögliche zukünftige Erweiterungen|
|---|---|
|Eigenständige Nutzung durch Privatversicherte ab 16 Jahren| - Privatversicherte Kinder unter 16 Jahren<br/> - Privatversicherte mit Betreuer/Bevollmächtigtem|
|Arztpraxen und Krankenhäuser (Voraussetzung: KIM-Ausstattung / OCI-fähiges Primärsystem / QR-Code mit eigener KIM-Adresse)|Weitere Leistungserbringereinrichtungen (Beispiel: Physiotherapeuten, Hebammen, Sanitätshäuser etc.)|
|Aktive Nutzung vor/bei geplantem Besuch einer Praxis/eines Krankenhauses|Notfallbehandlung|

### Ersetzt der OCI die Anmeldung in der Praxis?

Der Prozess kann über die Übermittlung von Stammdaten die Aufnahme von Neupatientinnen und -patienten erleichtern, ersetzt aber nicht die persönliche Anmeldung in der Praxis.

### Warum kann die Krankenversichertennummer nicht einfach abgetippt werden?

Das manuelle Eintragen einer KVNR ist mit Risiken verbunden. So könnte versehentlich die falsche Nummer vorgelegt werden oder ein Fehler bei der Eingabe passieren. Dieses könnte im Kontext der TI-Anwendungen z. B. dazu führen, dass das E-Rezept bei einem falschen Patienten oder einer falschen Patientin landet. Aus diesem Grund und weil bei einer manuellen Eingabe das Haftungsrisiko bei der Praxis läge, wird dieses Vorgehen nicht empfohlen.

### Gibt es ein Ersatzverfahren für Fälle, in denen ein OCI nicht möglich ist?

Ein Ersatzverfahren ist derzeit nicht vorgesehen. Der OCI dient lediglich der Übertragung der für die Nutzung der TI-Fachanwendungen erforderlichen KVNR sowie weiterer Stammdaten. Er stellt weder Behandlungsvoraussetzung noch einen Versicherungsnachweis oder eine Kostenübernahmebestätigung dar. Der Behandlungsvertrag wird nach wie vor zwischen dem Leistungserbringer und dem Privatversicherten geschlossen. Somit kann eine Behandlung auch ohne OCI erfolgen und der OCI zu einem späteren Zeitpunkt nachgeholt werden. Auch ein Rezept kann ausgestellt werden, da für Privatversicherte die Nutzung des E-Rezeptes nicht verpflichtend ist.

### Unterliegt der OCI einer Zulassung?

Nein, der OCI muss nicht zugelassen werden. Er bedient sich jedoch bereits durch die gematik zugelassener TI-Komponenten:

- KIM-Fachdienst
- KIM-Clientmodul
- Konnektor (ggfs. SZZP falls HSK o.ä. im Einsatz)
- IDP + Authenticator-Modul bzw. -Funktion
- PVS (KBV-Zertifizierung für bestimmte GKV-Funktionen, aber out-of-Scope)

### Ist das Verfahren verpflichtend?

Das Angebot des OCIs ist für Praxen, Zahnarztpraxen und Krankenhäuser freiwillig. Es wird jedoch empfohlen, da hiermit aufwandsarm privatversicherten Patientinnen und Patienten ermöglicht wird, von TI-Services zu profitieren.

### Wie unterscheidet sich das Verfahren von der elektronischen Ersatzbescheinigung (GKV)?

Anders als das eEB-Verfahren bei gesetzlich Versicherten dient der OCI für Privatversicherte nicht dem Versicherungsnachweis. Zudem wird der Prozess immer durch den Privatversicherten selbst initiiert – es ist nicht die Möglichkeit vorgesehen, die Daten aus der Praxis heraus anzufragen. Der Übermittlungsweg von Krankenkasse/Versicherungsunternehmen zur Praxis ist jedoch gleich – ebenso wie die Struktur des übermittelten Datensatzes.
