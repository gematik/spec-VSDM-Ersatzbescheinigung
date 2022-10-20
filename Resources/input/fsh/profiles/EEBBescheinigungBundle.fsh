Profile: EEBBescheinigungBundle
Parent: Bundle
Id: eeb-bescheinigung-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* ^version = "1.0"
* ^status = #draft
* identifier 1..
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID"
* type = #message (exactly)
* timestamp 1..
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry contains
    Header 1..1 and
    Patient 0..1 MS and
    Coverage 1..1
* entry[Header].link ..0
* entry[Header].resource 1..
* entry[Header].resource only EEBBescheinigungHeader
* entry[Header].search ..0
* entry[Header].request ..0
* entry[Header].response ..0
* entry[Patient].link ..0
* entry[Patient].resource 1..
//* entry[Patient].resource only KBV_PR_FOR_Patient
* entry[Patient].resource only KnownPatient or UnknownPatient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Coverage].link ..0
* entry[Coverage].resource 1..
* entry[Coverage].resource only EEBCoverageEgk or EEBCoverageNoEgk
* entry[Coverage].search ..0
* entry[Coverage].request ..0
* entry[Coverage].response ..0