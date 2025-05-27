Profile: EEBCoverageNoEgk
Parent: coverage-de-basis
Id: EEBCoverageNoEgk
* insert Meta
* meta 1..1
  * profile = Canonical(EEBCoverageNoEgk) (exactly)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $versichertenart named versichertenart 1..1 and
    $wop named wop 1..1 and
    $besondere-personengruppe named besonderePersonengruppe 1..1 and
    $zuzahlungsstatus named zuzahlungsstatus 1..1
* identifier 0..0
* status = #active (exactly)
* type 1..1
* type from $versicherungsart-de-basis (required)
* type ^short = "Versicherungsart"
* type ^definition = "Art der Versicherung: Selbstzahler, gesetzliche/private Versicherung, Berufsgenossenschaft oder Sozialamt"
* subscriber 0..0
* beneficiary only Reference($kbv-for-patient)
* beneficiary 1..1
* beneficiary.reference 1..1
* beneficiary.type 0..0
* beneficiary.identifier 0..0
* beneficiary.display 0..0
* dependent 0..0
* relationship 0..0
* period 1..1
* period.start 1..1
* period.end 1..1
* payor 1..1
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension contains $AbrechnendeIK named abrechnendeIK 1..1
* payor.reference 0..0
* payor.type 0..0
* payor.identifier only $identifier-iknr
* payor.identifier 1..1
* payor.display 1..1
* class 0..0
* costToBeneficiary 0..0
* subrogation 0..0
* contract 0..0


// Beispielgenerierung
Instance: KBV_PR_FOR_PatientNoEgkSample
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle"
Usage: #example
* id = "d62d9d82-2396-4c64-a656-2e67b5761523"
* name[name]
  * use = #official
  * family = "Meier"
    * extension[nachname].valueString = "Meier"
  * given = "Max"
* birthDate = "1970-04-11"
* address[Strassenanschrift]
  * type = #both
  * line = "Teststrasse 2"
  * line.extension[Hausnummer].valueString = "2"
  * line.extension[Strasse].valueString = "Teststrasse"
  * city = "Dortmund"
  * postalCode = "44227"
  * country = "D"


Instance: EEBCoverageNoEgkSample
InstanceOf: EEBCoverageNoEgk
Title:   "Coverage for EEBBescheinigungBundle"
Usage: #example
* id = "e9553161ca3c-413a-48fe-b908-04159be709fb"
* extension[versichertenart].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS"
* extension[versichertenart].valueCoding.code = #1

* extension[wop].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP"
* extension[wop].valueCoding.code = #38
* extension[wop].valueCoding.display = "Nordrhein"

* extension[besonderePersonengruppe].valueCoding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE"
* extension[besonderePersonengruppe].valueCoding.code = #06
* extension[besonderePersonengruppe].valueCoding.display = "BVG" // (Gesetz über die Versorgung der Opfer des Krieges)

* extension[zuzahlungsstatus].extension[status].url = "status"
* extension[zuzahlungsstatus].extension[status].valueBoolean = true
* extension[zuzahlungsstatus].extension[gueltigBis].url = "gueltigBis"
* extension[zuzahlungsstatus].extension[gueltigBis].valueDate = "2020-12-31"

* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* period.start = "2022-04-01"
* period.end = "2022-07-31"
* beneficiary.reference =  "Patient/d62d9d82-2396-4c64-a656-2e67b5761523"
* payor
  * extension[abrechnendeIK].valueIdentifier.system = "http://fhir.de/sid/arge-ik/iknr"
  * extension[abrechnendeIK].valueIdentifier.value = "756756324"
  * identifier
    * system = "http://fhir.de/sid/arge-ik/iknr"
    * value = "12345678"
  * display = "Test Krankenkasse"