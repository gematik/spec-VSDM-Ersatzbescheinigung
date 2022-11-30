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
* issue.extension[Identifier].extension ^slicing.discriminator.type = #value
* issue.extension[Identifier].extension ^slicing.discriminator.path = "url"
* issue.extension[Identifier].extension ^slicing.rules = #closed
* issue.extension[Identifier].extension ^min = 0
* issue.extension[Identifier].extension[Bundle-Identifier] ^sliceName = "Bundle-Identifier"
* issue.extension[Identifier].extension[Bundle-Identifier] ^min = 0
* issue.extension[Identifier].extension[Bundle-Identifier] ^mustSupport = true
* issue.extension[Identifier].extension[Bundle-Identifier].value[x] MS
* issue.extension[Identifier].extension[Bundle-Identifier].valueIdentifier MS
* issue.extension[Identifier].extension[Bundle-Identifier].valueIdentifier ^sliceName = "valueIdentifier"
* issue.extension[Identifier].extension[Bundle-Identifier].valueIdentifier.system MS
* issue.extension[Identifier].extension[Bundle-Identifier].valueIdentifier.value MS
* issue.extension[Identifier].extension[Message-ID] ^sliceName = "Message-ID"
* issue.extension[Identifier].extension[Message-ID] ^min = 0
* issue.extension[Identifier].extension[Message-ID] ^mustSupport = true
* issue.extension[Identifier].extension[Message-ID].value[x] MS
* issue.extension[Identifier].extension[Message-ID].valueIdentifier MS
* issue.extension[Identifier].extension[Message-ID].valueIdentifier ^sliceName = "valueIdentifier"
* issue.extension[Identifier].extension[Message-ID].valueIdentifier.system MS
* issue.extension[Identifier].extension[Message-ID].valueIdentifier.value MS
* issue.severity = #fatal (exactly)
* issue.severity MS
* issue.severity ^definition = "Angabe der Fehlerkategorie"
* issue.code MS
* issue.details 1.. MS
* issue.details ^definition = "nähere Beschreibung des Fehlers"
* issue.details.coding 1..1 MS
* issue.details.coding from EEBErrorcodeVS (required)
* issue.details.coding.system 1.. MS
* issue.details.coding.version ..0
* issue.details.coding.code 1.. MS
* issue.details.coding.code ^short = "Errorcode"
* issue.details.coding.code ^definition = "Errorcode"
* issue.details.coding.display 1.. MS
* issue.details.coding.display ^short = "Errortext"
* issue.details.coding.userSelected ..0
* issue.details.text ..0
* issue.diagnostics ..0
* issue.location ..0
* issue.expression ..0


// Beispielgenerierung
Instance: EEBFehlerSample
InstanceOf: EEBFehler
Title:   "Fehler for EEBFehlerBundle"
Usage: #example
* id = "3f624395-be34-4fac-9773-d735cb3a1f73"
* meta.profile = "https://gematik.de/fhir/eeb/StructureDefinition/EEBFehler"
* issue.extension[EEBOperationOutcomeIssueIdentifier].url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBOperationOutcomeIssueIdentifier"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Message-ID].url = "Message-ID"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Message-ID].valueIdentifier.system = "https://gematik.de/fhir/eeb/StructureDefinition/Message_ID_KIM"
* issue.extension[EEBOperationOutcomeIssueIdentifier].extension[Message-ID].valueIdentifier.value = "96d6a790-afc2-4556-ab73-301e51a7bf30@kim.de"
* issue.severity = #fatal
* issue.code = #processing
* issue.details = https://gematik.de/fhir/eeb/CodeSystem/EEBErrorcodeCS#1010 "Unbekannte Person"
