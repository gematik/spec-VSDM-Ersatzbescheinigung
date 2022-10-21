Extension: Leistungsdatum
Id: leistungsdatum
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/Leistungsdatum"
* insert Meta
* ^context.type = #element
* ^context.expression = "MessageHeader"
* . ^short = "Datum der Leistungserbringung"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/Leistungsdatum" (exactly)
* value[x] only date