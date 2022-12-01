CodeSystem: EEBErrorcodeCS
Id: EEBErrorcodeCS
Title: "CodeSystem für eEB Fehler"
Description: "eEB Fehler falls die Krankenkasse keine Ersatzbescheinigung ausstellen kann"
* ^url = "https://gematik.de/fhir/eeb/CodeSystem/EEBErrorcodeCS"
* ^version = "1.0"
* ^status = #draft
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"
* ^caseSensitive = true
* ^content = #complete
* #100 "Der Patient ist nicht bei der adressierten Krankenkasse versichert."
* #101 "Die übermittelte eEB entspricht nicht den Vorgaben und/oder ist nicht lesbar."
* #110 "Der Patient ist nicht eindeutig identifizierbar."
* #111 "Das angefragte Leistungsdatum ist unplausibel."
* #112 "Es liegt für den Patienten kein gültiges Versichertenverhältnis zum angefragten Leistungsdatum vor."
* #120 "Die Einwilligung des Patienten zur Freigabe der Bescheinigungsübermittlung an die Praxis liegt nicht vor."
* #130 "Es liegt ein Sonderfall/ eine Ausnahme vor. Bitten Sie den Patienten, mit der Krankenkasse Kontakt aufzunehmen."
* #307 "Übermittlung ist fehlgeschlagen. Grund hierfür ist, dass die KIM-Nachricht zwar als eine verschlüsselte KIM-Nachricht gekennzeichnet wurde, aber auf Grund des falschen Formats nicht von der Krankenkasse entschlüsselt werden konnte."
* #309 "Übermittlung ist fehlgeschlagen. Grund hierfür ist, dass für die KIM-Nachricht keine Signatur vorhanden ist."
* #310 "Übermittlung ist fehlgeschlagen. Grund hierfür ist, dass die Signatur für die KIM-Nachricht aufgrund des falschen Formats nicht geprüft werden konnte."
* #311 "Die Integrität der Nachricht wurde verletzt. Die Prüfung der Signatur hat ergeben, dass die Nachricht manipuliert wurde."
* #313 "Die KIM-Nachricht konnte auf Grund eines nicht verfügbaren Schlüssels nicht entschlüsselt werden."
