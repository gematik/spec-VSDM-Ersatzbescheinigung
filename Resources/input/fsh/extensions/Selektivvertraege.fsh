Extension: Selektivvertraege
Id: selektivvertraege
* ^url = "https://gematik.de/fhir/eeb/StructureDefinition/Selektivvertraege"
* insert Meta
* ^context.type = #element
* ^context.expression = "Coverage"
* . ^short = "Selektivvertraege"
* url = "https://gematik.de/fhir/eeb/StructureDefinition/Selektivvertraege" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    aerztlich 1..1 and
    zahnaerztlich 1..1 and
    art 0..1
* extension[aerztlich] ^short = "Kennzeichen ärztlicher Selektivvertrag"
* extension[aerztlich] ^definition = "Gibt an, ob für den Versicheren ein ärztlicher Selektivvertrag vorliegt.\n1 = ärztlicher Selektivvertrag liegt vor\n0 = ärztlicher Selektivvertrag liegt nicht vor\n9 = ärztliches Selektivvertragskennzeichen wird nicht genutzt"
* extension[aerztlich].valueCode 1..
* extension[aerztlich].valueCode only code
* extension[aerztlich].valueCode obeys gkv-1
* extension[aerztlich].valueCode ^sliceName = "valueCode"
* extension[zahnaerztlich] ^short = "Kennzeichen zahnärztlicher Selektivvertrag"
* extension[zahnaerztlich] ^definition = "Gibt an, ob für den Versicheren ein ärztlicher Selektivvertrag vorliegt.\n1 = zahnärztlicher Selektivvertrag liegt vor\n0 = zahnärztlicher Selektivvertrag liegt nicht vor\n9 = zahnärztliches Selektivvertragskennzeichen wird nicht genutzt"
* extension[zahnaerztlich].valueCode 1..
* extension[zahnaerztlich].valueCode only code
* extension[zahnaerztlich].valueCode obeys gkv-2
* extension[zahnaerztlich].valueCode ^sliceName = "valueCode"
* extension[art] ^short = "Art des Selektivvertrages"
* extension[art] ^definition = "Die Angaben gelten für folgende Selektivverträge:\n1. Stelle: Hausarztzentrierte Versorgung (§73b)\n2. Stelle: Besondere ambulante ärztliche Versorgung (§73c)\n3. Stelle: Strukturierte Behandlungsprogramme (§137f)\n4. Stelle: Integrierte Versorgung (§140a) \n\nDie Stellen 1 und 3 koennen den Wert = 1 (true) nur annehmen, wenn Aerztlich\n= 1 (true) ist.\nDie Stellen 2 und 4 können sowohl zur Kennzeichnung ärztlicher als auch\nzahnärztlicher Selektivverträge genutzt werden.\nBeispiel: 1000\nEs liegt ein Selektivvertrag für die Hausarztzentrierte Versorgung nach §73b\nvor."
* extension[art].valueCode 1..
* extension[art].valueCode only code
* extension[art].valueCode obeys gkv-3
* extension[art].valueCode ^sliceName = "valueCode"

Invariant: gkv-1
Description: "Es sind nur die Werte \"0\" (ärztlicher Selektivvertrag liegt nicht vor), \"1\" (ärztlicher Selektivvertrag liegt vor) oder \"9\" (ärztliches Selektivvertragskennzeichen wird nicht genutzt) erlaubt."
Severity: #error
Expression: "matches('[019]')"

Invariant: gkv-2
Description: "Es sind nur die Werte \"0\" (zahnärztlicher Selektivvertrag liegt nicht vor), \"1\" (zahnärztlicher Selektivvertrag liegt vor) oder \"9\" (zahnärztliches Selektivvertragskennzeichen wird nicht genutzt) erlaubt."
Severity: #error
Expression: "matches('[019]')"

Invariant: gkv-3
Description: "Es sind nur vierstellige numerische Werte erlaubt"
Severity: #error
Expression: "matches('[0-1]{4}')"