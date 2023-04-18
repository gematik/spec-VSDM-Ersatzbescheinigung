Profile: EEBBescheinigungHeader
Parent: MessageHeader
Id: eeb-bescheinigung-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader" (exactly)

// hier OID Anfragender
* event[x] only Coding
* event[x] from EEBAnfrageUrsprungVS

* destination 0..0
* sender 0..0
* enterer 0..0
* author 0..0
* source.name 0..0
* source.software 0..0
* source.version 0..0
* source.contact 0..0
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://Test-Krankenkasse.de/KIM"
* responsible 0..0
* reason 0..0
* response 0..1
* response ^short = "If there is an EEBAnfrageBundle, the Bundle.identifier is mandatory."
* response.identifier 1..1
* response.identifier ^short = "Identifier of EEBAnfrageBundle"
* response.identifier ^definition = "The Bundle.identifier of the EEBAnfrageBundle to which this message is a response."
* response.code = #ok (exactly)
* response.details 0..0
//* focus 0..0
* definition 0..0


// Beispielgenerierung
Instance: EEBBescheinigungHeaderSample
InstanceOf: EEBBescheinigungHeader
Title:   "Header for EEBBescheinigungBundle"
Usage: #inline
* id = "bd901c08-0133-4276-b34b-eb810a62deda"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"
* eventCoding.code = #1.2.276.0.76.4.50
* eventCoding.display = "Betriebsstätte Arzt"
* source.endpoint = "https://Test-Krankenkasse.de/KIM"
* response.identifier = "e71108ff-a936-44fa-9d7d-215a09428194"
* response.code = #ok
* focus[+].reference = "Patient/437f2555-2396-4c64-a656-e9553161ca3c"
* focus[+].reference = "Coverage/2d4da53a-413a-48fe-b908-2e67b5761523"

Instance: EEBBescheinigungHeaderPkvSample
InstanceOf: EEBBescheinigungHeader
Title:   "Header for EEBBescheinigungBundle"
Usage: #inline
* id = "aafed78c-696c-4805-9e7b-d454e1aeb538"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/PractitionerProfessionOID"
* eventCoding.code = #1.2.276.0.76.4.49
* eventCoding.display = "Versicherte/-r"
* source.endpoint = "https://Test-Krankenkasse.de/KIM"
* response.identifier = "49ee1b63-70d6-46ec-9200-7565833bc404"
* response.code = #ok
* focus[+].reference = "Patient/e36f9476-0d04-4394-a626-8b4706b005b0"
* focus[+].reference = "Coverage/d7fbdcd7-f220-4a11-8526-d846e4db2a82"