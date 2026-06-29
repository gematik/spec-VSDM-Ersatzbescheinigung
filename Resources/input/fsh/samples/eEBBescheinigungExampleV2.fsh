Instance: eEBBescheinigungExampleV2
InstanceOf: EEBBescheinigungBundle
Usage: #example

* id = "eeb-bescheinigung-v2"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb"

* type = #message
* timestamp = "2026-06-02T10:05:00+02:00"

/////////////////////////////////////////////////////
// Slice-Namen statt Index + gültige UUIDs
/////////////////////////////////////////////////////

* entry[+][EEBBescheinigungHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/11111111-1111-1111-1111-111111111111"
* entry[=][EEBBescheinigungHeader].resource = BescheinigungHeaderV2

* entry[+][KBVFORPatient].fullUrl = "https://gematik.de/fhir/Patient/22222222-2222-2222-3333-222222222222"
* entry[=][KBVFORPatient].resource = PatientFull

* entry[+][EEBCoverageVSDM].fullUrl = "https://gematik.de/fhir/Coverage/2d4da53a-413a-48fe-b908-2e67b576152u"
* entry[=][EEBCoverageVSDM].resource = CoverageVSDM


/////////////////////////////////////////////////////
// Header
/////////////////////////////////////////////////////
Instance: BescheinigungHeaderV2
InstanceOf: EEBBescheinigungHeader
Usage: #inline
* id = "11111111-1111-1111-1111-111111111111"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">EEBBescheinigungHeader für eEB v2</div>"
* eventCoding.system = $system-organizationProfessionOID-code
* eventCoding.code = #1.2.276.0.76.4.50
* eventCoding.display = "Betriebsstätte Arzt"

* source.endpoint = "kim://kasse@example.kim.telematik"
// response.identifier ist STRING (kein Identifier!)
* response.code = #ok
* response.identifier = "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"

* extension[versionEEB].url = "https://gematik.de/fhir/eeb/StructureDefinition/versionEEB"
* extension[versionEEB].valueCode = #2.0

* extension[servicePeriod].url = "https://gematik.de/fhir/eeb/StructureDefinition/servicePeriod"
* extension[servicePeriod].valuePeriod.start = "2026-04-01"
* extension[servicePeriod].valuePeriod.end = "2026-06-30"

* extension[noAddressLine].url = "https://gematik.de/fhir/eeb/StructureDefinition/noAddressLine"
* extension[noAddressLine].valueBoolean = true

* extension[KVNRinClearing].url = "https://gematik.de/fhir/eeb/StructureDefinition/KVNRinClearing"
* extension[KVNRinClearing].valueDate = "2026-06-01"


/////////////////////////////////////////////////////
// Patient (KBV) 
/////////////////////////////////////////////////////
Instance: PatientFull
InstanceOf: KBV_PR_FOR_Patient
Usage: #inline
* id = "22222222-2222-2222-3333-222222222222"
* meta.versionId = "1"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.3"
* identifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
* identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* identifier.value = "T576543456"
* name.use = #official
* name.family = "Haselnuss"
* name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension.valueString = "Haselnuss"
* name.given = "Eileen"
* birthDate = "1993-08-13"
* address.type = #both
* address.line = "Musterstr. 3"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "3"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Musterstr."
* address.country.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address.country.extension[=].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* address.country.extension[=].valueCoding.code = #D
* address.country = "DE"
* address.city = "Berlin"
* address.postalCode = "10623"


/////////////////////////////////////////////////////
// Coverage (EEBCoverageVSDM)
/////////////////////////////////////////////////////
Instance: CoverageVSDM
InstanceOf: EEBCoverageVSDM
Usage: #inline
* id = "2d4da53a-413a-48fe-b908-2e67b576152u"
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">EEBCoverage gemäß VSDM2</div>"
* extension[WOP].url = "http://fhir.de/StructureDefinition/gkv/wop"
* extension[WOP].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP"
* extension[WOP].valueCoding.code = #52
* extension[WOP].valueCoding.display = "Baden-Württemberg"

* extension[versichertenart].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
* extension[versichertenart].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS"
* extension[versichertenart].valueCoding.code = #3
* extension[versichertenart].valueCoding.display = "Familienangehoerige"

* extension[zuzahlungsstatus].url = "http://fhir.de/StructureDefinition/gkv/zuzahlungsstatus"
* extension[zuzahlungsstatus].extension[+].url = "status"
* extension[zuzahlungsstatus].extension[=].valueBoolean = true
* extension[zuzahlungsstatus].extension[+].url = "gueltigBis"
* extension[zuzahlungsstatus].extension[=].valueDate = "2027-06-09"

* status = #active
* beneficiary = Reference(Patient/22222222-2222-2222-3333-222222222222)
* period.start = "2018-01-01"

* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* type.coding.display = "gesetzliche Krankenversicherung"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "101575519"
* payor.display = "Techniker Krankenkasse"
