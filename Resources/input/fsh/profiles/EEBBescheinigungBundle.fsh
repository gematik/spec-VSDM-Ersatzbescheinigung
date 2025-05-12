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
* entry[EEBCoverageNoEgk].link ..0
* entry[EEBCoverageNoEgk].resource 1..
* entry[EEBCoverageNoEgk].resource only EEBCoverageNoEgk
* entry[EEBCoverageNoEgk].search ..0
* entry[EEBCoverageNoEgk].request ..0
* entry[EEBCoverageNoEgk].response ..0
* obeys -eeb-angabePatientPLZ
* obeys -eeb-checkConditionCode49
* obeys -eeb-checkConditionCode30
* obeys -eeb-checkConditionOtherCodes

Invariant: -eeb-angabePatientPLZ
Description: "In der Ressource vom Typ Patient ist keine Postleitzahl vorhanden, diese ist aber eine Pflichtangabe."
Severity: #error
Expression: "entry.where(resource is Patient).resource.address.postalCode.exists()"

Invariant: -eeb-checkConditionCode49
Description: "Wenn Versicherter '1.2.276.0.76.4.49', dann muss EEBCoverageEgk, Patient-Resource mit KVNR und darf eine Straße in der Adressangabe enthalten sein."
Severity: #error
Expression: "entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code = '1.2.276.0.76.4.49' implies (entry.where(resource is Coverage).resource.conformsTo('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk') and entry.where(resource is Patient).resource.identifier.where(type.coding.code = 'GKV').exists() and entry.where(resource is Patient).resource.address.line.exists())"

Invariant: -eeb-checkConditionCode30
Description: "Wenn HBA-Anfrage '1.2.276.0.76.4.30/31/45/46/47', dann muss Coverage entweder EEBCoverageEgk oder EEBCoverageNoEgk sein, Patient-Resource darf KVNR und darf eine Straße in der Adressangabe enthalten."
Severity: #error
Expression: "entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code = '1.2.276.0.76.4.30' implies ((entry.where(resource is Coverage).resource.conformsTo('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk') or entry.where(resource is Coverage).resource.conformsTo('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk')) and entry.where(resource is Patient).resource.identifier.where(type.coding.code = 'GKV').count() <= 1 and entry.where(resource is Patient).resource.address.line.exists())"

Invariant: -eeb-checkConditionOtherCodes
Description: "Wenn eventCoding.code weder HBA noch Versicherter ist, dann darf die Coverage nur vom Profil EEBCoverageEgkNoAddressLine oder EEBCoverageNoEgk sein und die Patient-Resource darf keine Straße in der Adressangabe enthalten."
Severity: #error
Expression: "entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code != '1.2.276.0.76.4.30' and entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code != '1.2.276.0.76.4.31' and entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code != '1.2.276.0.76.4.45' and entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code != '1.2.276.0.76.4.46' and entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code != '1.2.276.0.76.4.47' and entry.where(resource is EEBBescheinigungHeader).resource.eventCoding.code != '1.2.276.0.76.4.49' implies ((entry.where(resource is Coverage).resource.conformsTo('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgkNoAddressLine') or entry.where(resource is Coverage).resource.conformsTo('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk')) and entry.where(resource is Patient).resource.address.line.exists().not())"

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
* id = "43bb7e49-7d03-4dfe-b4d7-df4b6c370d6b"
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
