Profile: EEBCoverageNoEgk
Parent: coverage-de-gkv
Id: EEBCoverageNoEgk
* insert Meta
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBCoverageNoEgk" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension[versichertenart] ^sliceName = "versichertenart"
* extension[versichertenart].value[x] 1..
* extension[wop] ^sliceName = "wop"
* extension[wop].value[x] 1..
* extension[besonderePersonengruppe] ^sliceName = "besonderePersonengruppe"
* extension[besonderePersonengruppe].value[x] 1..
* extension[dmpKennzeichen] ^sliceName = "dmpKennzeichen"
* extension[dmpKennzeichen].value[x] 1..
* extension[zuzahlungsstatus] ^sliceName = "zuzahlungsstatus"
* extension[zuzahlungsstatus].extension ^slicing.discriminator.type = #value
* extension[zuzahlungsstatus].extension ^slicing.discriminator.path = "url"
* extension[zuzahlungsstatus].extension ^slicing.rules = #open
* extension[zuzahlungsstatus].extension[status] ^sliceName = "status"
* extension[zuzahlungsstatus].extension[status].value[x] 1..
* identifier ..1
* identifier[KrankenversichertenID] 0..0
* identifier[pseudo-Krankenversichertennummer] 1..1
* status = #draft (exactly)
* period 1..
* period.start 1..
* period.end 1..
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension[abrechnendeIK] ^sliceName = "abrechnendeIK"
* payor.extension[abrechnendeIK].value[x] 1..
* payor.identifier 1..

