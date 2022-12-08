// Profile: EEBFehlerHeader
// Parent: MessageHeader
// Id: eeb-fehler-header
// * ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerHeader"
// * insert Meta
// * meta 1..1
// * meta.profile 1..1
// * meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerHeader" (exactly)

// // hier OID Anfragender
// * event[x] only Coding
// * event[x] from EEBAnfrageUrsprungVS

// * source.endpoint 1..1
// * source.endpoint ^short = "Source endpoint URI of sender. E.g. https://Test-Krankenkasse.de/KIM"
// * response 1..1
// * response.identifier 1..1
// * response.identifier ^short = "Identifier of EEBAnfrageBundle"
// * response.identifier ^definition = "The Bundle.identifier of the EEBAnfrageBundle to which this message is a response."
// * response.code = #fatal-error (exactly)


// // Beispielgenerierung
// Instance: EEBFehlerHeaderSample
// InstanceOf: EEBFehlerHeader
// Title:   "Header for EEBFehlerBundle"
// Usage: #example
// * id = "241017e9-46bf-4951-a2ca-cdd5a9eab800"
// * meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerHeader"
// * eventCoding.system = "https://gematik.de/fhir/directory/CodeSystem/PractitionerProfessionOID"
// * eventCoding.code = #1.2.276.0.76.4.30
// * eventCoding.display = "Ärztin/Arzt"
// * source.endpoint = "https://Test-Krankenkasse.de/KIM"
// * response.identifier = "e71108ff-a936-44fa-9d7d-215a09428194"
// * response.code = #fatal-error