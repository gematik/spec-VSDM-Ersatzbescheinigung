Profile: EEBFehler
Parent: OperationOutcome
Id: eeb-fehler
// Operation Outcome analog zu https://fhir.kbv.de/StructureDefinition/KBV_PR_EAU_health_insurance_Practitioner|1.1.0 und Verwendung der EEB-spezifischen ErrorCodes
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehler"
* insert Meta
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehler" (exactly)
* issue ..1 MS
* issue.extension ^slicing.discriminator.type = #value
* issue.extension ^slicing.discriminator.path = "url"
* issue.extension ^slicing.rules = #closed
* issue.extension contains EEBOperationOutcomeIssueIdentifier named Identifier 1..1 MS
* issue.severity = #fatal (exactly)
* issue.severity
* issue.severity ^definition = "Angabe der Fehlerkategorie"
* issue.code MS
* issue.details 1..
* issue.details ^definition = "nähere Beschreibung des Fehlers"
* issue.details.coding 1..1
* issue.details.coding from EEBErrorcodeVS (required)
* issue.details.coding.system 1..
* issue.details.coding.version ..0
* issue.details.coding.code 1..
* issue.details.coding.code ^short = "Errorcode"
* issue.details.coding.code ^definition = "Errorcode"
* issue.details.coding.display 1..
* issue.details.coding.display ^short = "Errortext"
* issue.details.coding.userSelected ..0
* issue.details.text ..0
* issue.diagnostics ..0
* issue.location ..0
* issue.expression ..0


// Beispielgenerierung
Instance: EEBFehlerSampleMessage
InstanceOf: EEBFehler
Title:   "eEB Fehlermeldung"
Usage: #example
* id = "3f624395-be34-4fac-9773-d735cb3a1f73"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehler"
* issue.extension[EEBOperationOutcomeIssueIdentifier].url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBOperationOutcomeIssueIdentifier"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Message-ID].valueIdentifier.system = "https://gematik.de/fhir/eeb/StructureDefinition/Message_ID_KIM"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Message-ID].valueIdentifier.value = "96d6a790-afc2-4556-ab73-301e51a7bf30@kim.de"
* issue.severity = #fatal
* issue.code = #processing
* issue.details = https://gematik.de/fhir/eeb/CodeSystem/EEBErrorcodeCS#101 "Die übermittelte eEB entspricht nicht den Vorgaben und/oder ist nicht lesbar."

Instance: EEBFehlerSampleBundle
InstanceOf: EEBFehler
Title:   "eEB Fehlermeldung"
Usage: #example
* id = "bbd0690c-6939-4c90-979c-9ab9b1ed1552"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehler"
* issue.extension[EEBOperationOutcomeIssueIdentifier].url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBOperationOutcomeIssueIdentifier"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Bundle-Identifier].valueIdentifier.system = "urn:ietf:rfc:3986"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Bundle-Identifier].valueIdentifier.value = "urn:uuid:79939e34-c5cc-4da6-ba55-f4bd85832760"
* issue.severity = #fatal
* issue.code = #processing
* issue.details = https://gematik.de/fhir/eeb/CodeSystem/EEBErrorcodeCS#100 "Der Patient ist nicht bei der adressierten Krankenkasse versichert."
