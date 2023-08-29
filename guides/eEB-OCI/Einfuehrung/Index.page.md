---
parent:
---
# Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV) und Online Check-In (OCI/PKV)

Elektronische Ersatzbescheinigung (GKV) und Online Check-In (PKV) dienen der sicheren digitalen Übermittlung von Versichertenstammdaten an Leistungserbringer. Die elektronische Ersatzbescheinigung kommt in Fällen zum Einsatz, in denen keine eGK als Versicherungsnachweis und Träger digitaler Patientenstammdaten (Name, KVNR, ...) vorgelegt werden kann. Der Online Check-in erfolgt primär, um Leistungserbringern die Krankenversichertennummer zur Nutzung von TI-Anwendungen bereitzustellen.

Sowohl der Versand der elektronischen Ersatzbescheinigung (eEB) für gesetzlich Versicherte als auch der Online Check-in (OCI) für Privatversicherte erfolgen von einer Krankenkassenkasse/privaten Krankenversicherung an Leistungserbringer via KIM.

Um den PVS-Herstellern die Umsetzung durch das Einlesen von Patientendaten über das etablierte VSDM-Standardverfahren im GKV-Bereich zu erleichtern, verwenden die PKV Versicherungsunternehmen in der EEB-Bescheinigung die gleichen FHIR-Profile wie die Krankenkassen der GKV. Das FHIR-Profil `EEBCoverageEgk` bietet dazu mit der optionalen Extension geschuetzteVersichertendaten die Möglichkeit, dass PKV-Versicherungsunternehmen auf diesen Eintrag verzichten können.

Das auslösende Ereignis (Anforderung) kann ein von einem Patienten durchgeführter "QR-Code-Scan" in der Praxis mittels einer Kassen- bzw. Versicherten-App oder bei der eEB auch eine manuelle Anforderung aus dem Praxisverwaltungssystem durch Mitarbeitende der Praxis sein.
