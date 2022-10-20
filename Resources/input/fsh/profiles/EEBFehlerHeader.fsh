Profile: EEBFehlerHeader
Parent: MessageHeader
Id: eeb-fehler-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerHeader"
* ^version = "1.0"
* ^status = #draft
* event[x] only uri
* event[x] = "https://gematik.de/fhir/eeb/EEBFehler" (exactly)
* sender only Reference (KBV_PR_FOR_Organization)
* source.endpoint = "https://ehex.de/KIM" (exactly)
* response 1..
* response.identifier = "0" (exactly)
* response.code = #fatal-error (exactly)