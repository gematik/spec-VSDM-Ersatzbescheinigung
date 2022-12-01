Profile: EEBUnknownPatient
Parent: Patient
Id: eeb-unknown-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient" (exactly)
* name 1..1
* name only $humanname-de-basis
* name.family 1..1
* name.family.extension ^slicing.discriminator.type = #value
* name.family.extension ^slicing.discriminator.path = "url"
* name.family.extension ^slicing.rules = #open
* name.family.extension[namenszusatz] ^sliceName = "namenszusatz"
* name.family.extension[namenszusatz] ^min = 0
* name.family.extension[nachname] ^sliceName = "nachname"
* name.family.extension[vorsatzwort] ^sliceName = "vorsatzwort"
* name.family.extension[vorsatzwort] ^min = 0
* name.given 1..1
* birthDate 1..1
* address 1..1
* address.postalCode 1..1


// Beispielgenerierung
Instance: EEBUnknownPatientSample
InstanceOf: EEBUnknownPatient
Title: "EEBUnknownPatient"
Usage: #example
* id = "1df9e029-2505-4551-b735-f1c1a1e2d889"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
* name.family = "TK-eAU-Schmidt"
* name.family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension[nachname].valueString = "TK-eAU-Schmidt"
* name.given = "Wolfgang"
* birthDate = "1991-01-04"
* address.postalCode = "40221"