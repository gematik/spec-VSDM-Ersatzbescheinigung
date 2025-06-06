---
parent:
---
# Interoperabilitätsvorgaben Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV) und Online Check-In (OCI/PKV)

- [Einführung](#einführung)
- [FHIR-Versionswechsel und Übergangsphasen](#fhir-versionswechsel-und-übergangsphasen)

# Einführung

Sowohl der Versand der elektronischen Ersatzbescheinigung (eEB) für gesetzlich Versicherte als auch der Online Check-in (OCI) für Privatversicherte dienen einer sicheren digitalen Übermittlung von Versichertenstammdaten (Name, KVNR, ...) von einer Krankenkassenkasse/privaten Krankenversicherung an eine Praxis oder ein Krankenhaus via KIM.

Bei gesetzlich Versicherten kann mittels **elektronischer Ersatzbescheinigung** eine Behandlung ermöglicht werden, wenn z.B. aufgrund von Kartenverlust oder Beschädigung der Karte keine Daten via Gesundheitskarte übermittelt werden können. Die eEB ist somit ein Anspruchsnachweis zur Inanspruchnahme von Leistungen. Sie kann sowohl aus dem Praxisverwaltungssystem durch Mitarbeitende der Praxis als auch vom Versicherten via Kassen-App bei der Krankenkasse angefragt werden.

Privatversicherte haben keine Gesundheitskarte. Möchten sie sich jedoch ein E-Rezept ausstellen lassen oder einer Praxis bzw. einem Krankenhaus Zugriff auf die elektronische Patientenakte ermöglichen, benötigen diese die Krankenversichertennummer. Über den **Online Check-in** lässt sie sich sicher an die jeweilige Einrichtung übermitteln. Der OCI wird dabei immer vom Versicherten per App angestoßen.

Beide Verfahren orientieren sich beim genutzten Datensatz am etablierten VSDM-Standard der GKV. Zum Einsatz kommen die beiden Coverage-FHIR-Profile `EEBCoverageEgk` (Kassen-App-Anfrage) und `EEBCoverageNoAddressLine` (KIM-Anfrage), welche bei gesetzlich Versicherten zusätzlich um geschuetzteVersichertendaten erweitert werden.

Bei der versicherteninitiierten Anfrage einer eEB oder eines OCI via App wird ein vergleichbarer Ansatz verfolgt. So können medizinische Einrichtungen einen QR-Code bereitstellen, der sowohl von gesetzlich als auch Privatversicherten mit einer App ihrer Versicherung gescannt werden kann, um die Praxis als Adressat der Daten zu erfassen.

Durch größtmögliche Standardisierung soll eine aufwandarme Umsetzung in Primärsystemen und komfortable Anwendung in Praxen und Krankenhäusern ermöglicht werden.

# FHIR-Versionswechsel und Übergangsphasen

|UseCase                                          |ab Datum |bis Datum |FHIR-Profilversion der Antwort |KIM-Dienstkennung der Antwort |
|:------------------------------------------------|:--------|:---------|:------------------|:------------------|
|**eEB-Anforderung via KIM** <br />FHIR-Version 1.0.1 |jetzt    |30.09.25  |FHIR-Version 1.0.1 <br />(KBV-Patient 1.1) |V1.1 <br />bzw. V1.0 + FC130 falls KTR noch nicht aktualisiert |
|**eEB-Anforderung via KIM** <br />FHIR-Version 1.1.0 |jetzt    |30.09.25  |FHIR-Version 1.0.1 <br />(KBV-Patient 1.1) |V1.1 <br />bzw. V1.0 + FC130 falls KTR noch nicht aktualisiert |
|**eEB-Anforderung via APP** <br />                   |jetzt    |30.09.25  |FHIR-Version 1.0.0 oder 1.0.1 <br />(KBV-Patient 1.1)|V1.0 |
||||||
|**eEB-Anforderung via KIM** <br />FHIR-Version 1.0.1 |01.10.25 |31.03.26  |FHIR-Version 1.0.1 <br />(KBV-Patient 1.1) |V1.1           |
|**eEB-Anforderung via KIM** <br />FHIR-Version 1.1.0 |01.10.25 |31.03.26  |FHIR-Version 1.1.0 <br />(KBV-Patient 1.2) |V1.1           |
|**eEB-Anforderung via APP** <br />                   |01.10.25 |31.03.26  |FHIR-Version 1.0.0 oder 1.0.1 <br />(KBV-Patient 1.1)|V1.0 |
||||||
|**eEB-Anforderung via KIM** <br />FHIR-Version 1.1.0 |01.04.26 |tbd.      |FHIR-Version 1.1.0 <br />(KBV-Patient 1.2) |V1.1           |
|**eEB-Anforderung via APP** <br />                   |01.04.26 |tbd.      |FHIR-Version 1.1.0 <br />(KBV-Patient 1.2) |V1.1           |
