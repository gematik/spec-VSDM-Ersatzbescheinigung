# Inhalt

Bei der Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM wird durch das Praxispersonal initiiert. Kann eine zu behandelnde Person keine Gesundheitskarte als Versicherungsnachweis vorlegen, erfolgt eine Anfrage einer Ersatzbescheinigung bei der von der Person benannten oder bereits im System bekannten Krankenkasse. Damit die Kasse die versicherte Person in ihrem Bestandssystem identifizieren kann, müssen der Anfrage personenbezogene Daten mitgegeben werden.

- [Inhalt](#inhalt)
  - [Erfassung personenbezogener Daten](#erfassung-personenbezogener-daten)
    - [Patient ist im PVS bekannt](#patient-ist-im-pvs-bekannt)
    - [Patient ist im PVS unbekannt](#patient-ist-im-pvs-unbekannt)
  - [Angaben zur anfragenden Praxis](#angaben-zur-anfragenden-praxis)
  - [KIM-Empfängeradresse der Krankenkasse](#kim-empfängeradresse-der-krankenkasse)
  - [Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM](#anforderung-zur-ausstellung-einer-ersatzbescheinigung-via-kim)

## Erfassung personenbezogener Daten

Bei der Abfrage nach einer Ersatzbescheinigung zu einer Person sind zwei Fälle zu unterscheiden, ist die 10-stellige Krankenversicherungsnummer `KVNR` der Person bekannt oder unbekannt. Da diese `KVNR` für eine Person (i.d.R.) lebenslang gültig ist, ergibt sich die Antwort aus der Frage, ob der Patient in dieser Praxis in der Vergangenheit bereits einmal vorstellig war.

### Patient ist im PVS bekannt

Um der Kasse Hilfe zum Auffinden der versicherten Person in ihrem Bestandssystem zu geben, müssen personenbezogene Informationen in einer FHIR-Ressource `Patient` mitgegeben werden. Ist die Person bereits im PVS als Patient hinterlegt, genügt ein Eintrag in einer `KnownPatient`-Ressource mit Angabe der `kvnr` im `identifier`. Weitere Angaben sind optional.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/KnownPatient}}

### Patient ist im PVS unbekannt

Ist die zu behandelnde Person als Patient im PVS unbekannt, sind Angaben in einer `UnknownPatient`-Ressource erforderlich. `name`, Ẁohn`address` und `birthDate` sind dabei mindestens anzugeben, um eine Suche in den Systemen der Kasse zu ermöglichen.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/UnknownPatient}}

## Angaben zur anfragenden Praxis

## KIM-Empfängeradresse der Krankenkasse

## Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM
