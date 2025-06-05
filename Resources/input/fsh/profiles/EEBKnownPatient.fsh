Profile: EEBKnownPatient
Parent: Patient
Id: EEBKnownPatient
* insert Meta

* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBKnownPatient) (exactly)

* identifier 1..1 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #closed
* identifier contains
    versichertenId_GKV 0..1 and
    versichertenID_pkv 0..1
* identifier[versichertenId_GKV] only $identifier-kvid-10
* identifier[versichertenId_GKV].system
* identifier[versichertenId_GKV].value
* identifier[versichertenID_pkv] only $identifier-pkv
* identifier[versichertenID_pkv].system
* identifier[versichertenID_pkv].value
// below for new dependencies
//  KVNR 1..1 MS
//* identifier[KVNR] only IdentifierKvid10

* active 0..0
* name 0..0
* telecom 0..0
* gender 0..0
* birthDate 0..0
* deceased[x] 0..0
* address 0..0
* maritalStatus 0..0
* multipleBirth[x] 0..0
* photo 0..0
* contact 0..0
* communication 0..0
* generalPractitioner 0..0
* managingOrganization 0..0
* link 0..0


// Beispielgenerierung
Instance: EEBKnownPatientSample
InstanceOf: EEBKnownPatient
Title: "EEBKnownPatient"
Usage: #example
* id = "b8f0f69c-af1a-480b-8abf-44ab11aa23c5"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
// below for new dependencies
//* identifier[KVNR].type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
//* identifier[KVNR].system = $sid-identifier-kvid-10
* identifier[versichertenId_GKV].value = "T024791905"

Instance: EEBKnownPatientPkvSample
InstanceOf: EEBKnownPatient
Title: "EEBKnownPatientPkv"
Usage: #example
* id = "4149fdf9-2417-4a58-ac02-3473f5eb5431"
* identifier[versichertenID_pkv].type = http://fhir.de/CodeSystem/identifier-type-de-basis#PKV
* identifier[versichertenID_pkv].system = "http://fhir.de/sid/pkv/kvid-10"
// below for new dependencies
//* identifier[KVNR].type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
//* identifier[KVNR].system = $sid-identifier-kvid-10
* identifier[versichertenID_pkv].value = "A987654321"