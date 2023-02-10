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
* obeys -eeb-angabeVersichertenID
* obeys -eeb-angabePatientPLZ


Invariant: -eeb-angabeVersichertenID
Description: "In der Ressource vom Typ Patient ist keine VersichertenID (GKV oder PKV) vorhanden, diese ist aber eine Pflichtangabe."
Severity: #error
Expression: "entry.where(resource is Patient).resource.identifier.type.coding.where(code='GKV' or code='PKV').exists()"


Invariant: -eeb-angabePatientPLZ
Description: "In der Ressource vom Typ Patient ist keine Postleitzahl vorhanden, diese ist aber eine Pflichtangabe."
Severity: #error
Expression: "entry.where(resource is Patient).resource.address.postalCode.exists()"


// Beispielgenerierung
Instance: EEBBescheinigungBundleSampleEgk
InstanceOf: EEBBescheinigungBundle
Title:   "EEBBescheinigungBundleEgk"
Usage: #example
* id = "9b6ac30d-246d-4eab-af83-544564792089"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:9b6ac30d-246d-4eab-af83-544564792089"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bd901c08-0133-4276-b34b-eb810a62deda"
* entry[=][EEBBescheinigungHeader].resource = EEBBescheinigungHeaderSample
* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* entry[=][KBVFORPatient].resource = KBV_PR_FOR_PatientEgkSample
* entry[+][EEBCoverageEgk].fullUrl = "https://gematik.de/fhir/Coverage/2d4da53a-413a-48fe-b908-2e67b5761523"
* entry[=][EEBCoverageEgk].resource = EEBCoverageEgkSample

Instance: EEBBescheinigungBundleSampleNoEgk
InstanceOf: EEBBescheinigungBundle
Title:   "EEBBescheinigungBundleNoEgk"
Usage: #example
* id = "43bb7e49-7d03-4dfe-b4d7-df4b6c370d6b"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4b06f5c4-dced-4904-b1d2-2e5c64087919"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bd901c08-0133-4276-b34b-eb810a62deda"
* entry[=][EEBBescheinigungHeader].resource = EEBBescheinigungHeaderSample
* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/d62d9d82-2396-4c64-a656-2e67b5761523"
* entry[=][KBVFORPatient].resource = KBV_PR_FOR_PatientNoEgkSample
* entry[+][EEBCoverageNoEgk].fullUrl = "https://gematik.de/fhir/Coverage/e9553161ca3c-413a-48fe-b908-04159be709fb"
* entry[=][EEBCoverageNoEgk].resource = EEBCoverageNoEgkSample