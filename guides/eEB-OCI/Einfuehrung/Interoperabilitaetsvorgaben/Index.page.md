---
parent:
---
# Interoperabilitätsvorgaben Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV) und Online Check-In (OCI/PKV)

Sowohl der Versand der elektronischen Ersatzbescheinigung (eEB) für gesetzlich Versicherte als auch der Online Check-in (OCI) für Privatversicherte dienen einer sicheren digitalen Übermittlung von Versichertenstammdaten (Name, KVNR, ...) von einer Krankenkassenkasse/privaten Krankenversicherung an eine Praxis oder ein Krankenhaus (Ambulanz) via KIM.

Bei gesetzlich Versicherten kann mittels **elektronischer Ersatzbescheinigung** eine Behandlung ermöglicht werden, wenn z.B. aufgrund von Kartenverlust oder Beschädigung der Karte keine Daten via Gesundheitskarte übermittelt werden können. Die eEB dient dem Versicherungsnachweis. Sie kann sowohl aus dem Praxisverwaltungssystem durch Mitarbeitende der Praxis als auch vom Versicherten via Kassen-App bei der Krankenkasse angefragt werden.

Privatversicherte haben keine Gesundheitskarte. Möchten sie sich jedoch ein E-Rezept ausstellen lassen oder einer Praxis bzw. einem Krankenhaus Zugriff auf die elektronische Patientenakte ermöglichen, benötigen diese die Krankenversichertennummer. Über den **Online Check-in** lässt sie sich sicher an die jeweilige Einrichtung übermitteln. Der OCI wird dabei immer vom Versicherten per App angestoßen.

Beide Verfahren orientieren sich beim genutzten Datensatz am etablierten VSDM-Standard der GKV. Zum Einsatz kommen dementsprechend das FHIR-Profil `EEBCoverageEgk`, welches bei gesetzlich Versicherten zusätzlich um `geschuetzteVersichertendaten` erweitert wird.

Bei der versicherteninitiierten Anfrage einer eEB oder eines OCI via App wird ein vergleichbarer Ansatz verfolgt. So können medizinische Einrichtungen einen QR-Code bereitstellen, der sowohl von gesetzlich als auch Privatversicherten mit einer App ihrer Versicherung gescannt werden kann, um die Praxis als Adressat der Daten zu erfassen.

Durch größtmögliche Standardisierung soll eine aufwandarme Umsetzung in Primärsystemen und komfortable Anwendung in Praxen und Krankenhäusern (Ambulanzen) ermöglicht werden.
