Profile: EEBCoverageEgk
Parent: coverage-de-gkv
Id: eeb-coverage-egk
* ^status = #draft
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[versionEgk] ^sliceName = "versionEgk"
* extension[versionEgk].value[x] 1..
* extension contains
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 1..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 1..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 1..1
* extension[persoenlicheVersichertendaten] ^isModifier = false
* extension[persoenlicheVersichertendaten].value[x] 1..
* extension[allgemeineVersicherungsdaten] ^isModifier = false
* extension[allgemeineVersicherungsdaten].value[x] 1..
* extension[geschuetzteVersichertendaten] ^isModifier = false
* extension[geschuetzteVersichertendaten].value[x] 1..
* identifier[KrankenversichertenID] 1..1
* identifier[pseudo-Krankenversichertennummer] 0..0
* status = #active (exactly)
* period 1..
* period.start 1..
* period.end 1..
* payor.identifier 1..