Profile: EEBBescheinigungBundle
Parent: Bundle
Id: eeb-bescheinigung-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle" (exactly)
* id 1..1
* identifier 1..
* identifier.use 0..0
* identifier.type 0..0
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID als übergreifender Identifier für mehrere Anfragen eines Vorgangs"
* identifier.period 0..0
* identifier.assigner 0..0
* type = #message (exactly)
* timestamp 1..
* total 0..0
* link 0..0
* signature 0..0
* entry 1..
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry 3..3
* entry contains
    EEBBescheinigungHeader 1..1 and
    KBVFORPatient 1..1 and
    EEBCoverageEgk 0..1 and
    EEBCoverageEgkNoAddressLine 0..1 and
    EEBCoverageNoEgk 0..1
* entry[EEBBescheinigungHeader].link ..0
* entry[EEBBescheinigungHeader].resource 1..
* entry[EEBBescheinigungHeader].resource only EEBBescheinigungHeader
* entry[EEBBescheinigungHeader].search ..0
* entry[EEBBescheinigungHeader].request ..0
* entry[EEBBescheinigungHeader].response ..0
* entry[KBVFORPatient].link ..0
* entry[KBVFORPatient].resource 1..
* entry[KBVFORPatient].resource only KBV_PR_FOR_Patient
* entry[KBVFORPatient].search ..0
* entry[KBVFORPatient].request ..0
* entry[KBVFORPatient].response ..0
* entry[EEBCoverageEgk].link ..0
* entry[EEBCoverageEgk].resource 1..
* entry[EEBCoverageEgk].resource only EEBCoverageEgk
* entry[EEBCoverageEgk].search ..0
* entry[EEBCoverageEgk].request ..0
* entry[EEBCoverageEgk].response ..0
* entry[EEBCoverageEgkNoAddressLine].link ..0
* entry[EEBCoverageEgkNoAddressLine].resource 1..
* entry[EEBCoverageEgkNoAddressLine].resource only EEBCoverageEgkNoAddressLine
* entry[EEBCoverageEgkNoAddressLine].search ..0
* entry[EEBCoverageEgkNoAddressLine].request ..0
* entry[EEBCoverageEgkNoAddressLine].response ..0
* entry[EEBCoverageNoEgk].link ..0
* entry[EEBCoverageNoEgk].resource 1..
* entry[EEBCoverageNoEgk].resource only EEBCoverageNoEgk
* entry[EEBCoverageNoEgk].search ..0
* entry[EEBCoverageNoEgk].request ..0
* entry[EEBCoverageNoEgk].response ..0
* obeys -eeb-angabePatientPLZ
* obeys -eeb-checkConditionCode49
* obeys -eeb-checkConditionOtherCodes

Invariant: -eeb-angabePatientPLZ
Description: "In der Ressource vom Typ Patient ist keine Postleitzahl vorhanden, diese ist aber eine Pflichtangabe."
Severity: #error
Expression: "entry.where(resource is Patient).resource.address.postalCode.exists()"

Invariant: -eeb-checkConditionCode49
Description: "Wenn Versicherter '1.2.276.0.76.4.49', dann muss EEBCoverageEgk, Patient-Resource muss mit KVNR  (authentisierte App-Anfrage)."
Severity: #error
Expression: "entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.49' implies (entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk') and entry.where(resource is Patient).resource.identifier.count() > 0)"

Invariant: -eeb-checkConditionOtherCodes
Description: "Wenn eventCoding.code weder HBA noch Versicherter ist, dann darf die Coverage nur vom Profil EEBCoverageEgkNoAddressLine oder EEBCoverageNoEgk sein und die Patient-Resource darf keine Straße in der Adressangabe enthalten (SMC-B Prüfung)."
Severity: #error
Expression: "(entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.30' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.31' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.45' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.46' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.47' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.49').not() implies (entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgkNoAddressLine') and entry.where(resource is Patient).resource.address.line.count() = 0) or (entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk') and entry.where(resource is Patient).resource.identifier.count() = 0)"

// Beispielgenerierung
Instance: EEBBescheinigungBundleSampleEgk
InstanceOf: EEBBescheinigungBundle
Title:   "Bescheinigung EEBBescheinigungBundleEgk eEB-Header 1.0, triggered via App or queried with HBA signature"
Usage: #example
* id = "9b6ac30d-246d-4eab-af83-544564792089"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:9b6ac30d-246d-4eab-af83-544564792089"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bd901c08-0133-4276-b34b-eb810a62deda"
* entry[=][EEBBescheinigungHeader].resource = EEBBescheinigungHeaderSampleHBA
* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/437f2555-2396-4c64-a656-e9553161ca3u"
* entry[=][KBVFORPatient].resource = KBV_PR_FOR_PatientEgkSampleHBAqueried
* entry[+][EEBCoverageEgk].fullUrl = "https://gematik.de/fhir/Coverage/2d4da53a-413a-48fe-b908-2e67b576152u"
* entry[=][EEBCoverageEgk].resource = EEBCoverageEgkSample

Instance: EEBBescheinigungBundleEgkNoAddressLine
InstanceOf: EEBBescheinigungBundle
Title:   "Bescheinigung EEBBescheinigungBundleEgkNoAddressLine eEB-Header 1.1, queried with SMC-b signature"
Usage: #example
* id = "9b6ac30d-246d-4eab-af83-54456479208u"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:9b6ac30d-246d-4eab-af83-544564792089u"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bd901c08-0133-4276-b34b-eb810a62dedu"
* entry[=][EEBBescheinigungHeader].resource = EEBBescheinigungHeaderSampleNoAddressLine
* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* entry[=][KBVFORPatient].resource = KBV_PR_FOR_PatientEgkNoAddressLineSample
* entry[+][EEBCoverageEgk].fullUrl = "https://gematik.de/fhir/Coverage/2d4da53a-413a-48fe-b908-2e67b5761523"
* entry[=][EEBCoverageEgk].resource = EEBCoverageEgkNoAddressLineSample

Instance: EEBBescheinigungBundleSampleNoEgk
InstanceOf: EEBBescheinigungBundle
Title:   "Bescheinigung EEBBescheinigungBundleNoEgk no KVNR available, queried with HBA signature or eEB-Header 1.1"
Usage: #example
* id = "43bb7e49-inva-lide-pati-entstrassed6b"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4b06f5c4-dced-4904-b1d2-2e5c64087919"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/5b3c588d-36f5-42be-a10e-1c48eb800cc3"
* entry[=][EEBBescheinigungHeader].resource = EEBBescheinigungHeaderNoEGKSample
* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/d62d9d82-2396-4c64-a656-2e67b5761523"
* entry[=][KBVFORPatient].resource = KBV_PR_FOR_PatientNoEgkSample
* entry[+][EEBCoverageNoEgk].fullUrl = "https://gematik.de/fhir/Coverage/e9553161ca3c-413a-48fe-b908-04159be709fb"
* entry[=][EEBCoverageNoEgk].resource = EEBCoverageNoEgkSample

Instance: EEBBescheinigungBundleSampleEgkPkv
InstanceOf: EEBBescheinigungBundle
Title:   "Bescheinigung EEBBescheinigungBundleEgkPkv PKV eEB-Header 1.0, triggered via App"
Usage: #example
* id = "cecef81d-ab68-4d5a-9e22-7b3e8edce6e6"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:cecef81d-ab68-4d5a-9e22-7b3e8edce6e6"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/aafed78c-696c-4805-9e7b-d454e1aeb538"
* entry[=][EEBBescheinigungHeader].resource = EEBBescheinigungHeaderPkvSample
* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/e36f9476-0d04-4394-a626-8b4706b005b0"
* entry[=][KBVFORPatient].resource = KBV_PR_FOR_PatientEgkPkvSample
* entry[+][EEBCoverageEgk].fullUrl = "https://gematik.de/fhir/Coverage/d7fbdcd7-f220-4a11-8526-d846e4db2a82"
* entry[=][EEBCoverageEgk].resource = EEBCoverageEgkPkvSample


// TK beispiel für App-Bescheinigung
Instance: EEBBescheinigungHeader
InstanceOf: MessageHeader
Usage: #inline
* id = "c600beab-92f3-4c4f-a0a4-795681533141"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* eventCoding = https://gematik.de/fhir/directory/CodeSystem/PractitionerProfessionOID#1.2.276.0.76.4.49 "Versicherte/-r"
* source.endpoint = "http://www.tk.de"

Instance: PatientExample
InstanceOf: Patient
Usage: #inline
* id = "cb7d4484-bade-47f5-985f-86196b6678a2"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* identifier.value = "A819745621"
* name.use = #official
* name.family = "TK-eEB-QR-Code"
* name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension.valueString = "TK-eEB-QR-Code"
* name.given = "Lisa"
* birthDate = "1969-02-23"
* address.type = #both
* address.line = "Berliner Str. 85"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[0].valueString = "Berliner Str."
* address.line.extension[1].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[1].valueString = "85"
* address.city = "München"
* address.postalCode = "80805"

Instance: CoverageExample
InstanceOf: Coverage
Usage: #inline
* id = "90733223-ef0d-426a-8248-f28c55846933"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* extension[0].url = "http://fhir.de/StructureDefinition/gkv/version-vsdm"
* extension[0].valueString = "5.2.0"
* extension[1].url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* extension[1].valueBase64Binary = "H4sIAAAAAAAAALVS30/CMBD+V5a+Q7fhMjBdCYIxZAJGFI0vpG7Htmy7mbag8tfbETSMEPTFlzbf3X0/0h7rf5SFtQGpsgoD4rRtYgFGVZxhEpDxfNbqdr1ey/GIpbTAWBQVQkA+QZE+Z4/D5aAoEighQ1jUIlEKco2JioUGfJ7cWsPRZLm4vp+PZ9OAeG23NjCWqAKSav12Sem7ahsFobO8HQNdCbpRcVkfdGPmCWc/whrkAaptVJSu9ZazK0gyRO7a7oXtuC6j+wILK2WCaCkgqckNmAOiEeGO7Xi+5zk9Rk/2m6xCAMYgzRMBHx0xDntsKkrgDxClmOUgrVAKNIq5UAoY3TXZ4FXW/R3pb0m7Hd/37M5/JA2/U9EzsegxPvkdL2sl9DbDVaUa4CZcNL4ThdTcORDZlw45y30ao7/c8Z9md9w3pPpm9NwkPbamjWC0uVj0923mX0VJQk0vAwAA"
* extension[2].url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* extension[2].valueBase64Binary = "H4sIAAAAAAAAAI1S21LCMBD9lU7e21C0WJxtGG6jjFwUFH1jYrvSjm3qJAEv3+6DWwQExwdfkpyzm7Mnu4HWW5E7a9QmK1XEfK/GHFRxmWRqGbHBbOKGYdB0/YA5xkqVyLxUGLF3NKwl4K67uKarJao8i1OcVzK0a4uUScvDaOh0e6PFvD+dDSbjiAVevapANZWJWGrtyznnr8ZbYiFt9uwlyJ8kX5ukqBa+pnwm4EBXHyG1GPREO/SbZ6dBo+4D/x2DjT0l4AIfV9oacrUqhN9sNGv1+gnwIxrmpVayQDHMjCStLYKxjNPN6fbKxX7HvZm63TJB4PsAyZs4zTFOrbivVPcIZlZLY1C1E420k6PS2Bwz+yHTXIS1sBYAP+Jgoq0YfSp6hgJeARhS5wXcl6kylJRLai9qGhKKHvC/aODfV7bVRQd1ninUDhEe8B0Nl3Jl1KooqK8h+TiA+6Qf53zXTH48EP6PbyC+AA9oidhpAgAA"
* extension[3].url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten"
* extension[3].valueBase64Binary = "H4sIAAAAAAAAAIVPXWvCQBD8K+HezWohoGXvpGgpQq3QUBFf5EjWXPByKblN2ubX90ILtSj4Mvs1zMzi/LOyUUeNL2snxSQei4hcVuelK6RYpZvRdJrMRpNERJ61y7WtHUnxRV7MFb4tDk/kM9MS90zbQSUz1DAFYoDd+jlaLNeH7eNrutq8SJHEd4NBsHReCsP8fg/w4eOCKs3lKc4Jjho6n1cDQBf4QuG+7bWxrSt8iMCtV5j+1DHCb4dwhUSWTlx24TluNBWk8IGanm3IqGYIfwPutXH6/PZ/EWwuteD28+obUb40hF4BAAA="
* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV "gesetzliche Krankenversicherung"
* beneficiary = Reference(Patient/cb7d4484-bade-47f5-985f-86196b6678a2)
* period.start = "2024-02-09"
* period.end = "2024-03-31"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "101575519"
* payor.display = "Techniker Krankenkasse"

Instance: EEBBescheinigungBundle
InstanceOf: Bundle
Usage: #example
* id = "07ddeb8a-e41e-473a-8724-a513ffb7afce"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:5b9794d3-f292-4692-bc6f-18c1320fd592"
* type = #message
* timestamp = "2024-02-09T06:34:49.645+01:00"

* entry[0].fullUrl = "https://gematik.de/fhir/MessageHeader/c600beab-92f3-4c4f-a0a4-795681533141"
* entry[0].resource = EEBBescheinigungHeader

* entry[1].fullUrl = "https://gematik.de/fhir/Patient/cb7d4484-bade-47f5-985f-86196b6678a2"
* entry[1].resource = PatientExample

* entry[2].fullUrl = "https://gematik.de/fhir/Coverage/90733223-ef0d-426a-8248-f28c55846933"
* entry[2].resource = CoverageExample