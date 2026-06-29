Extension: noAddressLine
Id: noaddressline
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/noAddressLine"
* insert Meta
* ^context.type = #element
* ^context.expression = "MessageHeader"
* . ^short = "Die ausgestellte eEB enthält bewusst unvollständige Adressangaben. Clientseitig bekannte Adressdaten sollten nicht überschrieben werden."
* url = "https://gematik.de/fhir/eeb/StructureDefinition/noAddressLine" (exactly)
* value[x] only boolean