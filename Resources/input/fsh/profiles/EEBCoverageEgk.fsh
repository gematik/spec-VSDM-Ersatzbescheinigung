Profile: EEBCoverageEgk
Parent: EEBCoverageBasis
Id: eeb-coverage-egk
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* insert Meta
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk" (exactly)
* extension[versionEgk] 1..1
* extension[versionEgk].valueString 1..1
* extension[versichertenart] 0..0
* extension[kostenerstattung] 0..0
* extension[wop] 0..0
* extension[besonderePersonengruppe] 0..0
* extension[dmpKennzeichen] 0..0
* extension[ruhenderLeistungsanspruch] 0..0
* extension[zuzahlungsstatus] 0..0
* extension[allgemeineVersicherungsdaten] 1..1
* extension[persoenlicheVersichertendaten] 1..1
* extension[geschuetzteVersichertendaten] 1..1
* extension[genderIdentity] 0..0
* extension[selektivvertraege] 0..0

// Beispielgenerierung
Instance: KBV_PR_FOR_PatientEgkSample
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle"
Usage: #example
* id = "437f2555-2396-4c64-a656-e9553161ca3c"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "A123456789"
* name[name].use = #official
* name[name].family = "Königstein"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Königstein"
* name[name].given = "Ludger"
* birthDate = "1935-06-22"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Blumenweg 14"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "14"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Blumenweg"
* address[Strassenanschrift].city = "Esens"
* address[Strassenanschrift].postalCode = "26427"
* address[Strassenanschrift].country = "D"

Instance: EEBCoverageEgkSample
InstanceOf: EEBCoverageEgk
Title:   "Coverage for EEBBescheinigungBundle"
Usage: #example
* id = "2d4da53a-413a-48fe-b908-2e67b5761523"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* extension[versionEgk].url = "http://fhir.de/StructureDefinition/gkv/version-vsdm"
* extension[versionEgk].valueString = "5.2.0"
* extension[allgemeineVersicherungsdaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* extension[allgemeineVersicherungsdaten].valueBase64Binary = "H4sIAAAAAAAAALVS0U7CMBT9laXv0A1cGKYrQTCGTMCIovFlqdtlLNvuTFtQ+Xo7gmYjBH3xpc25p+fck97LBh9Fbm1BqrREnzhtm1iAURmnmPhkspi3PM/ttxyXWEoLjEVeIvjkExQZcPY4Cod5nkABKcKyMonWIDeYqFhowOfprTUaT8Pl9f1iMp/5xG13qgamJSqfrLV+u6T0XbWNg9Bp1o6BrgTdqrioDro17wlnP8YaZA1VbVS03ugdZ1eQpIi8Y3ds2+t4jB4KLCiVCaKlgKQSN2AGiMaEO7bj9lzX6TN6km+qcgEYgzRfBHx8pKhzbCYK4A8QrTHNQFqBFGgcM6EUMLon2fBVVvxe9Lek3Ytez7W7/5E0+E5Fz8Six/jkOF42SuhdiqtSNcBNsGyME4XU3KmZHEp1TXhIY/zDvf5pfmcGzWh1M3ruJT1uTRvBaHOx6O/bzL8A/lor0i8DAAA="
* extension[persoenlicheVersichertendaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* extension[persoenlicheVersichertendaten].valueBase64Binary = "H4sIAAAAAAAAAI1RbU/CQAz+K+S+QxlhMkx3xIBRAgMjEf1Gzq2yxe1m7m748mf9K3YICMYPfmn79Nqnz7U4eCvyxoaMzUodCq/VFg3ScZlkeh2K8WLeDAK/3/R80bBO6UTlpaZQvJMVA4l3w9UNt5ak8yxOaVnTsDeOuJLNQzRtDEfRanl5uxjPZ6HwW516As/UNhSpcy/nAK+2taZCuey5lRA8KdjYpKgNbLheSDziNSdIr8YjGflBr9P1At9H+P2GW3la4hU9VsZZVlUVstNu++2gEyCcpHFZGq0KkpNcVZbJdhBnKk63UUQZGYQDZlobpznFqZNRzXZAuHBGWUv6IjHEnpWU1uWUuQ+V5tLve70uwkkO58bJCdNqhDrEKe9b4n2ZasslueKlkuHTkBwh/JVG+G7ZzZbTKmMFltEnIeyzeM2/01VR8DK9M4QjeCj6kQ37DcLpFeAft5dfJRi8TF4CAAA="
* extension[geschuetzteVersichertendaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten"
* extension[geschuetzteVersichertendaten].valueBase64Binary = "H4sIAAAAAAAAAIVPXWvCQBD8K+HezWohoGXvpGgpQq3QUBFf5EjWXPByKblN2ubX90ILtSj4Mvs1zMzi/LOyUUeNL2snxSQei4hcVuelK6RYpZvRdJrMRpNERJ61y7WtHUnxRV7MFb4tDk/kM9MS90zbQSUz1DAFYoDd+jlaLNeH7eNrutq8SJHEd4NBsHReCsP8fg/w4eOCKs3lKc4Jjho6n1cDQBf4QuG+7bWxrSt8iMCtV5j+1DHCb4dwhUSWTlx24TluNBWk8IGanm3IqGYIfwPutXH6/PZ/EWwuteD28+obUb40hF4BAAA="
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* type.coding.display = "gesetzliche Krankenversicherung"
* period.start = "2022-04-01"
* period.end = "2027-07-31"
* beneficiary.reference =  "Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "12345678"
* payor.display = "Test Krankenkasse"