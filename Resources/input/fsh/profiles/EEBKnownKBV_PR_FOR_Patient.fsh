Profile: EEBKnownKBV_PR_FOR_Patient
Parent: KBV_PR_FOR_Patient
Id: eeb-known-KBV-PR-FOR-Patient
* ^url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* insert Meta
* identifier 1..1
* identifier[versichertenId_GKV] 0..1
* identifier[versichertennummer_kvk] 0..0
* identifier[versichertenID_pkv] 0..1


// Beispielgenerierung
Instance: EEBKnownKBV_PR_FOR_PatientSample
InstanceOf: EEBKnownKBV_PR_FOR_Patient
Title: "EEBKnownKBV_PR_FOR_PatientSample"
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
* address[Strassenanschrift].line = "Blumenweg 14"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "14"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Blumenweg"
* address[Strassenanschrift].city = "Esens"
* address[Strassenanschrift].postalCode = "26427"
* address[Strassenanschrift].country = "D"