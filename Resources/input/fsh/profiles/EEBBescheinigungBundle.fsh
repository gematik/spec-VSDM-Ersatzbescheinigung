Invariant: -eeb-angabePatientPLZ
Description: "In der Ressource vom Typ Patient ist keine Postleitzahl vorhanden, diese ist aber eine Pflichtangabe."
Severity: #error
Expression: "entry.where(resource is Patient).resource.address.postalCode.exists()"

Invariant: -eeb-checkConditionCode49
Description: "Wenn Versicherter '1.2.276.0.76.4.49', dann muss EEBCoverageEgk, Patient-Resource muss mit KVNR  [authentisierte App-Anfrage]."
Severity: #error
Expression: "entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.49' implies (entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgk') and entry.where(resource is Patient).resource.identifier.count() > 0)"

Invariant: -eeb-checkConditionOtherCodes
Description: "Wenn eventCoding.code weder HBA noch Versicherter ist, dann darf die Coverage nur vom Profil (EEBCoverageEgkNoAddressLine oder EEBCoverageNoEgk sein) und (die Patient-Resource darf keine Straße in der Adressangabe enthalten oder muss ein Postfach sein) [SMC-B Prüfung] - Außer, es ist die Version 2.1 mit 
VSDM2Coverage GKV, dann ist die Angabe der Adresse in der Patient-Resource wieder erlaubt."
Severity: #error
Expression: "((entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.30' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.31' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.45' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.46' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.47' or
entry.where(resource is MessageHeader).resource.event.code = '1.2.276.0.76.4.49').not() implies ((entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageEgkNoAddressLine') or entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk')) and (entry.where(resource is Patient).resource.address.line.count() = 0 or entry.where(resource is Patient).resource.address.type = 'postal'))) 
or
(entry.where(resource is MessageHeader).resource.extension.where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB' and value = '2.1').exists() and entry.where(resource is Coverage).resource.meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageVSDM') implies (entry.where(resource is Patient).resource.address.line.count() >= 0))"

Invariant: -eeb-checkEebVersionCoverage
Description: "Wird die Extension versionEEB verwendet, darf als Coverage nur EEBCoverageVSDM verwendet werden. Die Coverages EEBCoverageEgk, EEBCoverageNoEgk und EEBCoverageEgkNoAddressline dürfen nicht mehr verwendet werden"
Severity: #error
Expression: "entry.resource.ofType(MessageHeader).extension.where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').exists()
implies 
entry.resource.ofType(Coverage).all(
  meta.profile.exists($this = 'https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageVSDM')
)"

Invariant: -eeb-checkEebVersionExtensions
Description: "Wird die Extension versionEEB mit dem code 2.0 verwendet, muss die Extension noAddressLine mit „true“ gesetzt sein und darf in KBV_PR_FOR_Patitent im adress-Feld kein Feld Line verwendet werden. Wird die Extension versionEEB mit dem code 2.1 (zunächst nur OCI aus der Kassen-App) verwendet, darf die Extension noAddressLine nicht mit „true“ gesetzt sein."
Severity: #error
Expression: "
(
  entry.resource.ofType(MessageHeader)
    .extension
      .where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB' and value = '2.0').exists()
  implies
  (
    entry.resource.ofType(MessageHeader)
      .extension
        .where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/noAddressLine' and value = true).exists()
    and
    entry.resource.ofType(Patient).address.line.empty()
  )
)
and
(
  entry.resource.ofType(MessageHeader)
    .extension
      .where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB' and value = '2.1').exists()
  implies
  (
    entry.resource.ofType(MessageHeader)
      .extension
        .where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/noAddressLine' and value = true).exists().not()
  )
)
"

Invariant: -eeb-checkEebVersionKVNRclearing
Description: "Wird die Extension KVNRinClearing verwendet, darf in der Patient-Ressource kein identifier verwendet werden."
Severity: #error
Expression: "entry.resource.ofType(MessageHeader).extension.where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/KVNRinClearing').exists() implies
  entry.resource.ofType(Patient).identifier.empty()"

Invariant: -eeb-checkPatient
Description: "Wenn im MessageHeader die Extension versionEEB vorhanden ist, muss die Patient-Ressource dem Profil EEBPatient entsprechen. Ist die Extension nicht vorhanden, muss die Patient-Ressource dem Profil KBV_PR_FOR_Patient entsprechen."
Severity: #error
Expression: "
(
  entry.resource.ofType(MessageHeader).extension.where(url='https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').exists()
  implies
  entry.resource.ofType(Patient).meta.profile.contains('https://gematik.de/fhir/eeb/StructureDefinition/EEBPatient')
)
and
(
  entry.resource.ofType(MessageHeader).extension.where(url='https://gematik.de/fhir/eeb/StructureDefinition/versionEEB').exists().not()
  implies
  entry.resource.ofType(Patient).meta.profile.contains('https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient')
)
"

Invariant: -eeb-checkResourceCount
Description: "Ein EEBBescheinigungsBundle muss genau einen MessageHeader, genau einen Patient und genau eine Coverage enthalten."
Severity: #error
Expression: "
entry.resource.ofType(MessageHeader).count() = 1
and
entry.resource.ofType(Patient).count() = 1
and
entry.resource.ofType(Coverage).count() = 1
"

Invariant: -eeb-checkResponse
Description: "Wird die Extension versionEEB mit Wert '2.1' verwendet (zunächst nur OCI aus der Kassen-App), darf kein Response-Bezug zu einer eEBAnfrage vorhanden sein."
Severity: #error
Expression: "
entry.resource.ofType(MessageHeader)
  .extension
    .where(url = 'https://gematik.de/fhir/eeb/StructureDefinition/versionEEB' and value = '2.1').exists()
implies
entry.resource.ofType(MessageHeader).response.exists().not()
"

Profile: EEBBescheinigungBundle
Parent: Bundle
Id: EEBBescheinigungBundle
* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBBescheinigungBundle) (exactly)

* id 1..1
* identifier 1..
* identifier.use 0..0
* identifier.type 0..0
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID als übergreifender Identifier für mehrere Anfragen eines Vorgangs"
* identifier.period 0..0
* identifier.assigner 0..0
* type = #message (exactly)
* timestamp 1..
* total 0..0
* link 0..0
* signature 0..0
* entry 1..
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry 3..3
* entry contains
    EEBBescheinigungHeader 1..1 and
    KBVFORPatient 0..1 and
    EEBPatient 0..1 and
    EEBCoverageEgk 0..1 and
    EEBCoverageEgkNoAddressLine 0..1 and
    EEBCoverageNoEgk 0..1 and
    EEBCoverageVSDM 0..1
* entry[EEBBescheinigungHeader].link ..0
* entry[EEBBescheinigungHeader].resource 1..
* entry[EEBBescheinigungHeader].resource only EEBBescheinigungHeader
* entry[EEBBescheinigungHeader].search ..0
* entry[EEBBescheinigungHeader].request ..0
* entry[EEBBescheinigungHeader].response ..0

* entry[KBVFORPatient].link ..0
* entry[KBVFORPatient].resource 1..
* entry[KBVFORPatient].resource only KBV_PR_FOR_Patient
* entry[KBVFORPatient].search ..0
* entry[KBVFORPatient].request ..0
* entry[KBVFORPatient].response ..0

* entry[EEBPatient].link ..0
* entry[EEBPatient].resource 1..
* entry[EEBPatient].resource only EEBPatient
* entry[EEBPatient].search ..0
* entry[EEBPatient].request ..0
* entry[EEBPatient].response ..0

* entry[EEBCoverageEgk].link ..0
* entry[EEBCoverageEgk].resource 1..
* entry[EEBCoverageEgk].resource only EEBCoverageEgk
* entry[EEBCoverageEgk].search ..0
* entry[EEBCoverageEgk].request ..0
* entry[EEBCoverageEgk].response ..0

* entry[EEBCoverageEgkNoAddressLine].link ..0
* entry[EEBCoverageEgkNoAddressLine].resource 1..
* entry[EEBCoverageEgkNoAddressLine].resource only EEBCoverageEgkNoAddressLine
* entry[EEBCoverageEgkNoAddressLine].search ..0
* entry[EEBCoverageEgkNoAddressLine].request ..0
* entry[EEBCoverageEgkNoAddressLine].response ..0

* entry[EEBCoverageNoEgk].link ..0
* entry[EEBCoverageNoEgk].resource 1..
* entry[EEBCoverageNoEgk].resource only EEBCoverageNoEgk
* entry[EEBCoverageNoEgk].search ..0
* entry[EEBCoverageNoEgk].request ..0
* entry[EEBCoverageNoEgk].response ..0

* entry[EEBCoverageVSDM].link ..0
* entry[EEBCoverageVSDM].resource 1..
* entry[EEBCoverageVSDM].resource only EEBCoverageVSDM
* entry[EEBCoverageVSDM].search ..0
* entry[EEBCoverageVSDM].request ..0
* entry[EEBCoverageVSDM].response ..0



* obeys -eeb-angabePatientPLZ
* obeys -eeb-checkConditionCode49
* obeys -eeb-checkConditionOtherCodes
// version 2 constraints
* obeys -eeb-checkEebVersionCoverage
* obeys -eeb-checkEebVersionExtensions
* obeys -eeb-checkEebVersionKVNRclearing
* obeys -eeb-checkPatient
* obeys -eeb-checkResourceCount
* obeys -eeb-checkResponse

