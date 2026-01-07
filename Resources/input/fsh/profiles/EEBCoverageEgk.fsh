Invariant: -eeb-angabeGeschuetzteVersichertendaten
Description: "Falls der Versicherungstyp GKV ist, müssen die geschützten Versichertendaten angegeben werden."
Severity: #error
Expression: "type.coding.code='GKV' implies extension('https://gematik.de/fhir/eeb/StructureDefinition/GeschuetzteVersichertendaten').exists()"


RuleSet: eebCoverageEgKSet
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $version-vsdm named versionEgk 1..1 and
    $versichertenart named versichertenart 0..0 and
    $kostenerstattung named kostenerstattung 0..0 and
    $wop named wop 0..0 and
    $besondere-personengruppe named besonderePersonengruppe 0..0 and
    $dmp-kennzeichen named dmpKennzeichen 0..0 and
    $ruhender-leistungsanspruch named ruhenderLeistungsanspruch 0..0 and
    $zuzahlungsstatus named zuzahlungsstatus 0..0 and
    PersoenlicheVersichertendaten named persoenlicheVersichertendaten 1..1 and
    AllgemeineVersicherungsdaten named allgemeineVersicherungsdaten 1..1 and
    GeschuetzteVersichertendaten named geschuetzteVersichertendaten 0..1 and
    $patient-genderIdentity named genderIdentity 0..0
* extension[versionEgk].valueString 1..1
* identifier 0..0
* status = #active (exactly)
* type 1..1
* type from $versicherungsart-de-basis (required)
* type ^short = "Versicherungsart"
* type ^definition = "Art der Versicherung: Selbstzahler, gesetzliche/private Versicherung, Berufsgenossenschaft oder Sozialamt"
* subscriber 0..0
* beneficiary only Reference($kbv-for-patient)
* beneficiary 1..1
* beneficiary.reference 1..1
* beneficiary.type 0..0
* beneficiary.identifier 0..0
* beneficiary.display 0..0
* dependent 0..0
* relationship 0..0
* period 1..1
* period.start 1..1
* period.end 1..1
* payor 1..1
* payor.extension ^slicing.discriminator.type = #value
* payor.extension ^slicing.discriminator.path = "url"
* payor.extension ^slicing.rules = #open
* payor.extension contains $AbrechnendeIK named abrechnendeIK 0..0
* payor.reference 0..0
* payor.type 0..0
* payor.identifier only $identifier-iknr
* payor.identifier 1..1
* payor.display 1..1
* class 0..0
* costToBeneficiary 0..0
* subrogation 0..0
* contract 0..0
* obeys -eeb-angabeGeschuetzteVersichertendaten


Profile: EEBCoverageEgk
Parent: coverage-de-basis
Id: EEBCoverageEgk
* insert Meta
* meta 1..1
  * profile = Canonical(EEBCoverageEgk) (exactly)
* insert eebCoverageEgKSet


// Beispielgenerierung
// PKV Patient with adress line, eEB triggered via App or queried with HBA-signature
Instance: KBV_PR_FOR_PatientEgkSampleHBAqueried
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle with address line"
Usage: #example
* id = "437f2555-2396-4c64-a656-e9553161ca3u"
* identifier[versichertenId].type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
* identifier[versichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId].value = "T024791905"
* name[name]
  * use = #official
  * family = "Königstein"
    * extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
    * extension[nachname].valueString = "Königstein"
  * given = "Ludger"
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


// PKV Patient with adress line, eEB triggered via App
Instance: KBV_PR_FOR_PatientEgkPkvSample
InstanceOf: KBV_PR_FOR_Patient
Title: "Patient for EEBBescheinigungBundle PKV details"
Usage: #inline
* id = "e36f9476-0d04-4394-a626-8b4706b005b0"
* identifier[versichertenId].type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
* identifier[versichertenId].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[versichertenId].value = "A987654321"
* name[name].use = #official
* name[name].family = "Meier"
* name[name].family.extension[nachname].url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* name[name].family.extension[nachname].valueString = "Meier"
* name[name].given = "Hans"
* birthDate = "1965-04-11"
* address[Strassenanschrift].type = #both
* address[Strassenanschrift].line = "Musterstraße 1"
* address[Strassenanschrift].line.extension[0][Hausnummer].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address[Strassenanschrift].line.extension[=][Hausnummer].valueString = "1"
* address[Strassenanschrift].line.extension[+][Strasse].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address[Strassenanschrift].line.extension[=][Strasse].valueString = "Musterstraße"
* address[Strassenanschrift].city = "Dortmund"
* address[Strassenanschrift].postalCode = "44227"
* address[Strassenanschrift].country = "D"


Instance: EEBCoverageEgkSample
InstanceOf: EEBCoverageEgk
Title:   "Coverage eGK for EEBBescheinigungBundle"
Usage: #inline
* id = "2d4da53a-413a-48fe-b908-2e67b576152u"
* extension[versionEgk].valueString = "5.2.0"
* extension[allgemeineVersicherungsdaten].valueBase64Binary = "H4sIAKnUU2QA/71S32+qMBT+V0jfpYDjTpdS4/RmMU5d5q5b9kI6OAIRDjdtdXf+9RZiFnDG3ae9QL7z9fuRnrLBvyK3diBVVmJAXNshFmBUxhkmAZksF51ez+93XJ9YSguMRV4iBOQDFBlw9mcUDvM8gQIyhFVlEqUgt5ioWGjAl9m9NRrPwtXvx+VkMQ+Ib3tVgIlEFZBU6783lL4r2zgInW3sGOha0J2Ki+pDd+Y84ezTWINsoCpGRelW7zm7hSRD5J7jOY7ruIweB2xaKlNESwFJJW7BDSAaE+563Sv/13WP0bN0W5QLwBikuSHg4xNFk2NzUQB/AqWtu+nKmkqBxnAjlAJGa44N3yREKdaa/+l5rNn/6Z70QtG2scFn1/O6VULvM1yXqgVMYmu9KKTmZnuno6YmPLYx/mGtf1488K5ZXvVn9NLJJvll0OxePzT6/evmBylH1Y4/AwAA"
* extension[persoenlicheVersichertendaten].valueBase64Binary = "H4sIAN/UU2QA/41RXY/TMBD8K5HfL05Cc3dBG5/gWkFFPxCFwltlkiWJsDfIdnrAD+e5m3JXWsQDL17PeHZ2NYa779ZEe3S+66kUaZyICKnq646aUsw366vb27y4SnMR+aCp1qYnLMUP9OJOwYf73Vtu7ZFMV7W4HW24uoCs5OPTchHdT5e77ezdZr5elSKPs3ECzyRfijaEb8+lfPBxg1aH7mtco/yi5d7XdjzknvVCwZmvu0C0m0/V+ySb3BRpkeQg/36D43qk4BV+HlzwvNVgVVo8y5PrLAN5QcO2d6QtqsVQN+jY7RHDSlft8fbmF3WND9gRyBPJ5r5qDVZtUMvR84RgE5z2HulF7ZAr79P7YLALP3VrVHY9yW5AXnCwdkHNuMWDHK+w4NQVfOxb8iwxmqNFxx+EagryXzTI3y2Ps9VLM1ikB2xAPlHwWg+eBms5z3QC8gyeRH92lk8hnsc7Kv/j+9UBL5cSPWECAAA="
* extension[geschuetzteVersichertendaten].valueBase64Binary = "H4sIABPVU2QA/4VP70vDMBD9V8p9X28TCptcMmSKDJwDh0P2ZYT2bMrSVJpr1f71S1FQUfDLu+Tu8X7Q8q12Sc9tqBqvYJZOIWGfN0XlSwXr3XYyn2eLySyDJIjxhXGNZwXvHGCp6XF1vOWQ245lEN6PKrnlVjgSIzxt7pLV9ea4v3nYrbf3CrL0YjSIlj4osCIvl4ivIS25NlKd0oLx2WAfinoE7CMfNB26wVjX+TLECNIFTbuPOSX8fBH+QWLHJ6n6WE5awyVruuJ2EBcz6gXh14cOxnrz/fZzEW1+a+H/5fUZUb40hF4BAAA="
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #GKV
* type.coding.display = "gesetzliche Krankenversicherung"
* period.start = "2022-04-01"
* period.end = "2027-07-31"
* beneficiary.reference =  "Patient/437f2555-2396-4c64-a656-e9553161ca3u"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "12345678"
* payor.display = "Test GKV Krankenkasse"


Instance: EEBCoverageEgkPkvSample
InstanceOf: EEBCoverageEgk
Title:   "Coverage PKV for EEBBescheinigungBundle"
Usage: #inline
* id = "d7fbdcd7-f220-4a11-8526-d846e4db2a82"
* extension[versionEgk].valueString = "5.2.0"
* extension[allgemeineVersicherungsdaten].valueBase64Binary = "H4sIACSWtmQA/71SXW+bQBD8K+jezQENqV0dZ7l2VFnEH6pTWvUFXWANyLBUd2c39a/3gawIHMvJU19As7MzO7pdNn6pSusAUhU1BsS1HWIBJnVaYBaQ+WY1GA790cD1iaW0wFSUNUJA/oEiY85+TONJWWZQQYEQNSZJDnKPmUqFBvy1eLSms0UcPXzfzFfLgPi21wwwI1EFJNf6zxdK/yrbOAhd7OwU6FbQg0qr5kMPpp9w9mqsQXZQM0Yl+V4fOfsKWYHIPcdzHNdxGT0XWFgrE0RLAVkj7sEdIBoTPvx879998ozqKt0XlQIwBWleCPjsQtHl2FJUwJ9AaWsdRlYoBRrDnVAKGG05NnmWkOTYaj6Sc3QO+r9z0htB+8YGX13P770S+ljgtlY98C2MeutFITU3e7gsdTXxOY3xj1v9z9WaOw6jzZ/RW51d8k2hm709NPr+dfMTAkWMED8DAAA="
* extension[persoenlicheVersichertendaten].valueBase64Binary = "H4sIAOXZU2QA/41R0Y7TMBD8lcjvjZuQ3LVo46q6IK7S5YqoKLxVJlkuEbGNvE45+Fl+pZujLS3igRc7M5mdHY1h8Wz6aI+eOmcLkcRTEaGtXdPZp0KsNuvJbJbPJ0kuIgraNrp3FgvxA0ksFHy4273jUYe27+oWt6MN3z4gK/n4VD1Ed2W12755v1mtHwuRx+m4gXdaKkQbwrfXUn6n+AmNDt3XuEH5Rcs9NWY85J71QsGFr79Cdrcq1XI+u73Js1dpAvLvf/ASzyp4i58HH4hTDUYl85t8miWsv6Jh67zVBtW9tsReRwSPum5fvirs0IM8Y3aluu2xboOqRrMzgk3wmgjtsvHINwdxFHrswk/d9irL0vQW5BUHax9U6Xwwg21AjggeuHEFH11riVW95lrR8+OgKkH+iwb5e+S4XlUDcWfE6BeCPLFwrweygzFcJ5dwgc6aP8HlqcLLckflfzy+OgDTCNF/XwIAAA=="
* status = #active
* type.coding.system = "http://fhir.de/CodeSystem/versicherungsart-de-basis"
* type.coding.code = #PKV
* type.coding.display = "private Krankenversicherung"
* period.start = "2022-04-01"
* period.end = "2022-04-01"
* beneficiary.reference =  "Patient/e36f9476-0d04-4394-a626-8b4706b005b0"
* payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* payor.identifier.value = "23456789"
* payor.display = "Test PKV Krankenkasse"