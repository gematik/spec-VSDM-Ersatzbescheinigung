---
parent:
---
# Implementierungsleitfaden elektronische Ersatzbescheinigung (eEB/GKV) und Online Check-In (OCI/PKV)

Elektronische Ersatzbescheinigung (GKV) und Online Check-In (PKV) dienen der sicheren digitalen Übermittlung von Versichertenstammdaten an Leistungserbringer. Die elektronische Ersatzbescheinigung kommt in Fällen zum Einsatz, in denen keine eGK als Versicherungsnachweis und Träger digitaler Patientenstammdaten (Name, KVNR, ...) vorgelegt werden kann. Der Online Check-in erfolgt primär, um Leistungserbringern die Krankenversichertennummer zur Nutzung von TI-Anwendungen bereitzustellen.

Sowohl der Versand der elektronischen Ersatzbescheinigung (eEB) für gesetzlich Versicherte als auch der Online Check-in (OCI) für Privatversicherte erfolgen von einer Krankenkassenkasse/privaten Krankenversicherung an Leistungserbringer via KIM.

Um den PVS-Herstellern die Umsetzung durch das Einlesen von Patientendaten über das etablierte VSDM-Standardverfahren im GKV-Bereich zu erleichtern, verwenden die PKV Versicherungsunternehmen in der EEB-Bescheinigung die gleichen FHIR-Profile wie die Krankenkassen der GKV.
Die Coverage-FHIR-Profile (`EEBCoverageEgk` und `EEBCoverageEgkNoAddressLine`) bieten dazu mit den optionalen Extensionen die Möglichkeit, dass PKV-Versicherungsunternehmen auf den Eintrag „geschuetzteVersichertendaten“ verzichten können.

Das auslösende Ereignis (Anforderung) kann ein von einem Patienten durchgeführter "QR-Code-Scan" in der Praxis mittels seiner Kassen- bzw. Versicherten-App oder bei der eEB auch eine manuelle Anforderung aus dem Praxisverwaltungssystem durch Mitarbeitende der Praxis sein.

Hier gehts zu den [FHIR-Profilen](https://simplifier.net/vsdm-ersatzbescheinigung)

> **Hinweis zu URLs in FHIR-Bundles**
>
> Folgender Hinweis aufgrund von Rückmeldungen im Feld:
> Einige Systeme zur Validierung der FHIR-Ressourcen dieses Projekts vermelden Fehler bei strenger Validierung, wenn **keine** `fullURL` zu einer Ressource im EEBAnfrageBundle angegeben ist.
> Systeme zur Erstellung von FHIR-Ressourcen müssen neben den Angaben in den FHIR-Profilen auch immer die Spezifikation inkl. der Constraints konditionaler Abhängigkeiten berücksichtigen.
> So ist die `fullUrl` in eines Bundle-Entry zunächst optional, jedoch nur für Transaktions-Bundles und Batches, siehe https://www.hl7.org/fhir/R4/bundle.html#bundle-unique
>
> Die gematik stellt mit dem [TI-Validator](https://github.com/gematik/app-referencevalidator) ein Tool bereit, um solch eine strenge FHIR-Validierung in herstellereigenen Tests zu berücksichtigen.

> **Hinweis zu ePA-Sicherheitsmaßnahmen**
>
> Mit dem 30.04.2025 ist das eEB-Verfahren aufgrund der ePA-Abhängigkeit zu den hcv-Sicherheitsmerkmalen eingeschränkt nutzbar, eEB-Anfragen via KIM bedürfen einer Überarbeitung. eEB-Bescheinigungen, die auf eine eEB-Anfrage via KIM zurückzuführen sind, enthalten zukünftig keine hcv-Merkmale. Hierzu wird ein neues Coverage FHIR-Profil EEBCoverageNoAddressLine eingeführt.
>
> eEB-Bescheinigungen, die aus einer Versicherten-App (PKV oder GKV) angefordert werden, können weitehin nach der bestehenden Spezifikation ausgestellt werden.