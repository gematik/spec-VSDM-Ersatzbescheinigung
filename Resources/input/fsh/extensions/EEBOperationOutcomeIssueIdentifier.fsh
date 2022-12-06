Extension: EEBOperationOutcomeIssueIdentifier
Id: eeb-operation-outcome-issue-identifier
// OperationOutcomeIdentifier analog zu https://simplifier.net/EAU/KBVEXEAUhealthinsurancePractitionerIdentifier und Verwendung der EEB-spezifischen ErrorCodes
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/EEBOperationOutcomeIssueIdentifier"
* insert Meta
* ^context.type = #element
* ^context.expression = "OperationOutcome.issue"
* . ^definition = "Diese Extension dient dazu, die Bundle-Identifier der Nachricht abzubilden, welche den Fehler verursacht hat."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension ^min = 0
* extension contains
    Bundle-Identifier 0..1 and
    Message-ID 0..1
* extension[Bundle-Identifier] ^short = "Bundle-Identifier"
* extension[Bundle-Identifier] ^definition = "Repräsentiert den Bundle-Identifier einer eEB-Anfrage"
* extension[Bundle-Identifier].value[x] 1..
* extension[Bundle-Identifier].value[x] only Identifier
* extension[Bundle-Identifier].valueIdentifier.use ..0
* extension[Bundle-Identifier].valueIdentifier.type ..0
* extension[Bundle-Identifier].valueIdentifier.system 1..
* extension[Bundle-Identifier].valueIdentifier.system = "urn:ietf:rfc:3986" (exactly)
* extension[Bundle-Identifier].valueIdentifier.value 1..
* extension[Bundle-Identifier].valueIdentifier.period ..0
* extension[Bundle-Identifier].valueIdentifier.assigner ..0
* extension[Message-ID] ^short = "Message-ID"
* extension[Message-ID] ^definition = "Hier wird die Message-ID der KIM-Nachricht abgebildet."
* extension[Message-ID].value[x] 1..
* extension[Message-ID].value[x] only Identifier
* extension[Message-ID].valueIdentifier.use ..0
* extension[Message-ID].valueIdentifier.type ..0
* extension[Message-ID].valueIdentifier.system 1..
* extension[Message-ID].valueIdentifier.system = "https://gematik.de/fhir/eeb/StructureDefinition/Message_ID_KIM" (exactly)
* extension[Message-ID].valueIdentifier.value 1..
* extension[Message-ID].valueIdentifier.period ..0
* extension[Message-ID].valueIdentifier.assigner ..0