Profile: EEBCoverageEgk
Parent: coverage-de-gkv
Id: eeb-coverage-egk
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* insert Meta
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[versionEgk] ^sliceName = "versionEgk"
* extension[versionEgk].value[x] 1..
* extension contains
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 1..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 1..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 1..1
* extension[persoenlicheVersichertendaten] ^isModifier = false
* extension[persoenlicheVersichertendaten].value[x] 1..
* extension[allgemeineVersicherungsdaten] ^isModifier = false
* extension[allgemeineVersicherungsdaten].value[x] 1..
* extension[geschuetzteVersichertendaten] ^isModifier = false
* extension[geschuetzteVersichertendaten].value[x] 1..
* identifier[KrankenversichertenID] 1..1
* identifier[pseudo-Krankenversichertennummer] 0..0
* status = #active (exactly)
* period 1..
* period.start 1..
* period.end 1..
* payor.identifier 1..

// Beispielgenerierung
Instance: CoverageEgkSample
InstanceOf: EEBCoverageEgk
Title:   "Coverage EEB-ErsatzbescheinigungsBundle"
Usage: #inline
* id = "c7bbbd73-630a-4585-985f-76c513cb1960"
//* meta.profile[+] = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk|1.0.0"
* meta.profile[+] = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* meta.tag.display = "Coverage für EEB-Ersatzbescheinigung"
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/version-vsdm"
* extension[=].valueString = "5.2.0"
* extension[+].url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* extension[=].valueBase64Binary = "H4sIAAAAAAAAAI1RbU/CQAz+K+S+QxlhMkx3xIBRAgMjEf1Gzq2yxe1m7m748mf9K3YICMYPfmn79Nqnz7U4eCvyxoaMzUodCq/VFg3ScZlkeh2K8WLeDAK/3/R80bBO6UTlpaZQvJMVA4l3w9UNt5ak8yxOaVnTsDeOuJLNQzRtDEfRanl5uxjPZ6HwW516As/UNhSpcy/nAK+2taZCuey5lRA8KdjYpKgNbLheSDziNSdIr8YjGflBr9P1At9H+P2GW3la4hU9VsZZVlUVstNu++2gEyCcpHFZGq0KkpNcVZbJdhBnKk63UUQZGYQDZlobpznFqZNRzXZAuHBGWUv6IjHEnpWU1uWUuQ+V5tLve70uwkkO58bJCdNqhDrEKe9b4n2ZasslueKlkuHTkBwh/JVG+G7ZzZbTKmMFltEnIeyzeM2/01VR8DK9M4QjeCj6kQ37DcLpFeAft5dfJRi8TF4CAAA="
* extension[+].url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* extension[=].valueBase64Binary = "H4sIAAAAAAAAALVS0U7CMBT9laXv0A1cGKYrQTCGTMCIovFlqdtlLNvuTFtQ+Xo7gmYjBH3xpc25p+fck97LBh9Fbm1BqrREnzhtm1iAURmnmPhkspi3PM/ttxyXWEoLjEVeIvjkExQZcPY4Cod5nkABKcKyMonWIDeYqFhowOfprTUaT8Pl9f1iMp/5xG13qgamJSqfrLV+u6T0XbWNg9Bp1o6BrgTdqrioDro17wlnP8YaZA1VbVS03ugdZ1eQpIi8Y3ds2+t4jB4KLCiVCaKlgKQSN2AGiMaEO7bj9lzX6TN6km+qcgEYgzRfBHx8pKhzbCYK4A8QrTHNQFqBFGgcM6EUMLon2fBVVvxe9Lek3Ytez7W7/5E0+E5Fz8Six/jkOF42SuhdiqtSNcBNsGyME4XU3KmZHEp1TXhIY/zDvf5pfmcGzWh1M3ruJT1uTRvBaHOx6O/bzL8A/lor0i8DAAA="
* extension[+].url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten"
* extension[=].valueBase64Binary = "H4sIAAAAAAAAAIVPXWvCQBD8K+HezWohoGXvpGgpQq3QUBFf5EjWXPByKblN2ubX90ILtSj4Mvs1zMzi/LOyUUeNL2snxSQei4hcVuelK6RYpZvRdJrMRpNERJ61y7WtHUnxRV7MFb4tDk/kM9MS90zbQSUz1DAFYoDd+jlaLNeH7eNrutq8SJHEd4NBsHReCsP8fg/w4eOCKs3lKc4Jjho6n1cDQBf4QuG+7bWxrSt8iMCtV5j+1DHCb4dwhUSWTlx24TluNBWk8IGanm3IqGYIfwPutXH6/PZ/EWwuteD28+obUb40hF4BAAA="
* identifier[+].type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* identifier[=].type.coding.code = #GKV
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "A123456789"
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* period.start = "2017-08-29"
* period.end = "2027-08-29"
* beneficiary.identifier[+].system = "http://fhir.de/sid/gkv/kvid-10"
* beneficiary.identifier[=].value = "A123456789"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "12345678"
* payor.display = "Test Krankenkasse"