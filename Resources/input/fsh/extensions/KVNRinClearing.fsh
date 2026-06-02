Extension: KVNRinClearing
Id: KVNRinClearing
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/KVNRinClearing"
* insert Meta
* ^context.type = #element
* ^context.expression = "MessageHeader"
* . ^short = "Die KVNR für diesen Versicherten befindet sich zum angegebenen Datum im Clearingverfahren"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/KVNRinClearing" (exactly)
* value[x] only date