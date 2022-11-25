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

// hier OID anfragende Praxiss
* event[x] only Coding
* event[x] from OrganizationTypeVS

* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://pvs.de/KIM"


// Beispielgenerierung
Instance: KBV_PR_FOR_OrganizationSample
InstanceOf: KBV_PR_FOR_Organization
Title: "Organisation for EEBAnfrageBundle"
Usage: #example
* id = "fad15347-a4b3-4899-a454-9fb43bdb0f30"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "012345678"
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