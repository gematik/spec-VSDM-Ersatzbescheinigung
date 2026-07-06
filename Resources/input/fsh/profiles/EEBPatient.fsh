Profile: EEBPatient
Parent: TIPatient
Title: "Versicherter"
Description: "Angaben zum VSDM-Versicherten für die elektronische Ersatzbescheinigung"

* insert Meta
* meta 1..1
  * profile 1..1
  * profile = Canonical(EEBPatient) (exactly)

* . 
  * ^short = "Versicherter im VSDM"
  * ^definition = """
      Der EEBPatient bildet einen Versicherten ab.
      Der EEBPatient ist dem VSDMPatient nachempfunden, bis auf EdgeCases für die Elektronsiche Ersatzbescheinigung. 
    """

* identifier[KVNR] 0..1 // MS bereits durch TIPatient vorgegeben
  * ^short = "Versichertennummer (KVNR), optional sofern via eEB beauskunftbar"
  * ^definition = """
      Es wird der zehnstellig (unveränderliche) Teil der KVNR verwendet. 
      In bestimmten Sonderfällen kann keine KVNR beauskunftet werden.
    """

* birthDate // 1..1 MS bereits durch TIPatient vorgegeben
  * ^short = "Geburtsdatum"
  * ^definition = """
      Das Geburtsdatum des Versicherten ist in den VSD eine Pflichtangabe. 
      Partielle Datumsangaben sind allerdings zulässig.
    """
  * ^comment = """
      Hinweise insbesondere zur Angabe unvollständiger Datumswerte siehe [Geburtsdatum (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geburtsdatum).
    """

// Übernahme aus VSDM2 Patient
// Bildung aus den in der Folge spezifizierten Einzelwerten
* name[Name].text MS
  * ^short = "vollständiger zusammengesetzter Name"
  * ^definition = """
      Zur besseren Lesbarkeit sowie zur leichteren Verarbeitung für Systeme, die die einzelnen Namensbestandteile nicht getrennt benötigen, SOLL dieses Attribut den gesamten Namen mit Titel, Vorsatzwort und Namenszusätzen enthalten.
      Die Bildungsregel ist dabei [Titel] [Vornamen] [Namenszusätze] [Vorsatzworte] [Nachnamen].
    """
  * ^comment = """
      Hinweise und Beispiele siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil
    """

// Zuordnung aus Versichertendaten -> Versicherter -> Nachname, Vorsatzwort und Namenszusatz
* name[Name].family // 1..1 MS bereits durch TIPatient vorgegeben
  * ^comment = """
      Hinweise zur Bildung des gesamten Namenamens siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil
      Verwender müssen mindestens 87 Zeichen verarbeiten können.
    """
    // 45 Zeichen Nachname + 20 Zeichen Vorsatzwort + 20 Zeichen Namenszusatz + max. 2 Leerzeichen = 87 Zeichen

// Zuordnung aus Versichertendaten -> Versicherter -> Namenszusatz
* name[Name].family.extension[namenszusatz] // MS bereits durch TIPatient vorgegeben
  * ^comment = """
      Hinweise zum Umgang mit dieser Erweiterung siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil
      Eine Tabelle der gültigen Namenszusätze findet sich in Anlage 7 zur DEÜV, siehe www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp.
      Um die Verarbeitung ausländischer Namensangaben nicht zu verhindern, ist die Wertetabelle nur als "preferred binding" hinterlegt.
      Verwender müssen mindestens 20 Zeichen verarbeiten können.
    """
  * valueString from VSDMNamenszusatzVS (preferred)

// Zuordnung aus Versichertendaten -> Versicherter -> Nachname
* name[Name].family.extension[nachname] // MS bereits durch TIPatient vorgegeben
  * ^short = "Nachname ohne Vorsatzwort und Zusätze"
  * ^definition = """
      Diese Erweiterung kann den Nachnamen ohne Vorsatzworte und Zusätze aufnehmen.
      Wenn weder Vorsatzworte noch Namenszusätze existieren, kann die Erweiterung entfallen.
    """
  * ^comment = """
      Hinweise zum Umgang mit dieser Erweiterung siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil.
      Verwender müssen mindestens 45 Zeichen verarbeiten können.
    """

// Zuordnung aus Versichertendaten -> Versicherter -> Vorsatzwort
* name[Name].family.extension[vorsatzwort] // MS bereits durch TIPatient vorgegeben
  * ^short = "Vorsatzwort"
  * ^definition = """
      Vorsatzwort zum Nachnamen des Patienten (z.B. "van" in "Ludwig van Beethoven").
    """
  * ^comment = """
      Hinweise zum Umgang mit dieser Erweiterung siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil.
      Eine Tabelle der gültigen Vorsatzworte findet sich in Anlage 6 zur DEÜV, siehe www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp.
      Um die Verarbeitung ausländischer Namensangaben nicht zu verhindern, ist die Wertetabelle nur als "preferred binding" hinterlegt.
      Verwender müssen mindestens 20 Zeichen verarbeiten können.
    """
  * valueString from VSDMVorsatzwortVS (preferred)

// Zuordnung aus Versichertendaten -> Versicherter -> Vorname
* name[Name].given // 1..* MS bereits durch TIPatient vorgegeben
  * ^comment = """
      Mehrere Vornamen können durch Leerzeichen oder Bindestrich getrennt in einem Wert angegeben werden.
      Von der Wiederholung des given-Elemente SOLL kein Gebrauch gemacht werden; es wird zur besseren Interoperabilität allerdings nicht technisch verboten.
      Verwender müssen mindestens 45 Zeichen verarbeiten können.
    """

// Zuordnung aus Versichertendaten -> Versicherter -> Titel
* name[Name].prefix // MS bereits durch TIPatient vorgegeben
  * ^definition = """
      Namensteile vor dem Vornamen, z.B. akademischer Titel.
      Wenn dieses Attribut zur Angabe des akademischen Titels verwendet wird, ist die Erweiterung prefix-qualifier mit dem Wert AC (academic) verpflichtend anzugeben.
      Mehrere Titel werden durch Leerzeichen getrennt angegeben.
      Verwender müssen mindestens 20 Zeichen verarbeiten können.
    """
  * ^comment = """
      Beispiele zur Verwendung siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil.
    """
  * extension[prefix-qualifier] // MS bereits durch TIPatient vorgegeben
    * ^short = "Art des Namenspräfix"
    * ^definition = """
        Kodierte Angabe der Art des Namenspräfix zur technischen Unterscheidung zwischen verschieden Präfixen wie akademischem Titel.
        Achtung: Für das Vorsatzwort ist das Attribut family.extension[vorsatzwort] zu verwenden.
        Für akademische Titel ist verpflichtend die Kennzeichnung AC (academic) zu verwenden.
      """
    * ^comment = """
        Beispiele zur Verwendung siehe [Name (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Name) im deutschen Basisprofil.
      """

// Slicing der Telekommunikationsdaten
* telecom MS
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* telecom contains TIMessengerID 0..1 MS

// TI-Messenger-ID
* telecom[TIMessengerID] only VSDMContactPointTIM
  * ^comment = """
      Bis zur Schaffung einer entsprechenden Rechtsgrundlage wird die TI-Messenger-ID für GKV-Versicherte im VSDM 2.0 nicht genutzt.
    """

// Zuordnung aus Versichertendaten -> Versicherter -> Geschlecht
* gender // MS bereits durch TIPatient vorgegeben; zur Kardinalität siehe Invariante VSDMCoverageGKV-gender-1 in VSDMCoverageGKV
  * ^short = "Administrative Geschlechtsangabe (FHIR-Kodierung)"
  * ^definition = """
      Administrative Geschlechtsangabe gemäß den Unterlagen des Kostenträgers, kodiert nach FHIR-Standard.
    """
  * ^comment = """
      Hinweise zur Verwendung dieses Attributs und der Erweiterung siehe [Geschlecht (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geschlecht) im deutschen Basisprofil.
    """
  * extension[other-amtlich] MS
    * ^short = "Administrative Geschlechtsangabe (deutsche Kodierung)"
    * ^definition = """
        Administrative Geschlechtsangabe gemäß den Unterlagen des Kostenträgers, kodiert nach Wertetabelle zur Unterscheidung zwischen "divers" und "unbestimmt".
      """
    * ^comment = """
        Hinweise zur Verwendung dieses Attributs und der Erweiterung siehe [Geschlecht (Patient)](https://ig.fhir.de/basisprofile-de/stable/ig-markdown-Ressourcen-Patient.html#ig-markdown-Ressourcen-Patient-Geschlecht) im deutschen Basisprofil.
        Nur bei FHIR-Kodierung "other" zu verwenden (vgl. Constraint pat-de-1).
      """
    * valueCoding
      * system 1.. MS
      * system = $csGenderAmtlich (exactly)
      * version 1.. MS
      * version = "1.6.0" (exactly) // Version($csGenderAmtlich)
      * code 1.. MS


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