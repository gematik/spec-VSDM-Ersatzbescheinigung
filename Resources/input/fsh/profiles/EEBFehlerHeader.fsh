Profile: EEBFehlerHeader
Parent: MessageHeader
Id: EEBFehlerHeader
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerHeader"
* insert Meta
* event[x] only uri
* event[x] = "https://gematik.de/fhir/eeb/EEBFehler" (exactly)
* sender only Reference (KBV_PR_FOR_Organization)
* source.endpoint = "https://ehex.de/KIM" (exactly)
* response 1..
* response.identifier = "0" (exactly)
* response.code = #fatal-error (exactly)