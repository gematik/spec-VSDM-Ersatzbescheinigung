Profile: EEBBescheinigungBundle
Parent: Bundle
Id: eeb-bescheinigung-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* insert Meta
* id 1..1
// außer als ID nicht sinnvoll genutzt, wenn kein übergreifender Identifier
//* identifier 1..
//* identifier.system 1..
//* identifier.system = "urn:ietf:rfc:3986" (exactly)
//* identifier.value 1..
//* identifier.value ^short = "Eindeutige UUID"
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
* entry[Patient].resource only KBV_PR_FOR_Patient
* entry[Patient].search ..0
* entry[Patient].request ..0
* entry[Patient].response ..0
* entry[Coverage].link ..0
* entry[Coverage].resource 1..
* entry[Coverage].resource only EEBCoverageEgk or EEBCoverageNoEgk
* entry[Coverage].search ..0
* entry[Coverage].request ..0
* entry[Coverage].response ..0

// Beispielgenerierung
Instance: ErsatzbescheinigungSample
InstanceOf: EEBBescheinigungBundle
Title:   "EEB-ErsatzbescheinigungsBundle"
Usage: #example
* id = "9b6ac30d-246d-4eab-af83-544564792088"
* meta.profile[+] = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle|1.0.0"
* meta.tag.display = "EEB-Ersatzbescheinigung"
// dublette zu ID
//* identifier[+].system = "urn:ietf:rfc:3986"
//* identifier[=].value = "9b6ac30d-246d-4eab-af83-544564792088"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+].fullUrl = "https://easyti.ehex.de/fhir/MessageHeader/bd901c08-0133-4276-b34b-eb810a62deda"
* entry[=].resource = BescheinigungMessageHeaderSample
* entry[+].fullUrl = "https://easyti.ehex.de/fhir/Coverage/c7bbbd73-630a-4585-985f-76c513cb1960"
* entry[=].resource = CoverageEgkSample