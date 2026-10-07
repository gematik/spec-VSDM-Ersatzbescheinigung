Invariant: -eeb-angabeOrganizationIdentifier
Description: "Im Organization-Profil muss als Identifier entweder das Institutionskennzeichen, die Betriebsstättennummer oder die KZV-Abrechnungsnummer angegeben werden."
Severity: #error
Expression: "entry.where(resource is Organization).resource.identifier.type.coding.where(code='BSNR' or code='XX' or code='KZVA').exists()"

Invariant: -eeb-angabePatientIdentifier
Description: "Im Patient-Profil muss entweder ein Identifier (GKV oder PKV) oder folgende Informationen (Name, Vorname, Geburtsdatum und Postleitzahl) angegeben werden."
Severity: #error
Expression: "entry.where(resource is Patient).resource.identifier.where(system='http://fhir.de/sid/gkv/kvid-10').exists() or entry.where(resource is Patient).resource.where(name.family and name.given and birthDate and address.postalCode).exists()"

Invariant: -eeb-checkEebVersionValue
Description: "Wird die Extension versionEEB verwendet, darf nur der Wert '2' angefragt werden."
Severity: #error
Expression: "
entry.resource.ofType(MessageHeader).extension.where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').exists()
implies
entry.resource.ofType(MessageHeader).extension.where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').all(
  value = '2'
)
"

Invariant: -eeb-PatientByVersion
Description: "Wird die Extension versionEEB verwendet, darf der KBV_PR_FOR_Patient nicht mehr verwendet werden."
Severity: #error
Expression: "
entry.resource.ofType(MessageHeader).extension.where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').exists()
implies
entry.resource.ofType(Patient)
.all(
  meta.profile.where(
    $this = 'https://gematik.de/fhir/eeb/StructureDefinition/EEBPatient'
    or
    $this = 'https://gematik.de/fhir/eeb/StructureDefinition/EEBKnownPatient'
  ).exists()
)
"

Invariant: -eeb-VersionByPatient
Description: "Wird der Patient EEBPatient verwendet, dann muss die Extension versionEEB vorhanden sein."
Severity: #error
Expression: "
entry.where(resource is Patient)
  .resource.meta.profile
    .where($this = 'https://gematik.de/fhir/eeb/StructureDefinition/EEBPatient').exists()
implies
entry.resource.ofType(MessageHeader)
  .extension
    .where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').exists()
"

Profile: EEBAnfrageBundle
Parent: Bundle
Id: EEBAnfrageBundle
* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBAnfrageBundle) (exactly)

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
    EEBPatient 0..1 and
    EEBKnownPatient 0..1 and
    KBV_PR_FOR_Patient 0..1 and
    KBV_PR_FOR_Organization 1..1
* entry[EEBAnfrageHeader].link ..0
* entry[EEBAnfrageHeader].resource 1..
* entry[EEBAnfrageHeader].resource only EEBAnfrageHeader
* entry[EEBAnfrageHeader].search ..0
* entry[EEBAnfrageHeader].request ..0
* entry[EEBAnfrageHeader].response ..0

* entry[EEBPatient].link ..0
* entry[EEBPatient].resource 1..
* entry[EEBPatient].resource only EEBPatient
* entry[EEBPatient].search ..0
* entry[EEBPatient].request ..0
* entry[EEBPatient].response ..0

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
// version 2 constraints
* obeys -eeb-checkEebVersionValue
* obeys -eeb-PatientByVersion
* obeys -eeb-VersionByPatient


