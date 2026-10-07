Invariant: -eeb-angabeGeschuetzteVersichertendaten
Description: "Falls der Versicherungstyp GKV ist, müssen die geschützten Versichertendaten angegeben werden."
Severity: #error
Expression: "type.coding.code='GKV' implies extension('https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten').exists()"


RuleSet: eebCoverageEgKSet
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $version-vsdm named versionEgk 1..1 and
    $versichertenart named versichertenart 0..0 and
    $kostenerstattung named kostenerstattung 0..0 and
    $wop named wop 0..0 and
    $besondere-personengruppe named besonderePersonengruppe 0..0 and
    $dmp-kennzeichen named dmpKennzeichen 0..0 and
    $ruhender-leistungsanspruch named ruhenderLeistungsanspruch 0..0 and
    $zuzahlungsstatus named zuzahlungsstatus 0..0 and
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 1..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 1..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 0..1 and
    $patient-genderIdentity named genderIdentity 0..0
* extension[versionEgk].valueString 1..1
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
* payor.extension contains $AbrechnendeIK named abrechnendeIK 0..0
* payor.reference 0..0
* payor.type 0..0
* payor.identifier only $identifier-iknr
* payor.identifier 1..1
* payor.display 1..1
* class 0..0
* costToBeneficiary 0..0
* subrogation 0..0
* contract 0..0
* obeys -eeb-angabeGeschuetzteVersichertendaten


Profile: EEBCoverageEgk
Parent: coverage-de-basis
Id: EEBCoverageEgk
* insert Meta
* meta 1..1
  * profile = Canonical(EEBCoverageEgk) (exactly)
* insert eebCoverageEgKSet


