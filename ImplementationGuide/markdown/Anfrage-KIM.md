# Inhalt

Bei der Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM wird durch das Praxispersonal initiiert. Kann eine zu behandelnde Person keine Gesundheitskarte als Versicherungsnachweis vorlegen, erfolgt eine Anfrage einer Ersatzbescheinigung bei der von der Person benannten oder bereits im System bekannten Krankenkasse. Damit die Kasse die versicherte Person in ihrem Bestandssystem identifizieren kann, müssen der Anfrage personenbezogene Daten mitgegeben werden.

- [Inhalt](#inhalt)
  - [Erfassung personenbezogener Daten](#erfassung-personenbezogener-daten)
    - [Patient ist im PVS bekannt](#patient-ist-im-pvs-bekannt)
    - [Patient ist im PVS unbekannt](#patient-ist-im-pvs-unbekannt)
  - [Angaben zur anfragenden Praxis](#angaben-zur-anfragenden-praxis)
  - [KIM-Empfängeradresse der Krankenkasse](#kim-empfängeradresse-der-krankenkasse)
  - [Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM](#anforderung-zur-ausstellung-einer-ersatzbescheinigung-via-kim)
    - [Anfrage Bundle](#anfrage-bundle)
    - [KIM-Nachricht (Beispiel)](#kim-nachricht-beispiel)

## Erfassung personenbezogener Daten

Bei der Abfrage nach einer Ersatzbescheinigung zu einer Person sind zwei Fälle zu unterscheiden, ist die 10-stellige Krankenversicherungsnummer `KVNR` der Person bekannt oder unbekannt. Da diese `KVNR` für eine Person (i.d.R.) lebenslang gültig ist, ergibt sich die Antwort aus der Frage, ob der Patient in dieser Praxis in der Vergangenheit bereits einmal vorstellig war.

### Patient ist im PVS bekannt

Um der Kasse Hilfe zum Auffinden der versicherten Person in ihrem Bestandssystem zu geben, müssen personenbezogene Informationen in einer FHIR-Ressource `Patient` mitgegeben werden. Ist die Person bereits im PVS als Patient hinterlegt, genügt ein Eintrag in einer `KnownPatient`-Ressource mit Angabe der `kvnr` im `identifier`. Weitere Angaben sind optional.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/KnownPatient}}

### Patient ist im PVS unbekannt

Ist die zu behandelnde Person als Patient im PVS unbekannt, sind Angaben in einer `UnknownPatient`-Ressource erforderlich. `name`, Ẁohn`address` und `birthDate` sind dabei mindestens anzugeben, um eine Suche in den Systemen der Kasse zu ermöglichen.

{{tree:https://gematik.de/fhir/eeb/StructureDefinition/UnknownPatient}}

## Angaben zur anfragenden Praxis

Die Kasse benötigt für die Ausstellung einer Ersatzbescheinigung Informationen über die anfragende Praxis, um das Ausstellen von "Blanko"-Bescheinigungen zu unterbinden. Dazu muss jeder Anfrage eine FHIR-Ressource `Organization` des Profils [KBV_PR_FOR_Organization](https://simplifier.net/for/kbvprfororganization "KBV formularübergreifende Festlegungen") mitgegeben werden. Die Angaben zur `address` und `telecom`-Kontaktinformationen für Rückfragen sind dabei mindestens anzugeben.

<iframe src="https://www.simplifier.net/embed/render?id=for/kbvprfororganization" style="width: 100%;height: 320px;"></iframe>

## KIM-Empfängeradresse der Krankenkasse

Die Suche nach der KIM-Empfängeradresse der Kasse erfolgt im zentralen Verzeichnisdienst VZD mittels LDAP-Query und kann über das KIM-Clientmodul oder direkt durch das PVS über den Konnektor erfolgen. Folgendes Beispiel für einen Konsolenaufruf mittels `ldapsearch` im VZD der TI-Referenzumgebung RU mit der Suche nach einer Krankenkasse OID=`1.2.276.0.76.4.59` und Teil des Namens `Techniker` in einem kombinierten LDAP-Filter `(&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))`:

    $ ldapsearch -h directory-ref.vzd.telematik-test -p 1636 -Z -X -b dc=data,dc=vzd  "(&(professionOID=1.2.276.0.76.4.59)(displayName=Techniker*))"

Diese liefert folgendes Ergebnis

> TODO Hendrik

Details und weitere Hinweise zur Suche finden sich in der [API-Beschreibung zum VZD](https://github.com/gematik/api-vzd/blob/main/docs/LDAP_Search.adoc#suche-bei-bekanntem-namen).

## Anforderung zur Ausstellung einer Ersatzbescheinigung via KIM

Liegen alle Informationen im PVS vor, werden diese in einer FHIR-Ressource `EEBAnfrageBundle` zusammengestellt und als Anhang einer KIM-Nachricht an die Kasse gesendet.

### Anfrage Bundle

> TODO Hendrik

### KIM-Nachricht (Beispiel)

> TODO eHex
