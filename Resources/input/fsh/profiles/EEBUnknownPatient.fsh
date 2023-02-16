// Profile: EEBUnknownPatient
// Parent: Patient
// Id: eeb-unknown-patient
// * ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
// * insert Meta
// * meta 1..1
// * meta.profile 1..1
// * meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient" (exactly)
// * name 1..1
// * name.family 1..1
// * name.given 1..1
// * birthDate 1..1
// * address 1..1
// * address.postalCode 1..1


// // Beispielgenerierung
// Instance: EEBUnknownPatientSample
// InstanceOf: EEBUnknownPatient
// Title: "EEBUnknownPatient"
// Usage: #example
// * id = "1df9e029-2505-4551-b735-f1c1a1e2d889"
// * meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBUnknownPatient"
// * name.family = "TK-eAU-Schmidt"
// * name.given = "Wolfgang"
// * birthDate = "1991-01-04"
// * address.postalCode = "40221"