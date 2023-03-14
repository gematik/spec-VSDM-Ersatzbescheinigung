Profile: EEBAnfrageHeader
Parent: MessageHeader
Id: eeb-anfrage-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader" (exactly)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Leistungsdatum named Leistungsdatum 1..1 and
    Einverstaendnis named Einverstaendnis 1..1 and
    Institutionskennzeichen named Institutionskennzeichen 1..1
* extension[Leistungsdatum].value[x] 1..1
* extension[Einverstaendnis].value[x] 1..1
* extension[Institutionskennzeichen].value[x] 1..1

// hier OID Anfragender
* event[x] only Coding
* event[x] from EEBAnfrageUrsprungVS

* destination 0..0
* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1
* sender.type 0..0
* sender.identifier 0..0
* sender.display 0..0
* enterer 0..0
* author 0..0
* source.name 0..0
* source.software 0..0
* source.version 0..0
* source.contact 0..0
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://pvs.de/KIM"
* responsible 0..0
* reason 0..0
* response 0..0
//* focus 0..0
* definition 0..0


// Beispielgenerierung
Instance: EEBAnfrageHeaderSample
InstanceOf: EEBAnfrageHeader
Title: "Header of EEBAnfrageBundle"
Usage: #inline
* id = "bb03a437-fe56-46f9-8622-ffc3766e7c70"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader"
* eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"
* eventCoding.code = #1.2.276.0.76.4.50
* eventCoding.display = "Betriebsstätte Arzt"
* sender.reference = "Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* source.endpoint = "https://pvs.de/KIM"
* extension[0][Leistungsdatum].url = "https://gematik.de/fhir/eeb/StructureDefinition/Leistungsdatum"
* extension[=][Leistungsdatum].valueDate = "2022-02-01"
* extension[+][Einverstaendnis].url = "https://gematik.de/fhir/eeb/StructureDefinition/Einverstaendnis"
* extension[=][Einverstaendnis].valueBoolean = true
* extension[+][Institutionskennzeichen].url = "https://gematik.de/fhir/eeb/StructureDefinition/Institutionskennzeichen"
* extension[=][Institutionskennzeichen].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* extension[=][Institutionskennzeichen].valueIdentifier.value = "12345678"
* focus[+].reference = "Patient/b8f0f69c-af1a-480b-8abf-44ab11aa23c5"

Instance: EEBAnfrageHeaderSample2
InstanceOf: EEBAnfrageHeader
Title: "Header of EEBAnfrageBundle"
Usage: #inline
* id = "1ab11ab3-c73b-4144-8706-be3fc090b007"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader"
* eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"
* eventCoding.code = #1.2.276.0.76.4.50
* eventCoding.display = "Betriebsstätte Arzt"
* sender.reference = "Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* source.endpoint = "https://pvs.de/KIM"
* extension[0][Leistungsdatum].url = "https://gematik.de/fhir/eeb/StructureDefinition/Leistungsdatum"
* extension[=][Leistungsdatum].valueDate = "2022-02-01"
* extension[+][Einverstaendnis].url = "https://gematik.de/fhir/eeb/StructureDefinition/Einverstaendnis"
* extension[=][Einverstaendnis].valueBoolean = true
* extension[+][Institutionskennzeichen].url = "https://gematik.de/fhir/eeb/StructureDefinition/Institutionskennzeichen"
* extension[=][Institutionskennzeichen].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* extension[=][Institutionskennzeichen].valueIdentifier.value = "12345678"
* focus[+].reference = "Patient/eb601b0c-96cd-4ac8-8849-fdd7aca89c33"

Instance: EEBAnfrageHeaderSample3
InstanceOf: EEBAnfrageHeader
Title: "Header of EEBAnfrageBundle"
Usage: #inline
* id = "591371dd-1ff4-48e7-ac25-29988a7ee903"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader"
* eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"
* eventCoding.code = #1.2.276.0.76.4.50
* eventCoding.display = "Betriebsstätte Arzt"
* sender.reference = "Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* source.endpoint = "https://pvs.de/KIM"
* extension[0][Leistungsdatum].url = "https://gematik.de/fhir/eeb/StructureDefinition/Leistungsdatum"
* extension[=][Leistungsdatum].valueDate = "2022-02-01"
* extension[+][Einverstaendnis].url = "https://gematik.de/fhir/eeb/StructureDefinition/Einverstaendnis"
* extension[=][Einverstaendnis].valueBoolean = true
* extension[+][Institutionskennzeichen].url = "https://gematik.de/fhir/eeb/StructureDefinition/Institutionskennzeichen"
* extension[=][Institutionskennzeichen].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
* extension[=][Institutionskennzeichen].valueIdentifier.value = "12345678"
* focus[+].reference = "Patient/16c07b55-c7bd-4e64-86bc-bf00f0435ba7"
