Profile: EEBAnfrageHeader
Parent: MessageHeader
Id: EEBAnfrageHeader
* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBAnfrageHeader) (exactly)


* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Leistungsdatum named Leistungsdatum 1..1 and
    Einverstaendnis named Einverstaendnis 1..1 and
    Institutionskennzeichen named Institutionskennzeichen 1..1 and 
    versionEEB named versionEEB 0..1
* extension[Leistungsdatum].value[x] 1..1
* extension[Einverstaendnis].value[x] 1..1
* extension[Institutionskennzeichen].value[x] 1..1
* extension[versionEEB].value[x] 1..1

// hier OID Anfragender
* event[x] only Coding
* event[x] from EEBAnfrageUrsprungVS

* destination 0..0
* sender 1..1
* sender only Reference(KBV_PR_FOR_Organization)
* sender.reference 1..1
* sender.type 0..0
* sender.identifier 0..0
* sender.display 0..0
* enterer 0..0
* author 0..0
* source.name 0..0
* source.software 0..0
* source.version 0..0
* source.contact 0..0
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://pvs.de/KIM"
* responsible 0..0
* reason 0..0
* response 0..0
* definition 0..0

