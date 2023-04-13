Extension: AllgemeineVersicherungsdaten
Id: allgemeine-versicherungsdaten
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* insert Meta
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "Allgemeine Versicherungsdaten als base64-codierter und gzip-komprimierter String analog zu den Containern der eGK"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten" (exactly)
* value[x] only base64Binary
* value[x] 1..1