Profile: EEBUnknownKBV_PR_FOR_Patient
Parent: KBV_PR_FOR_Patient
Id: eeb-unknown-KBV-PR-FOR-Patient
* ^url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* insert Meta
* name 1..1
* name[name].family 1..1
* name[name].given 1..1
* birthDate 1..1
* address[Strassenanschrift].postalCode 1..1


// Beispielgenerierung
Instance: EEBUnknownKBV_PR_FOR_PatientSample
InstanceOf: EEBUnknownKBV_PR_FOR_Patient
Title: "EEBUnknownKBV_PR_FOR_PatientSample"
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