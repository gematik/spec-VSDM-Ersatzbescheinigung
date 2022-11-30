Profile: EEBFehlerBundle
Parent: Bundle
Id: eeb-fehler-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerBundle"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerBundle" (exactly)
* id 1..1
* identifier 1..
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID als übergreifender Identifier für mehrere Anfragen eines Vorgangs"
* type = #message (exactly)
* timestamp 1..
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry contains
    EEBFehlerHeader 1..1 and
    EEBFehler 1..1
* entry[EEBFehlerHeader].link ..0
* entry[EEBFehlerHeader].resource only EEBFehlerHeader
* entry[EEBFehlerHeader].search ..0
* entry[EEBFehlerHeader].request ..0
* entry[EEBFehlerHeader].response ..0
* entry[EEBFehler].link ..0
* entry[EEBFehler].resource only EEBFehler
* entry[EEBFehler].search ..0
* entry[EEBFehler].request ..0
* entry[EEBFehler].response ..0


// Beispielgenerierung
Instance: EEBFehlerBundleSample
InstanceOf: EEBFehlerBundle
Title:   "EEBFehlerBundle"
Usage: #example
* id = "903ce6bc-49b5-455d-9c1c-60b5d77fd14c"
* meta.profile[+] = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerBundle"
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "0b3061e8-1513-4d6e-8f6d-58ea147e8ca2"
* type = #message
* timestamp = "2022-09-29T02:29:37.157+02:00"
* entry[+][EEBFehlerHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/241017e9-46bf-4951-a2ca-cdd5a9eab800"
* entry[=][EEBFehlerHeader].resource = EEBFehlerHeaderSample
* entry[+][EEBFehler].fullUrl = "https://gematik.de/fhir/OperationOutcome/3f624395-be34-4fac-9773-d735cb3a1f73"
* entry[=][EEBFehler].resource = EEBFehlerSample
