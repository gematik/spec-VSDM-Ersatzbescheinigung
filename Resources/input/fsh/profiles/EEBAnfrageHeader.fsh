Profile: EEBAnfrageHeader
Parent: MessageHeader
Id: eeb-anfrage-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader"
* ^version = "1.0"
* ^status = #draft
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Leistungsdatum named Leistungsdatum 1..1 MS and
    Einverstaendnis named Einverstaendnis 1..1 MS
* extension[Leistungsdatum].value[x] 1.. MS
* extension[Einverstaendnis].value[x] 1.. MS
* event[x] only uri
* event[x] = "https://gematik.de/fhir/eeb/EEBAnfrage" (exactly)
* sender 1.. MS
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1.. MS
* source.endpoint = "https://ehex.de/KIM" (exactly)