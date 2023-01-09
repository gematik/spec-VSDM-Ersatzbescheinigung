Profile: EEBKBV_PR_FOR_Organization
Parent: KBV_PR_FOR_Organization
Id: eeb-KBV-PR-FOR-Organization
* ^url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
* insert Meta
* obeys Organization-for-EEBAnfrageBundle-1
* identifier[Telematik-ID] 1..1

Invariant: Organization-for-EEBAnfrageBundle-1
Description: "Identifier muss die Telematik-ID und entweder das Institutionskennzeichen, die Betriebsstaettennummer oder die KZV-Abrechnungsnummer sein."
Severity: #error
Expression: "identifier.where(type.coding.code='PRN').exists() and (identifier.where(type.coding.code='BSNR').exists() or identifier.where(type.coding.code='XX').exists() or identifier.where(type.coding.code='KZVA').exists())"


// Beispielgenerierung
Instance: EEBKBV_PR_FOR_OrganizationSample
InstanceOf: EEBKBV_PR_FOR_Organization
Title: "Organization for EEBAnfrageBundle"
Usage: #example
* id = "fad15347-a4b3-4899-a454-9fb43bdb0f30"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
* identifier[Telematik-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[Telematik-ID].system = "https://gematik.de/fhir/sid/telematik-id"
* identifier[Telematik-ID].value = "123456"
* identifier[Betriebsstaettennummer].type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* identifier[Betriebsstaettennummer].system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* identifier[Betriebsstaettennummer].value = "123456789"
// To test invariant
// * identifier[Standortnummer].type = https://fhir.kbv.de/CodeSystem/KBV_CS_Base_identifier_type#KSN
// * identifier[Standortnummer].system = "http://fhir.de/sid/dkgev/standortnummer"
// * identifier[Standortnummer].value = "123456789"
* name = "Praxis Test"
* telecom[telefon].system = #phone
* telecom[telefon].value = "0123456789"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Testweg 10"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "10"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Testweg"
* address[Strassenanschrift].city = "Berlin"
* address[Strassenanschrift].postalCode = "10115"
* address[Strassenanschrift].country = "D"