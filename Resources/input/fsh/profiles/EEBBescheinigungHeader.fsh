Profile: EEBBescheinigungHeader
Parent: MessageHeader
Id: EEBBescheinigungHeader
* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBBescheinigungHeader) (exactly)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    versionEEB named versionEEB 0..1 and
    servicePeriod named servicePeriod 0..1 and
    noAddressLine named noAddressLine 0..1 and
    KVNRinClearing named KVNRinClearing 0..1
* extension[versionEEB].value[x] 1..1
* extension[servicePeriod].value[x] 1..1
* extension[noAddressLine].value[x] 1..1
* extension[KVNRinClearing].value[x] 1..1

// hier OID Anfragender
* event[x] only Coding
* event[x] from EEBAnfrageUrsprungVS

* destination 0..0
* sender 0..0
* enterer 0..0
* author 0..0

* source.name 0..0
* source.software 0..0
* source.version 0..0
* source.contact 0..0
* source.endpoint 1..1
* source.endpoint ^short = "Source endpoint URI of sender. E.g. https://Test-Krankenkasse.de/KIM"

* responsible 0..0
* reason 0..0

* response 0..1
* response ^short = "If there is an EEBAnfrageBundle (eEBRequest aus der Praxis)), the Bundle.identifier is mandatory."
* response.identifier 1..1
* response.identifier ^short = "Identifier of EEBAnfrageBundle"
* response.identifier ^definition = "The Bundle.identifier of the EEBAnfrageBundle to which this message is a response."
* response.code = #ok (exactly)
* response.details 0..0
* definition 0..0


