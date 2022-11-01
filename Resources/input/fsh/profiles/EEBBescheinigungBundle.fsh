Profile: EEBBescheinigungBundle
Parent: Bundle
Id: EEBBescheinigungBundle
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
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry 3..3
* entry contains
    eEBHeader 1..1 and
//    Patient 0..1 MS and
    KBVFORPatient 1..1 and
    eGKCoverage 0..1 and
    noGKCoverage 0..1
* entry[eEBHeader].link ..0
* entry[eEBHeader].resource 1..
* entry[eEBHeader].resource only EEBBescheinigungHeader
* entry[eEBHeader].search ..0
* entry[eEBHeader].request ..0
* entry[eEBHeader].response ..0
* entry[KBVFORPatient].link ..0
* entry[KBVFORPatient].resource 1..
* entry[KBVFORPatient].resource only KBV_PR_FOR_Patient
* entry[KBVFORPatient].search ..0
* entry[KBVFORPatient].request ..0
* entry[KBVFORPatient].response ..0
* entry[eGKCoverage].link ..0
* entry[eGKCoverage].resource 1..
* entry[eGKCoverage].resource only EEBCoverageEgk
* entry[eGKCoverage].search ..0
* entry[eGKCoverage].request ..0
* entry[eGKCoverage].response ..0
* entry[noGKCoverage].link ..0
* entry[noGKCoverage].resource 1..
* entry[noGKCoverage].resource only EEBCoverageNoEgk
* entry[noGKCoverage].search ..0
* entry[noGKCoverage].request ..0
* entry[noGKCoverage].response ..0

// Beispielgenerierung
Instance: ErsatzbescheinigungSample
InstanceOf: EEBBescheinigungBundle
Title:   "EEB-ErsatzbescheinigungsBundle"
Usage: #example
* id = "9b6ac30d-246d-4eab-af83-544564792088"
//* meta.profile[+] = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle|1.0.0"
* meta.profile[+] = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungBundle"
* meta.tag.display = "EEB-Ersatzbescheinigung"
// dublette zu ID
//* identifier[+].system = "urn:ietf:rfc:3986"
//* identifier[=].value = "9b6ac30d-246d-4eab-af83-544564792088"
* type = #message
* timestamp = "2022-08-29T02:09:37.157+02:00"
* entry[+].fullUrl = "https://easyti.ehex.de/fhir/MessageHeader/bd901c08-0133-4276-b34b-eb810a62deda"
* entry[=].resource = BescheinigungMessageHeaderSample
* entry[+].fullUrl = "https://easyti.ehex.de/fhir/Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* entry[=].resource = eEBKBVFORPatientSample
* entry[+].fullUrl = "https://easyti.ehex.de/fhir/Coverage/2d4da53a-413a-48fe-b908-2e67b5761523"
* entry[=].resource = eEBGKVCoverageSample