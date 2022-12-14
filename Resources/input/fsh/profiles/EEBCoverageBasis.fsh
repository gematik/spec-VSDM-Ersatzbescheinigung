Profile: EEBCoverageBasis
Parent: coverage-de-basis
Id: eeb-coverage-basis
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageBasis"
* insert Meta
* meta 1..1
* meta.profile 1..1
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $version-vsdm named versionEgk 0..1 and
    $versichertenart named versichertenart 0..1 and
    $kostenerstattung named kostenerstattung 0..1 and
    $wop named wop 0..1 and
    $besondere-personengruppe named besonderePersonengruppe 0..1 and
    $dmp-kennzeichen named dmpKennzeichen 0..1 and
    $ruhender-leistungsanspruch named ruhenderLeistungsanspruch 0..1 and
    $zuzahlungsstatus named zuzahlungsstatus 0..1 and
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 0..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 0..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 0..1 and
    $patient-genderIdentity named genderIdentity 0..1 and
    Selektivvertraege named selektivvertraege 0..1
* status = #active (exactly)
* type 1..1
* type from $versicherungsart-de-basis (required)
* type ^short = "Versicherungsart"
* type ^definition = "Art der Versicherung: Selbstzahler, gesetzliche/private Versicherung, Berufsgenossenschaft oder Sozialamt"
* beneficiary only Reference($kbv-for-patient)
* beneficiary 1..1
* beneficiary.reference 1..1
* period 1..1
* period.start 1..1
* period.end 1..1
* payor 1..1
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension contains $AbrechnendeIK named abrechnendeIK 0..1
* payor.identifier only $identifier-iknr
* payor.identifier 1..1
* payor.display 1..1