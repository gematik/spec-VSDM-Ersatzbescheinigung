Profile: EEBCoverageEgk
Parent: coverage-de-basis
Id: EEBCoverageEgk
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $version-vsdm named versionEgk 1..1 and
    $versichertenart named versichertenart 1..1 and
    $kostenerstattung named kostenerstattung 1..1 and
    $wop named wop 1..1 and
    $besondere-personengruppe named besonderePersonengruppe 1..1 and
    $dmp-kennzeichen named dmpKennzeichen 1..1 and
    $ruhender-leistungsanspruch named ruhenderLeistungsanspruch 1..1 and
    $zuzahlungsstatus named zuzahlungsstatus 
    1..1 and
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 1..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 1..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 1..1
* status = #active (exactly)
* type 1..1
* type from $versicherungsart-de-basis (required)
* type ^short = "Versicherungsart"
* type ^definition = "Art der Versicherung: Selbstzahler, gesetzliche/private Versicherung, Berufsgenossenschaft oder Sozialamt"
* beneficiary 1..1
* beneficiary.reference 1..1
* period 1..1
* period.start 1..1
* period.end 1..1
* payor 1..1
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension contains $AbrechnendeIK named abrechnendeIK 1..1
* payor.identifier only $identifier-iknr
* payor.display 1..1


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
* extension[0].url = "http://fhir.de/StructureDefinition/gkv/version-vsdm"
* extension[=].valueString = "5.2.0"
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
* extension[=].valueCoding.system = "https://fhir.kbv.de/CodeSystem/74_CS_SFHIR_KBV_VERSICHERTENSTATUS"
* extension[=].valueCoding.code = #1
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/kostenerstattung"
* extension[=].extension[0].url = "aerztlicheVersorgung"
* extension[=].extension[=].valueBoolean = true
* extension[=].extension[+].url = "zahnaerztlicheVersorgung"
* extension[=].extension[=].valueBoolean = true
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/wop"
* extension[=].valueCoding.system = "https://fhir.kbv.de/CodeSystem/CS_AW_Krankenversicherung_WOP"
* extension[=].valueCoding.code = #38
* extension[=].valueCoding.display = "Nordrhein"
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
* extension[=].valueCoding.system = "https://fhir.kbv.de/CodeSystem/74_CS_SFHIR_KBV_PERSONENGRUPPE"
* extension[=].valueCoding.code = #06
* extension[=].valueCoding.display = "BVG (Gesetz über die Versorgung der Opfer des Krieges)"
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen"
* extension[=].valueCoding.system = "https://fhir.kbv.de/CodeSystem/74_CS_SFHIR_KBV_DMP"
* extension[=].valueCoding.code = #00
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/ruhender-leistungsanspruch"
* extension[=].extension[0].url = "art"
* extension[=].extension[=].valueCoding.code = #1
* extension[=].extension[+].url = "dauer"
* extension[=].extension[=].valuePeriod.start = "2018-01-01"
* extension[+].url = "http://fhir.de/StructureDefinition/gkv/zuzahlungsstatus"
* extension[=].extension[0].url = "status"
* extension[=].extension[=].valueBoolean = true
* extension[=].extension[+].url = "gueltigBis"
* extension[=].extension[=].valueDate = "2020-12-31"
* extension[+].url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* extension[=].valueBase64Binary = "H4sIAAAAAAAAALVS0U7CMBT9laXv0A1cGKYrQTCGTMCIovFlqdtlLNvuTFtQ+Xo7gmYjBH3xpc25p+fck97LBh9Fbm1BqrREnzhtm1iAURmnmPhkspi3PM/ttxyXWEoLjEVeIvjkExQZcPY4Cod5nkABKcKyMonWIDeYqFhowOfprTUaT8Pl9f1iMp/5xG13qgamJSqfrLV+u6T0XbWNg9Bp1o6BrgTdqrioDro17wlnP8YaZA1VbVS03ugdZ1eQpIi8Y3ds2+t4jB4KLCiVCaKlgKQSN2AGiMaEO7bj9lzX6TN6km+qcgEYgzRfBHx8pKhzbCYK4A8QrTHNQFqBFGgcM6EUMLon2fBVVvxe9Lek3Ytez7W7/5E0+E5Fz8Six/jkOF42SuhdiqtSNcBNsGyME4XU3KmZHEp1TXhIY/zDvf5pfmcGzWh1M3ruJT1uTRvBaHOx6O/bzL8A/lor0i8DAAA="
* extension[+].url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* extension[=].valueBase64Binary = "H4sIAAAAAAAAAI1RbU/CQAz+K+S+QxlhMkx3xIBRAgMjEf1Gzq2yxe1m7m748mf9K3YICMYPfmn79Nqnz7U4eCvyxoaMzUodCq/VFg3ScZlkeh2K8WLeDAK/3/R80bBO6UTlpaZQvJMVA4l3w9UNt5ak8yxOaVnTsDeOuJLNQzRtDEfRanl5uxjPZ6HwW516As/UNhSpcy/nAK+2taZCuey5lRA8KdjYpKgNbLheSDziNSdIr8YjGflBr9P1At9H+P2GW3la4hU9VsZZVlUVstNu++2gEyCcpHFZGq0KkpNcVZbJdhBnKk63UUQZGYQDZlobpznFqZNRzXZAuHBGWUv6IjHEnpWU1uWUuQ+V5tLve70uwkkO58bJCdNqhDrEKe9b4n2ZasslueKlkuHTkBwh/JVG+G7ZzZbTKmMFltEnIeyzeM2/01VR8DK9M4QjeCj6kQ37DcLpFeAft5dfJRi8TF4CAAA="
* extension[+].url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten"
* extension[=].valueBase64Binary = "H4sIAAAAAAAAAIVPXWvCQBD8K+HezWohoGXvpGgpQq3QUBFf5EjWXPByKblN2ubX90ILtSj4Mvs1zMzi/LOyUUeNL2snxSQei4hcVuelK6RYpZvRdJrMRpNERJ61y7WtHUnxRV7MFb4tDk/kM9MS90zbQSUz1DAFYoDd+jlaLNeH7eNrutq8SJHEd4NBsHReCsP8fg/w4eOCKs3lKc4Jjho6n1cDQBf4QuG+7bWxrSt8iMCtV5j+1DHCb4dwhUSWTlx24TluNBWk8IGanm3IqGYIfwPutXH6/PZ/EWwuteD28+obUb40hF4BAAA="
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* period.start = "2022-04-01"
* period.end = "2022-07-31"
* beneficiary.reference =  "Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* payor.extension[0].url = "http://fhir.de/StructureDefinition/AbrechnendeIK"
* payor.extension[=].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.extension[=].valueIdentifier.value = "756756324"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "12345678"
* payor.display = "Test Krankenkasse"