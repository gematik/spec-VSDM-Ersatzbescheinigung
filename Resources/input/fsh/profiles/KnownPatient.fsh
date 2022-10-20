Profile: KnownPatient
Parent: Patient
Id: known-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/KnownPatient"
* ^version = "1.0"
* ^status = #draft
* identifier 1..1 MS
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