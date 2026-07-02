Profile: EEBPatient
Parent: TIPatient
Title: "Versicherter"
Description: "Angaben zum VSDM-Versicherten für die elektronische Ersatzbescheinigung"

* insert Meta
* . 
  * ^short = "Versicherter im VSDM"
  * ^definition = """
      Der VSDMPatient bildet einen Versicherten im Versichertenstammdatenmanagement (VSDM) 2.0 ab.
      Der VSDMPatient ist vom zentralen TIPatient abgeleitet. 
      Der Ressource Server des VSDM stellt allerdings keinen FHIR Data Service im Sinne des Implementation Guide TI Common dar, so dass die meisten Anforderungen dieses IG auf den VSDMPatient nicht zutreffen.
      Dieser Sachverhalt wird in einer Folgeversion des IG klargestellt.
    """

// Zuordnung aus Versichertendaten -> Versicherter -> VersichertenID
* identifier[KVNR] 0..1 // MS bereits durch TIPatient vorgegeben
  * ^short = "Versichertennummer (KVNR), optional sofern via eEB beauskunftbar"
  * ^definition = """
      Es wird der zehnstellig (unveränderliche) Teil der KVNR verwendet. 
      In bestimmten Sonderfällen kann keine KVNR beauskunftet werden.
    """

// Zuordnung aus Versichertendaten -> Versicherter -> Geburtsdatum
* birthDate // 1..1 MS bereits durch TIPatient vorgegeben
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