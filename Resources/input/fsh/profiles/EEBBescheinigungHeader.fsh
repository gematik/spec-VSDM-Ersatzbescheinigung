Profile: EEBBescheinigungHeader
Parent: MessageHeader
Id: eeb-bescheinigung-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* ^version = "1.0"
* ^status = #draft
* event[x] only uri
* event[x] = "https://gematik.de/fhir/eeb/EEBBescheinigung" (exactly)
* source.endpoint = "https://ehex.de/KIM" (exactly)
* response 1..
* response.identifier ^short = "Identifier of EEBAnfrageBundle"
* response.identifier ^definition = "The Bundle.identifier of the EEBAnfrageBundle to which this message is a response."
* response.code = #ok (exactly)