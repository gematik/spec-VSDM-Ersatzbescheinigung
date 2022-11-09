Profile: EEBKnownPatient
Parent: Patient
Id: eeb-known-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient"
* insert Meta
* identifier 1..1
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #closed
* identifier contains
    GKV 0..1 MS and
    PKV 0..1 MS
* identifier[GKV] only $identifier-kvid-10
* identifier[GKV].system MS
* identifier[GKV].value MS
* identifier[PKV] only $identifier-pkv
* identifier[PKV].value MS