# VSD-Befüllung für PKV-Versicherte

Für PKV-Versicherte soll das [VSD-Schema](https://github.com/gematik/api-telematik/blob/OPB4/fa/vsds/Schema_VSD.xsd) für GKV-Versicherte nachgenutzt werden. Da nicht alle Informationen zu Pflichtfeldern bei Versicherungsunternehmen vorliegen oder in der Privatversicherung irrelevant sind, wird hier eine Übersicht zur Befüllung mit konkreten Werten bzw. Ersatzwerten angegeben.

- [VSD-Befüllung für PKV-Versicherte](#vsd-befüllung-für-pkv-versicherte)
  - [Allgemeine Versicherungsdaten (VD)](#allgemeine-versicherungsdaten-vd)
  - [Persönliche Versichertendaten (PD)](#persönliche-versichertendaten-pd)

## Allgemeine Versicherungsdaten (VD)

| Feld | Data Type | Kardinalität | Wert oder Ersatzwert | Kommentar |
| ---- | --------- | ------------ | -------------------- | --------- |
| Versicherter | |  1..1 | | |
| Versicherungsschutz | | 1..1 | | |
| Beginn | VSD:ISO8601Date | 1..1 | [Aktuelles Datum] | Datum des Versands der Nachricht |
| Ende | VSD:ISO8601Date | 0..1  |  | nicht relevant |
| Kostentraeger | VSD:Kostentraeger | 1..1 | | |
| Kostentraegerkennung | xs:integer | 1..1  |  | Institutionskennzeichen (IK) gemäß [IK-Liste](https://github.com/PKV-Verband/PKV-IK-Liste) |
| Kostentraegerlaendercode | xs:string (maxLen 3) | 1..1  |  | Kostentraegerlaendercode (siehe Anlage 8 (Staatsangehörigkeit und Länderkennzeichen für Auslandsanschriften) zur DEÜV, siehe www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp) |
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
| Wohnsitzländercode | xs:string (maxLen 3) | 1..1 |  | Laendercode (siehe Anlage 8 (Staatsangehörigkeit und Länderkennzeichen für Auslandsanschriften) zur DEÜV, siehe www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp)|
| PostfachAdresse | | 0..1 | | |
| Postleitzahl | xs:string (maxLen 10) | 0..1 |  | siehe KBV_PR_FOR_Patient|
| Ort | xs:string (maxLen 40) | 1..1 |  | siehe KBV_PR_FOR_Patient|
| Postfach | xs:string (maxLen 8) | 1..1 |  | siehe KBV_PR_FOR_Patient|
| Land | VSD:LandType | 1..1 | | |
| Wohnsitzländercode | xs:string (maxLen 3) | 1..1 |  | Laendercode (siehe Anlage 8 (Staatsangehörigkeit und Länderkennzeichen für Auslandsanschriften) zur DEÜV, siehe www.gkv-datenaustausch.de/arbeitgeber/deuev/gemeinsame_rundschreiben/gemeinsame_rundschreiben.jsp)|

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
  </Person>
 </Versicherter>
</UC_PersoenlicheVersichertendatenXML>
```
