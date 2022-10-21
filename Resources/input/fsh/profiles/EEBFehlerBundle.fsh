Profile: EEBFehlerBundle
Parent: Bundle
Id: eeb-fehler-bundle
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehlerBundle"
* insert Meta
* identifier 1..
* identifier.system 1..
* identifier.system = "urn:ietf:rfc:3986" (exactly)
* identifier.value 1..
* identifier.value ^short = "Eindeutige UUID"
* type = #message (exactly)
* timestamp 1..
* entry 1..
* entry ^slicing.discriminator.type = #value
* entry ^slicing.discriminator.path = "resource.meta.profile"
* entry ^slicing.rules = #closed
* entry contains
    Header 1..1 and
    OperationOutcome 1..1
* entry[Header].link ^contentReference = "http://hl7.org/fhir/StructureDefinition/Bundle#Bundle.link"
* entry[Header].resource 1..
* entry[Header].resource only EEBFehlerHeader
* entry[OperationOutcome].link ^contentReference = "http://hl7.org/fhir/StructureDefinition/Bundle#Bundle.link"
* entry[OperationOutcome].resource only EEBFehler