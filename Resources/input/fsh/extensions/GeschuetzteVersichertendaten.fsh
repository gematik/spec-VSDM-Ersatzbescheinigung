Extension: GeschuetzteVersichertendaten
Id: geschuetzte-versichertendaten
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten"
* insert Meta
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "Geschuetzte Versichertendaten als base64-codierter und gzip-komprimierter String analog zu den Containern der eGK"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten" (exactly)
* value[x] only base64Binary
* value[x] 1..1