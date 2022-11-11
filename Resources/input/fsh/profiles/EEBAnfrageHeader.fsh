Profile: EEBAnfrageHeader
Parent: MessageHeader
Id: eeb-anfrage-header
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBAnfrageHeader"
* insert Meta
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Leistungsdatum named Leistungsdatum 1..1 and
    Einverstaendnis named Einverstaendnis 1..1
* extension[Leistungsdatum].value[x] 1..
* extension[Einverstaendnis].value[x] 1..
* event[x] only uri
* event[x] = "https://gematik.de/fhir/eeb/EEBAnfrage" (exactly)
* sender 1..
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..
* source.endpoint = "https://ehex.de/KIM" (exactly)
