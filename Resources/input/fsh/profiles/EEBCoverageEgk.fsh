Profile: EEBCoverageEgk
Parent: coverage-de-basis
Id: eeb-coverage-egk
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* insert Meta
* meta 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $version-vsdm named versionEgk 1..1 and
    $versichertenart named versichertenart 0..0 and
    $kostenerstattung named kostenerstattung 0..0 and
    $wop named wop 0..0 and
    $besondere-personengruppe named besonderePersonengruppe 0..0 and
    $dmp-kennzeichen named dmpKennzeichen 0..0 and
    $ruhender-leistungsanspruch named ruhenderLeistungsanspruch 0..0 and
    $zuzahlungsstatus named zuzahlungsstatus 0..0 and
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 1..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 1..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 0..1 and
    $patient-genderIdentity named genderIdentity 0..0
* extension[versionEgk].valueString 1..1
* identifier 0..0
* status = #active (exactly)
* type 1..1
* type from $versicherungsart-de-basis (required)
* type ^short = "Versicherungsart"
* type ^definition = "Art der Versicherung: Selbstzahler, gesetzliche/private Versicherung, Berufsgenossenschaft oder Sozialamt"
* subscriber 0..0
* beneficiary only Reference($kbv-for-patient)
* beneficiary 1..1
* beneficiary.reference 1..1
* beneficiary.type 0..0
* beneficiary.identifier 0..0
* beneficiary.display 0..0
* dependent 0..0
* relationship 0..0
* period 1..1
* period.start 1..1
* period.end 1..1
* payor 1..1
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension contains $AbrechnendeIK named abrechnendeIK 0..0
* payor.reference 0..0
* payor.type 0..0
* payor.identifier only $identifier-iknr
* payor.identifier 1..1
* payor.display 1..1
* class 0..0
* costToBeneficiary 0..0
* subrogation 0..0
* contract 0..0
* obeys -eeb-angabeGeschuetzteVersichertendaten


Invariant: -eeb-angabeGeschuetzteVersichertendaten
Description: "Falls der Versicherungstyp GKV ist, müssen die geschützten Versichertendaten angegeben werden."
Severity: #error
Expression: "type.coding.code='GKV' implies extension('https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten').exists()"


// Beispielgenerierung
Instance: KBV_PR_FOR_PatientEgkSample
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle"
Usage: #inline
* id = "437f2555-2396-4c64-a656-e9553161ca3c"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "T024791905"
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

Instance: KBV_PR_FOR_PatientEgkPkvSample
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle"
Usage: #inline
* id = "e36f9476-0d04-4394-a626-8b4706b005b0"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenID_pkv].type = http://fhir.de/CodeSystem/identifier-type-de-basis#PKV
* identifier[versichertenID_pkv].system = "http://fhir.de/sid/pkv/kvid-10"
* identifier[versichertenID_pkv].value = "A123456789"
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
Usage: #inline
* id = "2d4da53a-413a-48fe-b908-2e67b5761523"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* extension[versionEgk].url = "http://fhir.de/StructureDefinition/gkv/version-vsdm"
* extension[versionEgk].valueString = "5.2.0"
* extension[allgemeineVersicherungsdaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* extension[allgemeineVersicherungsdaten].valueBase64Binary = "H4sIAKnUU2QA/71S32+qMBT+V0jfpYDjTpdS4/RmMU5d5q5b9kI6OAIRDjdtdXf+9RZiFnDG3ae9QL7z9fuRnrLBvyK3diBVVmJAXNshFmBUxhkmAZksF51ez+93XJ9YSguMRV4iBOQDFBlw9mcUDvM8gQIyhFVlEqUgt5ioWGjAl9m9NRrPwtXvx+VkMQ+Ib3tVgIlEFZBU6783lL4r2zgInW3sGOha0J2Ki+pDd+Y84ezTWINsoCpGRelW7zm7hSRD5J7jOY7ruIweB2xaKlNESwFJJW7BDSAaE+563Sv/13WP0bN0W5QLwBikuSHg4xNFk2NzUQB/AqWtu+nKmkqBxnAjlAJGa44N3yREKdaa/+l5rNn/6Z70QtG2scFn1/O6VULvM1yXqgVMYmu9KKTmZnuno6YmPLYx/mGtf1488K5ZXvVn9NLJJvll0OxePzT6/evmBylH1Y4/AwAA"
* extension[persoenlicheVersichertendaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* extension[persoenlicheVersichertendaten].valueBase64Binary = "H4sIAN/UU2QA/41RXY/TMBD8K5HfL05Cc3dBG5/gWkFFPxCFwltlkiWJsDfIdnrAD+e5m3JXWsQDL17PeHZ2NYa779ZEe3S+66kUaZyICKnq646aUsw366vb27y4SnMR+aCp1qYnLMUP9OJOwYf73Vtu7ZFMV7W4HW24uoCs5OPTchHdT5e77ezdZr5elSKPs3ECzyRfijaEb8+lfPBxg1aH7mtco/yi5d7XdjzknvVCwZmvu0C0m0/V+ySb3BRpkeQg/36D43qk4BV+HlzwvNVgVVo8y5PrLAN5QcO2d6QtqsVQN+jY7RHDSlft8fbmF3WND9gRyBPJ5r5qDVZtUMvR84RgE5z2HulF7ZAr79P7YLALP3VrVHY9yW5AXnCwdkHNuMWDHK+w4NQVfOxb8iwxmqNFxx+EagryXzTI3y2Ps9VLM1ikB2xAPlHwWg+eBms5z3QC8gyeRH92lk8hnsc7Kv/j+9UBL5cSPWECAAA="
* extension[geschuetzteVersichertendaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten"
* extension[geschuetzteVersichertendaten].valueBase64Binary = "H4sIABPVU2QA/4VP70vDMBD9V8p9X28TCptcMmSKDJwDh0P2ZYT2bMrSVJpr1f71S1FQUfDLu+Tu8X7Q8q12Sc9tqBqvYJZOIWGfN0XlSwXr3XYyn2eLySyDJIjxhXGNZwXvHGCp6XF1vOWQ245lEN6PKrnlVjgSIzxt7pLV9ea4v3nYrbf3CrL0YjSIlj4osCIvl4ivIS25NlKd0oLx2WAfinoE7CMfNB26wVjX+TLECNIFTbuPOSX8fBH+QWLHJ6n6WE5awyVruuJ2EBcz6gXh14cOxnrz/fZzEW1+a+H/5fUZUb40hF4BAAA="
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* type.coding.display = "gesetzliche Krankenversicherung"
* period.start = "2022-04-01"
* period.end = "2027-07-31"
* beneficiary.reference =  "Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "12345678"
* payor.display = "Test GKV Krankenkasse"

Instance: EEBCoverageEgkPkvSample
InstanceOf: EEBCoverageEgk
Title:   "Coverage for EEBBescheinigungBundle"
Usage: #inline
* id = "d7fbdcd7-f220-4a11-8526-d846e4db2a82"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk"
* extension[versionEgk].url = "http://fhir.de/StructureDefinition/gkv/version-vsdm"
* extension[versionEgk].valueString = "5.2.0"
* extension[allgemeineVersicherungsdaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/AllgemeineVersicherungsdaten"
* extension[allgemeineVersicherungsdaten].valueBase64Binary = "H4sIAAAAAAAAALVS0U7CMBT9laXv0A1cGKYrQTCGTMCIovFlqdtlLNvuTFtQ+Xo7gmYjBH3xpc25p+fck97LBh9Fbm1BqrREnzhtm1iAURmnmPhkspi3PM/ttxyXWEoLjEVeIvjkExQZcPY4Cod5nkABKcKyMonWIDeYqFhowOfprTUaT8Pl9f1iMp/5xG13qgamJSqfrLV+u6T0XbWNg9Bp1o6BrgTdqrioDro17wlnP8YaZA1VbVS03ugdZ1eQpIi8Y3ds2+t4jB4KLCiVCaKlgKQSN2AGiMaEO7bj9lzX6TN6km+qcgEYgzRfBHx8pKhzbCYK4A8QrTHNQFqBFGgcM6EUMLon2fBVVvxe9Lek3Ytez7W7/5E0+E5Fz8Six/jkOF42SuhdiqtSNcBNsGyME4XU3KmZHEp1TXhIY/zDvf5pfmcGzWh1M3ruJT1uTRvBaHOx6O/bzL8A/lor0i8DAAA="
* extension[persoenlicheVersichertendaten].url = "https://gematik.de/fhir/eeb/StructureDefinition/PersoenlicheVersichertendaten"
* extension[persoenlicheVersichertendaten].valueBase64Binary = "H4sIAAAAAAAAAI1RbU/CQAz+K+S+QxlhMkx3xIBRAgMjEf1Gzq2yxe1m7m748mf9K3YICMYPfmn79Nqnz7U4eCvyxoaMzUodCq/VFg3ScZlkeh2K8WLeDAK/3/R80bBO6UTlpaZQvJMVA4l3w9UNt5ak8yxOaVnTsDeOuJLNQzRtDEfRanl5uxjPZ6HwW516As/UNhSpcy/nAK+2taZCuey5lRA8KdjYpKgNbLheSDziNSdIr8YjGflBr9P1At9H+P2GW3la4hU9VsZZVlUVstNu++2gEyCcpHFZGq0KkpNcVZbJdhBnKk63UUQZGYQDZlobpznFqZNRzXZAuHBGWUv6IjHEnpWU1uWUuQ+V5tLve70uwkkO58bJCdNqhDrEKe9b4n2ZasslueKlkuHTkBwh/JVG+G7ZzZbTKmMFltEnIeyzeM2/01VR8DK9M4QjeCj6kQ37DcLpFeAft5dfJRi8TF4CAAA="
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #PKV
* type.coding.display = "private Krankenversicherung"
* period.start = "2022-04-01"
* period.end = "2027-07-31"
* beneficiary.reference =  "Patient/e36f9476-0d04-4394-a626-8b4706b005b0"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "23456789"
* payor.display = "Test PKV Krankenkasse"