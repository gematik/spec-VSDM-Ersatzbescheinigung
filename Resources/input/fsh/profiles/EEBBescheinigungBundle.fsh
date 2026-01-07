Invariant: -eeb-angabePatientPLZ
Description: "In der Ressource vom Typ Patient ist keine Postleitzahl vorhanden, diese ist aber eine Pflichtangabe."
Severity: #error
Expression: "entry.where(resource is Patient).resource.address.postalCode.exists()"

Invariant: -eeb-checkConditionCode49
Description: "Wenn Versicherter '1.2.276.0.76.4.49', dann muss EEBCoverageEgk, Patient-Resource muss mit KVNR  [authentisierte App-Anfrage]."
Severity: #error
Expression: "entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.49' implies (entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk') and entry.where(resource is Patient).resource.identifier.count() > 0)"

Invariant: -eeb-checkConditionOtherCodes
Description: "Wenn eventCoding.code weder HBA noch Versicherter ist, dann darf die Coverage nur vom Profil (EEBCoverageEgkNoAddressLine oder EEBCoverageNoEgk sein) und (die Patient-Resource darf keine Straße in der Adressangabe enthalten oder muss ein Postfach sein) [SMC-B Prüfung]."
Severity: #error
Expression: "(entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.30' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.31' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.45' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.46' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.47' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.49').not() implies ((entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgkNoAddressLine') or entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk')) and (entry.where(resource is Patient).resource.address.line.count() = 0 or entry.where(resource is Patient).resource.address.type = 'postal'))"


Profile: EEBBescheinigungBundle
Parent: Bundle
Id: EEBBescheinigungBundle
* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBBescheinigungBundle) (exactly)

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


// Beispielgenerierung
Instance: EEBBescheinigungBundleSampleEgk
InstanceOf: EEBBescheinigungBundle
Title:   "Bescheinigung EEBBescheinigungBundleEgk eEB-Header 1.0, triggered via App or queried with HBA signature"
Usage: #example
* id = "9b6ac30d-246d-4eab-af83-544564792089"
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


// Known Error -->
// Bundle | Constraint failed: -eeb-checkConditionOtherCodes: 'Wenn eventCoding.code weder HBA noch Versicherter ist,
// dann darf die Coverage nur vom Profil (EEBCoverageEgkNoAddressLine oder EEBCoverageNoEgk sein) und
// (die Patient-Resource darf keine Straße in der Adressangabe enthalten oder muss ein Postfach sein) [SMC-B Prüfung].'
// (defined in https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle)
Instance: EEBBescheinigungBundleSampleNoEgk
InstanceOf: EEBBescheinigungBundle
Title:   "Bescheinigung EEBBescheinigungBundleNoEgk no KVNR available, queried with HBA signature or eEB-Header 1.1"
Usage: #example
* id = "43bb7e49-inva-lide-pati-entstrassed6b"
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
Instance: EEBBescheinigungHeaderTKExample
InstanceOf: EEBBescheinigungHeader
Usage: #inline
* id = "c600beab-92f3-4c4f-a0a4-795681533141"
* eventCoding = https://gematik.de/fhir/directory/CodeSystem/PractitionerProfessionOID#1.2.276.0.76.4.49 "Versicherte/-r"
* source.endpoint = "http://www.tk.de"

Instance: PatientExample
InstanceOf: KBV_PR_FOR_Patient
Usage: #inline
* id = "cb7d4484-bade-47f5-985f-86196b6678a2"
* identifier[versichertenId].type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
* identifier[versichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId].value = "A819745621"
* name[name]
  * use = #official
  * family = "TK-eEB-QR-Code"
    * extension[nachname].valueString = "TK-eEB-QR-Code"
  * given = "Lisa"

* birthDate = "1969-02-23"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].city = "München"
* address[Strassenanschrift].postalCode = "80805"
* address[Strassenanschrift].country = "D"
* address[Strassenanschrift].line = "Berliner Str. 85"
* address[Strassenanschrift].line.extension[Strasse].valueString = "Berliner Str."
* address[Strassenanschrift].line.extension[Hausnummer].valueString = "85"


Instance: CoverageExample
InstanceOf: EEBCoverageEgk
Usage: #inline
* id = "90733223-ef0d-426a-8248-f28c55846933"
* extension[versionEgk].valueString = "5.2.0"
* extension[allgemeineVersicherungsdaten].valueBase64Binary = "H4sIAAAAAAAAALVS30/CMBD+V5a+Q7fhMjBdCYIxZAJGFI0vpG7Htmy7mbag8tfbETSMEPTFlzbf3X0/0h7rf5SFtQGpsgoD4rRtYgFGVZxhEpDxfNbqdr1ey/GIpbTAWBQVQkA+QZE+Z4/D5aAoEighQ1jUIlEKco2JioUGfJ7cWsPRZLm4vp+PZ9OAeG23NjCWqAKSav12Sem7ahsFobO8HQNdCbpRcVkfdGPmCWc/whrkAaptVJSu9ZazK0gyRO7a7oXtuC6j+wILK2WCaCkgqckNmAOiEeGO7Xi+5zk9Rk/2m6xCAMYgzRMBHx0xDntsKkrgDxClmOUgrVAKNIq5UAoY3TXZ4FXW/R3pb0m7Hd/37M5/JA2/U9EzsegxPvkdL2sl9DbDVaUa4CZcNL4ThdTcORDZlw45y30ao7/c8Z9md9w3pPpm9NwkPbamjWC0uVj0923mX0VJQk0vAwAA"
* extension[persoenlicheVersichertendaten].valueBase64Binary = "H4sIAAAAAAAAAI1S21LCMBD9lU7e21C0WJxtGG6jjFwUFH1jYrvSjm3qJAEv3+6DWwQExwdfkpyzm7Mnu4HWW5E7a9QmK1XEfK/GHFRxmWRqGbHBbOKGYdB0/YA5xkqVyLxUGLF3NKwl4K67uKarJao8i1OcVzK0a4uUScvDaOh0e6PFvD+dDSbjiAVevapANZWJWGrtyznnr8ZbYiFt9uwlyJ8kX5ukqBa+pnwm4EBXHyG1GPREO/SbZ6dBo+4D/x2DjT0l4AIfV9oacrUqhN9sNGv1+gnwIxrmpVayQDHMjCStLYKxjNPN6fbKxX7HvZm63TJB4PsAyZs4zTFOrbivVPcIZlZLY1C1E420k6PS2Bwz+yHTXIS1sBYAP+Jgoq0YfSp6hgJeARhS5wXcl6kylJRLai9qGhKKHvC/aODfV7bVRQd1ninUDhEe8B0Nl3Jl1KooqK8h+TiA+6Qf53zXTH48EP6PbyC+AA9oidhpAgAA"
* extension[geschuetzteVersichertendaten].valueBase64Binary = "H4sIAAAAAAAAAIVPXWvCQBD8K+HezWohoGXvpGgpQq3QUBFf5EjWXPByKblN2ubX90ILtSj4Mvs1zMzi/LOyUUeNL2snxSQei4hcVuelK6RYpZvRdJrMRpNERJ61y7WtHUnxRV7MFb4tDk/kM9MS90zbQSUz1DAFYoDd+jlaLNeH7eNrutq8SJHEd4NBsHReCsP8fg/w4eOCKs3lKc4Jjho6n1cDQBf4QuG+7bWxrSt8iMCtV5j+1DHCb4dwhUSWTlx24TluNBWk8IGanm3IqGYIfwPutXH6/PZ/EWwuteD28+obUb40hF4BAAA="

* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV "gesetzliche Krankenversicherung"
* beneficiary = Reference(Patient/cb7d4484-bade-47f5-985f-86196b6678a2)
* period.start = "2024-02-09"
* period.end = "2024-03-31"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "101575519"
* payor.display = "Techniker Krankenkasse"


// TK Beispiel Neugeboren oder Kassenwechsel (noch ohne KVNR)
Instance: EEBBescheinigungBundle2
InstanceOf: EEBBescheinigungBundle
Usage: #example
* id = "4a270af6-nneu-ohne-kvnr-dfe20acfb5c5"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4a270af6-1234-5678-abcd-dfe20acfb5c5"
* type = #message
* entry[0].fullUrl = "https://gematik.de/fhir/MessageHeader/e184d490-22f3-4009-892e-77b9bc9a7504"
* entry[=].resource = e184d490-22f3-4009-892e-77b9bc9a7504
* entry[+].fullUrl = "https://gematik.de/fhir/Patient/2e67b7dc-24c0-4b23-9487-9a7dd8e140cd"
* entry[=].resource = 2e67b7dc-24c0-4b23-9487-9a7dd8e140cd
* entry[+].fullUrl = "https://gematik.de/fhir/Coverage/fcdf444c-8b0b-49ed-be0c-2ba3ee8a9254"
* entry[=].resource = fcdf444c-8b0b-49ed-be0c-2ba3ee8a9254
* timestamp = "2025-05-16T10:28:38.475+02:00"

Instance: e184d490-22f3-4009-892e-77b9bc9a7504
InstanceOf: MessageHeader
Usage: #inline
* eventCoding = https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID#1.2.276.0.76.4.50 "Betriebsstätte Arzt"
* source.endpoint = "http://www.tk.de"
* response.code = #ok
* response.identifier = "8e2df5fe-2691-4277-936c-9cc2140b189b"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"

Instance: 2e67b7dc-24c0-4b23-9487-9a7dd8e140cd
InstanceOf: KBV_PR_FOR_Patient
Usage: #inline
* identifier[versichertennummer_kvk].type = https://fhir.kbv.de/CodeSystem/KBV_CS_Base_identifier_type#kvk
* identifier[versichertennummer_kvk].system = "http://fhir.de/sid/gkv/kvk-versichertennummer"
* identifier[versichertennummer_kvk].value = "3143112513"
* name[name]
  * use = #official
  * family = "TK-eEB"
    * extension[nachname].valueString = "TK-eEB"
  * given = "Max"

* birthDate = "1969-02-23"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].city = "München"
* address[Strassenanschrift].postalCode = "80805"
* address[Strassenanschrift].country = "D"


Instance: fcdf444c-8b0b-49ed-be0c-2ba3ee8a9254
InstanceOf: EEBCoverageNoEgk
Usage: #inline
* period.start = "2025-05-03"
* period.end = "2025-06-30"

* extension[versichertenart].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS"
* extension[versichertenart].valueCoding.code = #1

* extension[wop].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP"
* extension[wop].valueCoding.code = #71
* extension[wop].valueCoding.display = "Bayern"

* extension[besonderePersonengruppe].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE"
* extension[besonderePersonengruppe].valueCoding.code = #00
* extension[besonderePersonengruppe].valueCoding.display = "nicht gesetzt"

* extension[zuzahlungsstatus].extension[status].valueBoolean = false

* status = #active
* beneficiary = Reference(2e67b7dc-24c0-4b23-9487-9a7dd8e140cd)
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV "gesetzliche Krankenversicherung"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "101575519"
* payor.display = "Techniker Krankenkasse"
* payor.extension[abrechnendeIK]
  * valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
  * valueIdentifier.value = "108377503"