Extension: Institutionskennzeichen
Id: institutionskennzeichen
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/Institutionskennzeichen"
* insert Meta
* ^context.type = #element
* ^context.expression = "MessageHeader"
* . ^short = "Institutionskennzeichen der Krankenkasse"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/Institutionskennzeichen" (exactly)
* value[x] only $identifier-iknr