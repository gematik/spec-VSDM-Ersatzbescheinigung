Extension: Pruefungsnachweis
Id: pruefungsnachweis
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/Pruefungsnachweis"
* insert Meta
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "Prüfungsnachweis als base64-codierter und gzip-komprimierter String analog zum Outcome der Operation ReadVSD am Konnektor für die Primärsysteme"
* ^description = "Der Prüfungsnachweis enthält in Base64-Darstellung gemäß VSDM-Spezifikation eine strukturierte Prüfziffer (PZ), siehe auch https/github.com/gematik/api-telematik/blob/OPB5/fa/vsds/Pruefungsnachweis.xsd"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/Pruefungsnachweis" (exactly)
* value[x] only base64Binary
* value[x] 1..1