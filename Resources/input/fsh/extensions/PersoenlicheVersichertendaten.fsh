Extension: PersoenlicheVersichertendaten
Id: persoenliche-versichertendaten
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* insert Meta
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "Persoenliche Versichertendaten als base64-codierter und gzip-komprimierter String analog zu den Containern der eGK"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten" (exactly)
* value[x] only base64Binary
* value[x] 1..1