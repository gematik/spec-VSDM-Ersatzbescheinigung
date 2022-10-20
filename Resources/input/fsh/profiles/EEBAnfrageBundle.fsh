Profile: EEBAnfrageBundle
Parent: Bundle
Id: eeb-anfrage-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* insert Meta
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
    Patient 1..1 and
    Organization 1..1
* entry[Header].link ..0
* entry[Header].resource 1..
* entry[Header].resource only EEBAnfrageHeader
* entry[Header].search ..0
* entry[Header].request ..0
* entry[Header].response ..0
* entry[Patient].link ..0
* entry[Patient].resource 1..
* entry[Patient].resource only KnownPatient or UnknownPatient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Organization].link ..0
* entry[Organization].resource 1..
* entry[Organization].resource only KBV_PR_FOR_Organization
* entry[Organization].search ..0
* entry[Organization].request ..0
* entry[Organization].response ..0