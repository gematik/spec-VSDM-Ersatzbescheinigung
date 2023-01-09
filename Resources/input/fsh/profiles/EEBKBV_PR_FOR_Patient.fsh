Profile: EEBKBV_PR_FOR_Patient
Parent: KBV_PR_FOR_Patient
Id: eeb-KBV-PR-FOR-Patient
* ^url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* insert Meta
* obeys Patient-for-EEBAnfrageBundle-1

Invariant: Patient-for-EEBAnfrageBundle-1
Description: "Identifier (GKV oder PKV) oder (Name, Vorname, Geburtsdatum und Postleitzahl) müssen existieren."
Severity: #error
Expression: "((identifier.system='http://fhir.de/sid/gkv/kvid-10' or identifier.system='http://fhir.de/sid/pkv/kvid-10') or (name.family and name.given and birthDate and address.postalCode))"


// Beispielgenerierung
Instance: EEBKBV_PR_FOR_PatientKnownSample
InstanceOf: EEBKBV_PR_FOR_Patient
Title: "EEBKBV_PR_FOR_PatientKnownSample"
Usage: #example
* id = "eb601b0c-96cd-4ac8-8849-fdd7aca89c33"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* identifier[versichertenId_GKV].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[versichertenId_GKV].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId_GKV].value = "A123456789"
* name[name].use = #official
* name[name].family = "Königstein"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Königstein"
* name[name].given = "Ludger"
* birthDate = "1935-06-22"
* address[Strassenanschrift].type = #both
// * address[Strassenanschrift].line = "Blumenweg 14"
// * address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
// * address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "14"
// * address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
// * address[Strassenanschrift].line.extension[=][Strasse].valueString = "Blumenweg"
// * address[Strassenanschrift].city = "Esens"
// * address[Strassenanschrift].postalCode = "26427"
// * address[Strassenanschrift].country = "D"

Instance: EEBKBV_PR_FOR_PatientUnknownSample
InstanceOf: EEBKBV_PR_FOR_Patient
Title: "EEBKBV_PR_FOR_PatientUnknownSample"
Usage: #example
* id = "16c07b55-c7bd-4e64-86bc-bf00f0435ba7"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* name[name].use = #official
* name[name].family = "Meier"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Meier"
* name[name].given = "Max"
* birthDate = "1970-04-11"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Teststrasse 2"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "2"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Teststrasse"
* address[Strassenanschrift].city = "Dortmund"
* address[Strassenanschrift].postalCode = "44227"
* address[Strassenanschrift].country = "D"