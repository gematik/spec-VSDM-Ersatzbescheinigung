Profile: EEBCoverageNoEgk
Parent: EEBCoverageBasis
Id: eeb-coverage-no-egk
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk"
* insert Meta
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk" (exactly)
* payor.extension[abrechnendeIK] 1..1
* extension[versionEgk] 0..0
* extension[allgemeineVersicherungsdaten] 0..0
* extension[persoenlicheVersichertendaten] 0..0
* extension[geschuetzteVersichertendaten] 0..0


// Beispielgenerierung
Instance: KBV_PR_FOR_PatientNoEgkSample
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle"
Usage: #example
* id = "d62d9d82-2396-4c64-a656-2e67b5761523"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* name[name].use = #official
* name[name].family = "Meier"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Meier"
* name[name].given = "Max"
* birthDate = "1970-04-11"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Teststrasse 2"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Teststrasse"
* address[Strassenanschrift].city = "Dortmund"
* address[Strassenanschrift].postalCode = "44227"
* address[Strassenanschrift].country = "D"

Instance: EEBCoverageNoEgkSample
InstanceOf: EEBCoverageNoEgk
Title:   "Coverage for EEBBescheinigungBundle"
Usage: #example
* id = "e9553161ca3c-413a-48fe-b908-04159be709fb"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk"
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
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* period.start = "2022-04-01"
* period.end = "2022-07-31"
* beneficiary.reference =  "Patient/d62d9d82-2396-4c64-a656-2e67b5761523"
* payor.extension[0].url = "http://fhir.de/StructureDefinition/AbrechnendeIK"
* payor.extension[=].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.extension[=].valueIdentifier.value = "756756324"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "12345678"
* payor.display = "Test Krankenkasse"