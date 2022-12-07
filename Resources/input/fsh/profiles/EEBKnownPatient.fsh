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
    versichertenId_GKV 0..1 and
    versichertenID_pkv 0..1
* identifier[versichertenId_GKV] only $identifier-kvid-10
* identifier[versichertenId_GKV].system
* identifier[versichertenId_GKV].value
* identifier[versichertenID_pkv] only $identifier-pkv
* identifier[versichertenID_pkv].system
* identifier[versichertenID_pkv].value


// Beispielgenerierung
Instance: EEBKnownPatientSample
InstanceOf: EEBKnownPatient
Title: "EEBKnownPatient"
Usage: #example
* id = "b8f0f69c-af1a-480b-8abf-44ab11aa23c5"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "T024791905"