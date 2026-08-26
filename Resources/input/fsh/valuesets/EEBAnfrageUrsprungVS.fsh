ValueSet: EEBAnfrageUrsprungVS
Id: EEBAnfrageUrsprungVS
Title: "ValueSet of eEB Message Header Events"
Description: "eEB Message Header Event codes of request orgin"
* ^url = "https://gematik.de/fhir/eeb/ValueSet/EEBAnfrageUrsprungVS"
* insert Meta
//* include codes from system $system-practitionerProfessionOID-code
//* include codes from system $system-organizationProfessionOID-code

* include $system-practitionerProfessionOID-code#1.2.276.0.76.4.30 "Ärztin/Arzt"
* include $system-practitionerProfessionOID-code#1.2.276.0.76.4.31 "Zahnärztin/Zahnarzt"
* include $system-practitionerProfessionOID-code#1.2.276.0.76.4.45 "Psychotherapeut/-in"
* include $system-practitionerProfessionOID-code#1.2.276.0.76.4.46 "Psychologische/-r Psychotherapeut/-in"
* include $system-practitionerProfessionOID-code#1.2.276.0.76.4.47 "Kinder- und Jugendlichenpsychotherapeut/-in"
* include $system-practitionerProfessionOID-code#1.2.276.0.76.4.49 "Versicherte/-r"

* include $system-organizationProfessionOID-code#1.2.276.0.76.4.50 "Betriebsstätte Arzt"
* include $system-organizationProfessionOID-code#1.2.276.0.76.4.51 "Zahnarztpraxis"
* include $system-organizationProfessionOID-code#1.2.276.0.76.4.52 "Betriebsstätte Psychotherapeut"
* include $system-organizationProfessionOID-code#1.2.276.0.76.4.53 "Krankenhaus"
* include $system-organizationProfessionOID-code#1.2.276.0.76.4.57 "Betriebsstätte Mobile Einrichtung Rettungsdienst"