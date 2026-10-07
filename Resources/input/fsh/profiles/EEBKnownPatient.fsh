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
    KVNR 1..1 MS
* identifier[KVNR] only IdentifierKvid10

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


