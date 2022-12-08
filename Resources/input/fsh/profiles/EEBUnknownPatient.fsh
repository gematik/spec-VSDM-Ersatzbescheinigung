Profile: EEBUnknownPatient
Parent: Patient
Id: eeb-unknown-patient
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient" (exactly)
* name 1..1
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.rules = #closed
* name contains
    name 1..1
* name[name] only $kbv_pr_base_datatype_name
* name[name].family 1..1
* name[name].given 1..1
* birthDate 1..1
* address 1..1
* address ^slicing.discriminator.type = #value
* address ^slicing.discriminator.path = "type"
* address ^slicing.rules = #closed
* address contains
    Strassenanschrift 1..1
* address[Strassenanschrift] only $kbv_pr_base_datatype_street_address
* address[Strassenanschrift].postalCode 1..1


// Beispielgenerierung
Instance: EEBUnknownPatientSample
InstanceOf: EEBUnknownPatient
Title: "EEBUnknownPatient"
Usage: #example
* id = "1df9e029-2505-4551-b735-f1c1a1e2d889"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
* name[name].family = "TK-eAU-Schmidt"
* name[name].given = "Wolfgang"
* birthDate = "1991-01-04"
* address[Strassenanschrift].postalCode = "40221"