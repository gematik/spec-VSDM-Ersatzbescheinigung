---
parent:
---
# Erstellung und Versand KIM-Nachricht

- [Erstellung und Versand KIM-Nachricht](#erstellung-und-versand-kim-nachricht)
  - [Allgemeine Versicherungsdaten (VD)](#allgemeine-versicherungsdaten-vd)
  - [Persönliche Versichertendaten (PD)](#persönliche-versichertendaten-pd)
  - [Prüfungsnachweis für die ePA-Befugniserteilung](#prüfungsnachweis-für-die-epa-befugniserteilung)
  - [Versand der KIM-Nachricht](#versand-der-kim-nachricht)
    - [Textempfehlung für die KIM-Nachricht](#textempfehlung-für-die-kim-nachricht)
  - [Häufig gestellte Fragen zur Erstellung und zum Versand der KIM-Nachricht](#häufig-gestellte-fragen-zur-erstellung-und-zum-versand-der-kim-nachricht)
    - [Soll die Adresse der versicherten Person (VP) oder des Versicherungsnehmers (VN) übergeben werden?](#soll-die-adresse-der-versicherten-person-vp-oder-des-versicherungsnehmers-vn-übergeben-werden)
    - [Führen Anpassungen von Daten im Primärsystem auch zu einer Datenanpassung beim Versicherungsunternehmen?](#führen-anpassungen-von-daten-im-primärsystem-auch-zu-einer-datenanpassung-beim-versicherungsunternehmen)

Private Krankenversicherungen – bzw. Dienstleister in ihrem Auftrag – beziehen die für den Online Check-in (OCI) notwendigen Daten des Versicherten aus ihrem Backenendsystem und erstellen daraus eine KIM-Nachricht mit einem standardisierten Datensatz. Für diesen wird analog zur elektronischen Ersatzbescheinigung (eEB) das [VSD-Schema](https://github.com/gematik/api-telematik/blob/OPB4/fa/vsds/Schema_VSD.xsd) für gesetzlich Versicherte genutzt.

Da bei Privatversicherten nicht alle Informationen für die Befüllung der Pflichtfelder vorliegen und relevant sind, kommen bei einigen Feldern Ersatzwerte zum Einsatz:

## Allgemeine Versicherungsdaten (VD)

| Feld | Data Type | Kardinalität | Wert oder Ersatzwert | Kommentar |
| ---- | --------- | ------------ | -------------------- | --------- |
| Versicherter | |  1..1 | | |
| Versicherungsschutz | | 1..1 | | |
| Beginn | VSD:ISO8601Date | 1..1 | [Aktuelles Datum] | Datum des Versands der Nachricht |
| Ende | VSD:ISO8601Date | 0..1  |  | nicht relevant |
| Kostentraeger | VSD:Kostentraeger | 1..1 | | |
| Kostentraegerkennung | xs:integer | 1..1  |  | Institutionskennzeichen (IK) gemäß [IK-Liste](https://github.com/PKV-Verband/PKV-IK-Liste) |
| Kostentraegerlaendercode | xs:string (maxLen 3) | 1..1  |  | Kostentraegerlaendercode (siehe Anlage 8 (Staatsangehörigkeit und Länderkennzeichen für Auslandsanschriften) zur DEÜV, siehe [GKV-Rundschreiben](https://www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp)) |
| Name | VSD:Name (maxLen 45) | 1..1 | | Kostenträgername gemäß [IK-Liste](https://github.com/PKV-Verband/PKV-IK-Liste)|
| AbrechnenderKostentraeger | VSD:Kostentraeger | 0..1| | nicht relevant |
| Zusatzinfos | |  1..1 | | |
| Zusatzinfos GKV | |  1..1 | | |
| Versichertenart | VSD:codedString | 1..1 | 1 | nicht relevant |
| Zusatzinfos_Abrechnung_GKV  | | 1..1 | | |
| WOP | VSD:numberWithLeadingZero | 1..1 | 00 | nicht relevant |
| Kostenerstattung  | | 0..1 | | nicht relevant |

```xml
<?xml version="1.0" encoding="ISO-8859-15" standalone="yes"?>
<UC_AllgemeineVersicherungsdatenXML CDM_VERSION="5.2.0"
 xmlns="http://ws.gematik.de/fa/vsdm/vsd/v5.2">
 <Versicherter>
  <Versicherungsschutz>
   <Beginn>20230328</Beginn>
   <Kostentraeger>
    <Kostentraegerkennung>168141199</Kostentraegerkennung>
    <Kostentraegerlaendercode>D</Kostentraegerlaendercode>
    <Name>Muster Krankenversicherung</Name>
   </Kostentraeger>
  </Versicherungsschutz>
  <Zusatzinfos>
   <ZusatzinfosGKV>
    <Versichertenart>1</Versichertenart>
    <Zusatzinfos_Abrechnung_GKV>
     <WOP>00</WOP>
    </Zusatzinfos_Abrechnung_GKV>
   </ZusatzinfosGKV>
  </Zusatzinfos>
 </Versicherter>
</UC_AllgemeineVersicherungsdatenXML>
```

## Persönliche Versichertendaten (PD)

| Feld | Data Type | Kardinalität | Wert oder Ersatzwert | Kommentar |
| ---- | --------- | ------------ | -------------------- | --------- |
| Versicherter | | | | |
Versicherten_ID | VSD:insurantId | 1..1 | | Die Versicherten-ID ist der 10-stellige unveraenderliche Teil der 30-stelligen Krankenversichertennummer (KVNR)|
| Person | | | | |
| Vorname | VSD:name (maxLen 45) | 1..1 |  | Alle Vornamen der Person (max. 5) durch Leerzzeichen oder Bindestrich getrennt."|
| Nachname | VSD:name (maxLen 45) | 1..1 |  | Nachnamen der Person |
| Geschlecht | VSD:gender | 1..1 | | Gibt das Geschlecht des Versicherten an.<br />("M" = maennlich, "W" = weiblich, "X" = unbestimmt, "D" = divers)|
| Geburtstdatum | VSD:ISO8601Date | 1..1 |  | Geburtsdatum.<br />**Hinweis:** Mindestens das Geburtsjahr MUSS immer gefuellt werden. Ist es nicht zu ermitteln, ist „00“ bzw. „0000“ zulässig|
| Vorsatzwort | VSD:nameExtension (maxLen 20) | 0..1 |  | siehe KBV_PR_FOR_Patient|
| Namenszusatz | VSD:nameExtension (maxLen 20) | 0..1 |  | siehe KBV_PR_FOR_Patient|
| Titel | VSD:nameExtension (maxLen 20) | 0..1 |  | siehe KBV_PR_FOR_Patient|
| StrassenAdresse |  | 0..1 | | |
| Postleitzahl | xs:string (maxLen 10) | 0..1 |  | siehe KBV_PR_FOR_Patient|
| Ort | xs:string (maxLen 40) | 1..1 |  |  siehe KBV_PR_FOR_Patient|
| Strasse | xs:string (maxLen 46) | 0..1 |  |  siehe KBV_PR_FOR_Patient|
| Hausnummer | xs:string (maxLen 9) | 0..1 | |  siehe KBV_PR_FOR_Patient |
| Anschriftenzusatz | xs:string (maxLen 40) | 0..1 |  |  siehe KBV_PR_FOR_Patient|
| Land | VSD:LandType | 1..1 | | |
| Wohnsitzländercode | xs:string (maxLen 3) | 1..1 |  | Laendercode (siehe Anlage 8 (Staatsangehörigkeit und Länderkennzeichen für Auslandsanschriften) zur DEÜV, siehe [GKV-Rundschreiben](https://www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp))|
| PostfachAdresse | | 0..1 | | |
| Postleitzahl | xs:string (maxLen 10) | 0..1 |  | siehe KBV_PR_FOR_Patient|
| Ort | xs:string (maxLen 40) | 1..1 |  | siehe KBV_PR_FOR_Patient|
| Postfach | xs:string (maxLen 8) | 1..1 |  | siehe KBV_PR_FOR_Patient|
| Land | VSD:LandType | 1..1 | | |
| Wohnsitzländercode | xs:string (maxLen 3) | 1..1 |  | Laendercode (siehe Anlage 8 (Staatsangehörigkeit und Länderkennzeichen für Auslandsanschriften) zur DEÜV, siehe [GKV-Rundschreiben](https://www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp))|

Beispiel:

```xml
<?xml version="1.0" encoding="ISO-8859-15" standalone="yes"?>
<UC_PersoenlicheVersichertendatenXML CDM_VERSION="5.2.0"
 xmlns="http://ws.gematik.de/fa/vsdm/vsd/v5.2">
 <Versicherter>
  <Versicherten_ID>X587241855</Versicherten_ID>
  <Person>
   <Geburtsdatum>20050828</Geburtsdatum>
   <Vorname>Mensch</Vorname>
   <Nachname>Meier</Nachname>
   <Geschlecht>X</Geschlecht>
   <StrassenAdresse>
    <Postleitzahl>59174</Postleitzahl>
    <Ort>Kamen</Ort>
    <Land>
     <Wohnsitzlaendercode>D</Wohnsitzlaendercode>
    </Land>
    <Strasse>Luisenstraße</Strasse>
    <Hausnummer>16</Hausnummer>
   </StrassenAdresse>
  </Person>
 </Versicherter>
</UC_PersoenlicheVersichertendatenXML>
```

## Prüfungsnachweis für die ePA-Befugniserteilung

- \<TS> = Timestamp der Erstellung des Prüfungsnachweis
- \<E>  = Fester Wert `2`, ergibt sich aus der Nachnutzung des VSDM-Schemas
- \<PZ> = strukturierte und signierte Prüfziffer inkl. KVNR gemäß VSDM++, siehe Kapitel 6 in <https://fachportal.gematik.de/fachportal-import/files/gemSpec_SST_FD_VSDM_V1.7.0.pdf>

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<PN
 xmlns="http://ws.gematik.de/fa/vsdm/pnw/v1.0" CDM_VERSION="1.0.0">
 <TS>20230516070317</TS>
 <E>2</E>
 <PZ>VDA0NjE0MjQ5OTE2ODQyMjA1OTdVVDHJ+QUzgWWbfSKbps5ebyNEqmmkdVL31uM=</PZ>
</PN>
```


## Versand der KIM-Nachricht

Um Fehler zu vermeiden, sollten ausgehende Nachrichten validiert werden. Außerdem muss der Versand so gestaltet sein, dass es nicht zu vermeidbaren zeitlichen Verzögerungen kommt, die den Gesamtprozess verlängern.
Beim Versand der Bescheinigung mit der KIM-Nachricht ist im EEBMessageHeader hinterlegt (s. Element eventCoding), ob die Anfrage von einem Leistungserbringer per KIM oder vom Versicherten via App angefordert wurde. Da die Anfrage beim OCI für Privatversicherte immer per App kommt, wird das optionale Element response weggelassen, mit dem ansonsten die Referenz auf die vorangegangene EEB-Anfrage via KIM gegeben wäre.

### Textempfehlung für die KIM-Nachricht

Für eine bessere Unterscheidbarkeit der Nachrichten zum eEB-Verfahren sowie zum OCI sollte der Text in der KIM-Nachricht auf den OCI zu beziehen. Vorschlag:

> Guten Tag,
>
> bei dieser Nachricht handelt es sich um eine Datenübermittlung für den Online Check-In einer privatversicherten Person.


## Häufig gestellte Fragen zur Erstellung und zum Versand der KIM-Nachricht

### Soll die Adresse der versicherten Person (VP) oder des Versicherungsnehmers (VN) übergeben werden?

Beim Online Check-in muss zwingend eine Versicherten-Adresse übergeben werden. Optimalerweise handelt es sich dabei um die Adresse der VP. Ist nur die Adresse des VN hinterlegt, kann diese beim OCI übergeben werden. Eventuelle Abweichungen werden als akzeptabel erachtet, zumal die Problematik bereits bei Karten für Privatversicherte besteht. Ggf. kann das Praxispersonal die Adresse im Primärsystem anpassen. Zudem bietet auch die E-Rezept-App die Möglichkeit an, die Lieferadresse zu editieren, damit Arzneimittel an die erwünschte Adresse versendet werden.

### Führen Anpassungen von Daten im Primärsystem auch zu einer Datenanpassung beim Versicherungsunternehmen?

Nein, für den Prozess ist kein "Rückweg" vorgesehen. Versicherte müssen ihr Versicherungsunternehmen selbst auf Änderungen aufmerksam machen. Eine Anzeige der zu übermittelnden Daten kann jedoch dazu beitragen, dass Versicherte auf veraltete Daten aufmerksam werden.
