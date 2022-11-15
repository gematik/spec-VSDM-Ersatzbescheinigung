Profile: EEBBescheinigungHeader
Parent: MessageHeader
Id: eeb-bescheinigung-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader" (exactly)

// hier OID Kasse
* event[x] only Coding
* event[x] from OrganizationTypeVS

* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://Test-Krankenkasse.de/KIM"
* response 1..1
* response.identifier 1..1
* response.identifier ^short = "Identifier of EEBAnfrageBundle"
* response.identifier ^definition = "The Bundle.identifier of the EEBAnfrageBundle to which this message is a response."
* response.code = #ok (exactly)


// Beispielgenerierung
Instance: EEBBescheinigungHeaderSample
InstanceOf: EEBBescheinigungHeader
Title:   "Header for EEBBescheinigungBundle"
Usage: #example
* id = "bd901c08-0133-4276-b34b-eb810a62deda"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBBescheinigungHeader"
* eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/OrganizationProfessionOID"
* eventCoding.code = #1.2.276.0.76.4.59
* eventCoding.display = "Betriebsstätte Kostenträger"
* source.endpoint = "https://Test-Krankenkasse.de/KIM"
* response.identifier = "e71108ff-a936-44fa-9d7d-215a09428194"
* response.code = #ok