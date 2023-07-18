---
parent:
---
# Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV) und Online Check-In (OCI/PKV)

Die UseCases der Ersatzbescheinigung und Online Check-Ins digitalisieren den papierbasierten Prozess für Anwendungsfälle in der (Zahn-)Arztpraxis, in denen keine eGK als Versicherungsnachweis und Träger digitaler Patientenstammdaten (Name, KVNR, ...) vorgelegt werden kann.

Um den PVS-Herstellern die Umsetzung durch das Einlesen von Patientendaten über das etablierte VSDM-Standardverfahren im GKV-Bereich zu erleichtern, verwenden die PKV Versicherungsunternehmen in der EEB-Bescheinigung die gleichen FHIR-Profile wie die Krankenkassen der GKV.
Das FHIR-Profil `EEBCoverageEgk` bietet dazu mit der optionalen Extension `geschuetzteVersichertendaten` die Möglichkeit, dass PKV-Versicherungsunternehmen auf diesen Eintrag verzichten können.

Das auslösende Ereignis (Anforderung) kann ein "Check-In" in der Praxis mittels einer App oder eine manuelle Anforderung aus dem Praxisverwaltungssystem durch Mitarbeitende der Praxis sein.
