Extension: servicePeriod
Id: servicePeriod
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/servicePeriod"
* insert Meta
* ^context.type = #element
* ^context.expression = "MessageHeader"
* . ^short = "Leistungszeitraum (meist das aktuellle Quartal in dem die Behandlung stattfindet)"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/servicePeriod" (exactly)
* value[x] only Period