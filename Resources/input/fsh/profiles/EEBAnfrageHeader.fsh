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
    Einverstaendnis named Einverstaendnis 1..1
* extension[Leistungsdatum].value[x] 1..1
* extension[Einverstaendnis].value[x] 1..1

// hier OID Anfragender
* event[x] only Coding
* event[x] from EEBAnfrageUrsprungVS

* sender 1..1
* sender only Reference(EEBKBV_PR_FOR_Organization)
* sender.reference 1..1
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://pvs.de/KIM"


// Beispielgenerierung
Instance: EEBAnfrageHeaderSample
InstanceOf: EEBAnfrageHeader
Title: "Header of EEBAnfrageBundle"
Usage: #example
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