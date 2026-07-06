Instance: eEBAnfrageExampleV2
InstanceOf: EEBAnfrageBundle
Usage: #example

* id = "eeb-anfrage-v2"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"

* type = #message
* timestamp = "2026-06-02T10:00:00+02:00"

/////////////////////////////////////////////////////
//  Slice-Namen + gültige UUIDs
/////////////////////////////////////////////////////

* entry[+].fullUrl = "https://gematik.de/fhir/MessageHeader/11111111-1111-1111-1111-111111111111"
* entry[=].resource = AnfrageHeaderV2

* entry[+].fullUrl = "https://gematik.de/fhir/Patient/22222222-2222-2222-2222-222222222222"
* entry[=].resource = PatientKnown


* entry[+].fullUrl = "https://gematik.de/fhir/Organization/33333333-3333-3333-3333-333333333333"
* entry[=].resource = OrgExample



/////////////////////////////////////////////////////
// Header
/////////////////////////////////////////////////////
Instance: AnfrageHeaderV2
InstanceOf: EEBAnfrageHeader
Usage: #inline
* id = "11111111-1111-1111-1111-111111111111"

* eventCoding.system = $system-organizationProfessionOID-code
* eventCoding.code = #1.2.276.0.76.4.50
* eventCoding.display = "Betriebsstätte Arzt"

* source.endpoint = "kim://praxis@example.kim.telematik"

// Referenz MUSS fullUrl matchen
* sender.reference = "Organisation/33333333-3333-3333-3333-333333333333"
* extension[Leistungsdatum].url = "https://gematik.de/fhir/eeb/StructureDefinition/Leistungsdatum"
* extension[Leistungsdatum].valueDate = "2026-06-01"

* extension[Einverstaendnis].url = "https://gematik.de/fhir/eeb/StructureDefinition/Einverstaendnis"
* extension[Einverstaendnis].valueBoolean = true

* extension[Institutionskennzeichen].url = "https://gematik.de/fhir/eeb/StructureDefinition/Institutionskennzeichen"
* extension[Institutionskennzeichen].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* extension[Institutionskennzeichen].valueIdentifier.value = "109999999"

* extension[versionEEB].url = "https://gematik.de/fhir/eeb/StructureDefinition/versionEEB"
* extension[versionEEB].valueCode = #2


/////////////////////////////////////////////////////
// Patient (EEBKnownPatient)
/////////////////////////////////////////////////////
Instance: PatientKnown
InstanceOf: EEBKnownPatient
Usage: #inline
* id = "22222222-2222-2222-2222-222222222222"
* identifier[KVNR].type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
* identifier[KVNR].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[KVNR].value = "A123456789"

/////////////////////////////////////////////////////
// Organization (KBV) 
/////////////////////////////////////////////////////
Instance: OrgExample
InstanceOf: KBV_PR_FOR_Organization
Usage: #inline
* id = "33333333-3333-3333-3333-333333333333"
// neu mit KBV.for 1.3
* meta.versionId = "1"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.3"
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "123456"
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "123456789"
* name = "Praxis Test"
* telecom[telefon].system = #phone
* telecom[telefon].value = "0123456789"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Testweg 10"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "10"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Testweg"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10115"
* address[Strassenanschrift].country = "D"