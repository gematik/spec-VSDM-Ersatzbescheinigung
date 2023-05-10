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
* identifier.use 0..0
* identifier.type 0..0
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID"
* identifier.period 0..0
* identifier.assigner 0..0
* type = #message (exactly)
* timestamp 1..
* total 0..0
* link 0..0
* signature 0..0
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry 3..3
* entry contains
    EEBAnfrageHeader 1..1 and
    EEBKnownPatient 0..1 and
    KBV_PR_FOR_Patient 0..1 and
    KBV_PR_FOR_Organization 1..1
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
* entry[KBV_PR_FOR_Patient].link ..0
* entry[KBV_PR_FOR_Patient].resource 1..
* entry[KBV_PR_FOR_Patient].resource only KBV_PR_FOR_Patient
* entry[KBV_PR_FOR_Patient].search ..0
* entry[KBV_PR_FOR_Patient].request ..0
* entry[KBV_PR_FOR_Patient].response ..0
* entry[KBV_PR_FOR_Organization].link ..0
* entry[KBV_PR_FOR_Organization].resource 1..
* entry[KBV_PR_FOR_Organization].resource only KBV_PR_FOR_Organization
* entry[KBV_PR_FOR_Organization].search ..0
* entry[KBV_PR_FOR_Organization].request ..0
* entry[KBV_PR_FOR_Organization].response ..0
* obeys -eeb-angabeOrganizationIdentifier
* obeys -eeb-angabePatientIdentifier


Invariant: -eeb-angabeOrganizationIdentifier
Description: "Im Organization-Profil muss als Identifier entweder das Institutionskennzeichen, die Betriebsstättennummer oder die KZV-Abrechnungsnummer angegeben werden."
Severity: #error
Expression: "entry.where(resource is Organization).resource.identifier.type.coding.where(code='BSNR' or code='XX' or code='KZVA').exists()"

Invariant: -eeb-angabePatientIdentifier
Description: "Im Patient-Profil muss entweder ein Identifier (GKV oder PKV) oder folgende Informationen (Name, Vorname, Geburtsdatum und Postleitzahl) angegeben werden."
Severity: #error
Expression: "entry.where(resource is Patient).resource.identifier.type.coding.where(code='GKV' or code='PKV').exists() or entry.where(resource is Patient).resource.where(name.family and name.given and birthDate and address.postalCode).exists()"


// Beispielgenerierung
Instance: KBV_PR_FOR_OrganizationSample
InstanceOf: KBV_PR_FOR_Organization
Title: "Organization for EEBAnfrageBundle"
Usage: #inline
* id = "fad15347-a4b3-4899-a454-9fb43bdb0f30"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "123456"
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "123456789"
// To test invariant
// * identifier[Standortnummer].type = https://fhir.kbv.de/CodeSystem/KBV_CS_Base_identifier_type#KSN
// * identifier[Standortnummer].system = "http://fhir.de/sid/dkgev/standortnummer"
// * identifier[Standortnummer].value = "123456789"
* name = "Praxis Test"
* telecom[telefon].system = #phone
* telecom[telefon].value = "0123456789"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Testweg 10"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "10"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Testweg"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10115"
* address[Strassenanschrift].country = "D"

Instance: KBV_PR_FOR_PatientKnownSample
InstanceOf: KBV_PR_FOR_Patient
Title: "KBV_PR_FOR_PatientKnownSample"
Usage: #inline
* id = "eb601b0c-96cd-4ac8-8849-fdd7aca89c33"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "A123456789"
* name[name].use = #official
* name[name].family = "Königstein"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Königstein"
* name[name].given = "Ludger"
* birthDate = "1935-06-22"
* address[Strassenanschrift].type = #both
// * address[Strassenanschrift].line = "Blumenweg 14"
// * address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
// * address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "14"
// * address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
// * address[Strassenanschrift].line.extension[=][Strasse].valueString = "Blumenweg"
// * address[Strassenanschrift].city = "Esens"
// * address[Strassenanschrift].postalCode = "26427"
// * address[Strassenanschrift].country = "D"

Instance: KBV_PR_FOR_PatientKnownPkvSample
InstanceOf: KBV_PR_FOR_Patient
Title: "KBV_PR_FOR_PatientKnownPkvSample"
Usage: #inline
* id = "77355dc2-07cc-4cc6-bd78-afccfb7d0106"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenID_pkv].type = http://fhir.de/CodeSystem/identifier-type-de-basis#PKV
* identifier[versichertenID_pkv].system = "http://fhir.de/sid/pkv/kvid-10"
* identifier[versichertenID_pkv].value = "A987654321"
* name[name].use = #official
* name[name].family = "Meier"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Meier"
* name[name].given = "Hans"
* birthDate = "1965-04-11"
* address[Strassenanschrift].type = #both

Instance: KBV_PR_FOR_PatientUnknownSample
InstanceOf: KBV_PR_FOR_Patient
Title: "KBV_PR_FOR_PatientUnknownSample"
Usage: #inline
* id = "16c07b55-c7bd-4e64-86bc-bf00f0435ba7"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* name[name].use = #official
* name[name].family = "Meier"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Meier"
* name[name].given = "Max"
* birthDate = "1970-04-11"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Teststrasse 2"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Teststrasse"
* address[Strassenanschrift].city = "Dortmund"
* address[Strassenanschrift].postalCode = "44227"
* address[Strassenanschrift].country = "D"


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
* entry[+][KBV_PR_FOR_Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][KBV_PR_FOR_Organization].resource = KBV_PR_FOR_OrganizationSample

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
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/1ab11ab3-c73b-4144-8706-be3fc090b007"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample2
* entry[+][KBV_PR_FOR_Patient].fullUrl = "https://gematik.de/fhir/Patient/eb601b0c-96cd-4ac8-8849-fdd7aca89c33"
* entry[=][KBV_PR_FOR_Patient].resource = KBV_PR_FOR_PatientKnownSample
* entry[+][KBV_PR_FOR_Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][KBV_PR_FOR_Organization].resource = KBV_PR_FOR_OrganizationSample

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
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/591371dd-1ff4-48e7-ac25-29988a7ee903"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample3
* entry[+][KBV_PR_FOR_Patient].fullUrl = "https://gematik.de/fhir/Patient/16c07b55-c7bd-4e64-86bc-bf00f0435ba7"
* entry[=][KBV_PR_FOR_Patient].resource = KBV_PR_FOR_PatientUnknownSample
* entry[+][KBV_PR_FOR_Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][KBV_PR_FOR_Organization].resource = KBV_PR_FOR_OrganizationSample

Instance: EEBAnfrageBundleSampleKnownPatientPkv
InstanceOf: EEBAnfrageBundle
Title:   "EEBAnfrageBundleKnownPatientPkv"
Usage: #inline
* id = "eae51ab8-d813-4b7e-849e-3a5b83cde9d2"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:79939e34-c5cc-4da6-ba55-f4bd85832760"
* type = #message
* timestamp = "2022-08-29T02:10:37.154+02:00"
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/97d364a4-33ca-4968-8cea-89ef50e006b6"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample4
* entry[+][EEBKnownPatient].fullUrl = "https://gematik.de/fhir/Patient/4149fdf9-2417-4a58-ac02-3473f5eb5431"
* entry[=][EEBKnownPatient].resource = EEBKnownPatientPkvSample
* entry[+][KBV_PR_FOR_Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][KBV_PR_FOR_Organization].resource = KBV_PR_FOR_OrganizationSample

Instance: EEBAnfrageBundleSampleKnownKBV_PR_FOR_PatientPkv
InstanceOf: EEBAnfrageBundle
Title:   "EEBAnfrageBundleKnownKBV_PR_FOR_PatientPkv"
Usage: #inline
* id = "48effb6a-2f00-4cc1-8f3f-2598c6e1f33f"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageBundle"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1407c1c4-392f-4c63-940d-ffea9344e0dc"
* type = #message
* timestamp = "2022-08-29T02:10:37.154+02:00"
* entry[+][EEBAnfrageHeader].fullUrl = "https://gematik.de/fhir/MessageHeader/35c13445-127b-4c88-b819-68bff12293c2"
* entry[=][EEBAnfrageHeader].resource = EEBAnfrageHeaderSample5
* entry[+][KBV_PR_FOR_Patient].fullUrl = "https://gematik.de/fhir/Patient/77355dc2-07cc-4cc6-bd78-afccfb7d0106"
* entry[=][KBV_PR_FOR_Patient].resource = KBV_PR_FOR_PatientKnownPkvSample
* entry[+][KBV_PR_FOR_Organization].fullUrl = "https://gematik.de/fhir/Organisation/fad15347-a4b3-4899-a454-9fb43bdb0f30"
* entry[=][KBV_PR_FOR_Organization].resource = KBV_PR_FOR_OrganizationSample