Profile: EEBUnknownPatient
Parent: Patient
Id: eeb-unknown-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/UnknownPatient"
* insert Meta
* name 1..1
* name only $humanname-de-basis
* name.family 1..
* name.family.extension ^slicing.discriminator.type = #value
* name.family.extension ^slicing.discriminator.path = "url"
* name.family.extension ^slicing.rules = #open
* name.family.extension[namenszusatz] ^sliceName = "namenszusatz"
* name.family.extension[namenszusatz] ^min = 0
* name.family.extension[namenszusatz] ^mustSupport = true
* name.family.extension[nachname] ^sliceName = "nachname"
* name.family.extension[nachname] ^mustSupport = true
* name.family.extension[vorsatzwort] ^sliceName = "vorsatzwort"
* name.family.extension[vorsatzwort] ^min = 0
* name.family.extension[vorsatzwort] ^mustSupport = true
* name.given 1..
* birthDate 1..
* address 1..1
* address.postalCode 1..