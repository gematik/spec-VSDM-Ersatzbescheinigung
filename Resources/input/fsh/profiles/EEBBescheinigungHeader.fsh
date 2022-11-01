Profile: EEBBescheinigungHeader
Parent: MessageHeader
Id: EEBBescheinigungHeader
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader" (exactly)
* event[x] only uri
* event[x] = "https://gematik.de/fhir/eeb/EEBBescheinigung" (exactly)
* source.endpoint MS
* response 1..
* response.identifier ^short = "Identifier of EEBAnfrageBundle"
* response.identifier ^definition = "The Bundle.identifier of the EEBAnfrageBundle to which this message is a response."
* response.code = #ok (exactly)

// Beispielgenerierung
Instance: BescheinigungMessageHeaderSample
InstanceOf: EEBBescheinigungHeader
Title:   "EEB-BescheinigungHeader"
Usage: #inline
* id = "bd901c08-0133-4276-b34b-eb810a62deda"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* eventUri = "https://gematik.de/fhir/eeb/EEBBescheinigung"
* source.endpoint = "https://ehex.de/KIM"
* response.identifier.value = "e71108ff-a936-44fa-9d7d-215a09428194"
* response.code = #ok