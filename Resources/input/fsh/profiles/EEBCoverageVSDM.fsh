Profile: EEBCoverageVSDM
Parent: VSDMCoverageGKVBase
Id: EEBCoverageVSDM
* insert Meta
* meta 1..1
  * profile = Canonical(EEBCoverageVSDM) (exactly)
* period ^short = "Seit wann besteht Versicherungsanspruch"
* period 1..1
* period.start 1..1
* payor 2..2
  * ^definition = """
      Gibt den gesetzlichen Kostenträger des Versicherten an.
      Der Haupt-Kostenträger ist verpflichtend in der ersten Position anzugeben.
      Ein abrechnender Kostenträger wird als zweite Referenz angegeben.
    """
  * ^comment = """
      Zur Kompatibilität mit den etablierten Profilen (z.B. ISIK) werden neben der Referenz innerhalb des Bundles auch der Identifier und der Name in der Referenz hinterlegt.
    """
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension contains $AbrechnendeIK named abrechnendeIK 0..0
* payor.reference 0..0
* payor.type 0..0
* payor.identifier only $identifier-iknr
* payor.identifier 1..1
* payor.display 1..1