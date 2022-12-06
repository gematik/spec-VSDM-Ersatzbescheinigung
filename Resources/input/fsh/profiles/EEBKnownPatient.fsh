Profile: EEBKnownPatient
Parent: Patient
Id: eeb-known-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient" (exactly)
* identifier 1..1
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #closed
* identifier contains
    GKV 0..1 and
    PKV 0..1
* identifier[GKV] only $identifier-kvid-10
* identifier[GKV].system
* identifier[GKV].value
* identifier[PKV] only $identifier-pkv
* identifier[PKV].value


// Beispielgenerierung
Instance: EEBKnownPatientSample
InstanceOf: EEBKnownPatient
Title: "EEBKnownPatient"
Usage: #example
* id = "b8f0f69c-af1a-480b-8abf-44ab11aa23c5"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient"
* identifier[GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[GKV].value = "T024791905"