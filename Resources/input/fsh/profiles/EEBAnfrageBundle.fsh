Profile: EEBAnfrageBundle
Parent: Bundle
Id: eeb-anfrage-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* insert Meta
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle" (exactly)
* id 1..1
* identifier 1..
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID"
* type = #message (exactly)
* timestamp 1..
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry 3..3
* entry contains
    EEBAnfrageHeader 1..1 and
    EEBKnownPatient 0..1 and
    EEBUnknownPatient 0..1 and
    EEBKBV_PR_FOR_Patient 0..1 and
    Organization 1..1
* entry[EEBAnfrageHeader].link ..0
* entry[EEBAnfrageHeader].resource 1..
* entry[EEBAnfrageHeader].resource only EEBAnfrageHeader
* entry[EEBAnfrageHeader].search ..0
* entry[EEBAnfrageHeader].request ..0
* entry[EEBAnfrageHeader].response ..0
* entry[EEBKnownPatient].link ..0
* entry[EEBKnownPatient].resource 1..
* entry[EEBKnownPatient].resource only EEBKnownPatient
* entry[EEBKnownPatient].search ..0
* entry[EEBKnownPatient].request ..0
* entry[EEBKnownPatient].response ..0
* entry[EEBUnknownPatient].link ..0
* entry[EEBUnknownPatient].resource 1..
* entry[EEBUnknownPatient].resource only EEBUnknownPatient
* entry[EEBUnknownPatient].search ..0
* entry[EEBUnknownPatient].request ..0
* entry[EEBUnknownPatient].response ..0
* entry[EEBKBV_PR_FOR_Patient].link ..0
* entry[EEBKBV_PR_FOR_Patient].resource 1..
* entry[EEBKBV_PR_FOR_Patient].resource only EEBKBV_PR_FOR_Patient
* entry[EEBKBV_PR_FOR_Patient].search ..0
* entry[EEBKBV_PR_FOR_Patient].request ..0
* entry[EEBKBV_PR_FOR_Patient].response ..0
* entry[Organization].link ..0
* entry[Organization].resource 1..
* entry[Organization].resource only KBV_PR_FOR_Organization
* entry[Organization].search ..0
* entry[Organization].request ..0
* entry[Organization].response ..0


// Beispielgenerierung
Instance: EEBAnfrageBundleSampleKnownPatient
InstanceOf: EEBAnfrageBundle
Title:   "EEBAnfrageBundleKnownPatient"
Usage: #example
* id = "1f311c40-fee9-4b03-b0c4-c29d432f2371"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:79939e34-c5cc-4da6-ba55-f4bd85832760"
* type = #message
* timestamp = "2022-08-29T02:10:37.154+02:00"
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bb03a437-fe56-46f9-8622-ffc3766e7c70"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample
* entry[+][EEBKnownPatient].fullUrl = "https://gematik.de/fhir/Patient/b8f0f69c-af1a-480b-8abf-44ab11aa23c5"
* entry[=][EEBKnownPatient].resource = EEBKnownPatientSample
* entry[+][Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][Organization].resource = KBV_PR_FOR_OrganizationSample

Instance: EEBAnfrageBundleSampleKnownKBV_PR_FOR_Patient
InstanceOf: EEBAnfrageBundle
Title:   "EEBAnfrageBundleKnownKBV_PR_FOR_Patient"
Usage: #example
* id = "96120812-a785-4fe3-a1e9-244314fdad9d"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1407c1c4-392f-4c63-940d-ffea9344e0dc"
* type = #message
* timestamp = "2022-08-29T02:10:37.154+02:00"
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bb03a437-fe56-46f9-8622-ffc3766e7c70"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample
* entry[+][EEBKBV_PR_FOR_Patient].fullUrl = "https://gematik.de/fhir/Patient/eb601b0c-96cd-4ac8-8849-fdd7aca89c33"
* entry[=][EEBKBV_PR_FOR_Patient].resource = EEBKBV_PR_FOR_PatientKnownSample
* entry[+][Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][Organization].resource = KBV_PR_FOR_OrganizationSample


Instance: EEBAnfrageBundleSampleUnknownPatient
InstanceOf: EEBAnfrageBundle
Title:   "EEBAnfrageBundleUnknownPatient"
Usage: #example
* id = "ff0406a7-b0c2-4426-82fd-8e49e72814da"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:182259bd-1d1d-470a-8744-1dc36ceea0a7"
* type = #message
* timestamp = "2022-08-29T02:10:37.154+02:00"
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bb03a437-fe56-46f9-8622-ffc3766e7c70"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample
* entry[+][EEBKnownPatient].fullUrl = "https://gematik.de/fhir/Patient/1df9e029-2505-4551-b735-f1c1a1e2d889"
* entry[=][EEBKnownPatient].resource = EEBUnknownPatientSample
* entry[+][Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][Organization].resource = KBV_PR_FOR_OrganizationSample

Instance: EEBAnfrageBundleSampleUnknownKBV_PR_FOR_Patient
InstanceOf: EEBAnfrageBundle
Title:   "EEBAnfrageBundleUnknownKBV_PR_FOR_Patient"
Usage: #example
* id = "cef4c975-753e-4b25-bec3-6549c7360e0a"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:186b422f-2bf6-474c-b512-480c6f1f1c7c"
* type = #message
* timestamp = "2022-08-29T02:10:37.154+02:00"
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/bb03a437-fe56-46f9-8622-ffc3766e7c70"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample
* entry[+][EEBKBV_PR_FOR_Patient].fullUrl = "https://gematik.de/fhir/Patient/16c07b55-c7bd-4e64-86bc-bf00f0435ba7"
* entry[=][EEBKBV_PR_FOR_Patient].resource = EEBKBV_PR_FOR_PatientUnknownSample
* entry[+][Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][Organization].resource = KBV_PR_FOR_OrganizationSample