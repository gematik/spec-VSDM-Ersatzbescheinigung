Profile: EEBUnknownPatient
Parent: Patient
Id: eeb-unknown-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient" (exactly)
* identifier 0..0
* active 0..0
* name 1..1
* name.family 1..1
* name.given 1..1
* telecom 0..0
* gender 0..0
* birthDate 1..1
* deceased[x] 0..0
* address 1..1
* address.postalCode 1..1
* maritalStatus 0..0
* multipleBirth[x] 0..0
* photo 0..0
* contact 0..0
* communication 0..0
* generalPractitioner 0..0
* managingOrganization 0..0
* link 0..0


// Beispielgenerierung
Instance: EEBUnknownPatientSample
InstanceOf: EEBUnknownPatient
Title: "EEBUnknownPatient"
Usage: #example
* id = "1df9e029-2505-4551-b735-f1c1a1e2d889"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
* name.family = "TK-eAU-Schmidt"
* name.given = "Wolfgang"
* birthDate = "1991-01-04"
* address.postalCode = "40221"