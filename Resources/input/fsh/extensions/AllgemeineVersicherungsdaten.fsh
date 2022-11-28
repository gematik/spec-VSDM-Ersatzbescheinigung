Extension: AllgemeineVersicherungsdaten
Id: allgemeine-versicherungsdaten
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* insert Meta
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "Allgemeine Versicherungsdaten"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten" (exactly)
* value[x] only base64Binary
* value[x] 1..1