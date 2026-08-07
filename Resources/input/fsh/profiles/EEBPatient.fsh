Profile: EEBPatient
Parent: VSDMPatientBase
Title: "Versicherter"
Description: "Angaben zum VSDM-Versicherten für die elektronische Ersatzbescheinigung. Zur Nutzung bei VSDM2-Bescheinigung und Anfragen nach VSDM2-Bescheinigungen"

* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBPatient) (exactly)

* . 
  * ^short = "Versicherter im VSDM"
  * ^definition = """
      Der EEBPatient bildet einen Versicherten ab.
      Der EEBPatient ist dem VSDMPatient nachempfunden, bis auf EdgeCases für die Elektronische Ersatzbescheinigung. 
    """

* identifier[KVNR] 0..1 // MS bereits vorgegeben
  * ^short = "Versichertennummer (KVNR), optional sofern via eEB beauskunftbar"
  * ^definition = """
      Es wird der zehnstellig (unveränderliche) Teil der KVNR verwendet. 
      In bestimmten Sonderfällen kann keine KVNR beauskunftet werden.
    """

* birthDate // 1..1 MS bereits durch VSDMPatientBase vorgegeben
  * ^short = "Geburtsdatum"
  * ^definition = """
      Das Geburtsdatum des Versicherten ist in den VSD eine Pflichtangabe. 
      Partielle Datumsangaben sind allerdings zulässig.
    """
  * ^comment = """
      Hinweise insbesondere zur Angabe unvollständiger Datumswerte siehe [Geburtsdatum (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geburtsdatum).
    """


// Beispiel GKV Edge-Case (ohne KVNR)
Instance: EEBPatientGkvNoKvnrExample
InstanceOf: EEBPatient
Title: "EEBPatient GKV Case ohne KVNR"
Usage: #example
* id = "1f6f2df3-d9f4-4e34-9c76-3b8337b7a09c"
* name.use = #official
* name.family = "Haselnuss"
* name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name.family.extension.valueString = "Haselnuss"
* name.given = "Eileen"
* birthDate = "1993-08-13"
* address.type = #both
* address.country.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address.country.extension[=].valueCoding.system = "http://fhir.de/CodeSystem/deuev/anlage-8-laenderkennzeichen"
* address.country.extension[=].valueCoding.code = #D
* address.country = "DE"
* address.city = "Berlin"
* address.postalCode = "10623"