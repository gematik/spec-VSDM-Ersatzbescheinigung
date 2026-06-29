Profile: EEBCoverageVSDM
Parent: VSDMCoverageGKVBase
Id: EEBCoverageVSDM
* insert Meta
* meta 1..1
  * profile = Canonical(EEBCoverageVSDM) (exactly)
* period ^short = "Seit wann besteht Versicherungsanspruch"
* period 1..1
* period.start 1..1
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